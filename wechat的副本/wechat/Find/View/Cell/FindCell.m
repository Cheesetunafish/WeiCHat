//
//  FindCell.m
//  wechat
//
//  Created by 小艾同学 on 2022/6/12.
//

#import "FindCell.h"
#import "CellModel.h"
//TOol
#import "Masonry.h"
#import "UIView+SDAutoLayout.h"
#import <SDAutoLayout.h>
#import <UIView+SDAutoLayout.h>
#import <UITableView+SDAutoTableViewCellHeight.h>


NSString *const kSDTimeLineCellOperationButtonClickedNotification = @"SDTimeLineCellOperationButtonClickedNotification";

const CGFloat contentLabelFontSize = 15;

CGFloat maxContentLabelHeight = 50; // 根据具体font而定


@implementation FindCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.title];
        [self.contentView addSubview:self.imgView];
//        [self.contentView addSubview:self.contentImg];
        [self.contentView addSubview:self.content];
        [self.contentView addSubview:self.moreBtn];
//        [self.contentView addSubview:self.likeBtn];
//        [self.contentView addSubview:self.commentBtn];
        [self Position];
        //  高度自适应
        [super layoutSubviews];
        [self.content sizeToFit];
    }
    return self;
}


#pragma mark- get
// 用户名
- (UILabel *)title {
    if (_title == nil) {
        _title = [[UILabel alloc] init];
        _title.textColor = [UIColor blueColor];
    }
    return _title;
}
// 头像图片
- (UIImageView *)imgView {
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc] init];
    }
    return _imgView;
}
// 文字内容
- (UILabel *)content {
    if (_content == nil) {
        _content = [[UILabel alloc] init];
        _content.numberOfLines = 0;
        [_content sizeToFit];   // 高度自适应
    }
    return _content;
}
// 图片
//- (UIImageView *)contentImg {
//    if (_contentImg == nil) {
//        _contentImg = [[UIImageView alloc] init];
//        _contentImg.backgroundColor = [UIColor systemGrayColor];
//    }
//    return _contentImg;
//}

// 点赞按钮
//- (UIButton *)likeBtn {
//    if (_likeBtn == nil) {
//        _likeBtn = [[UIButton alloc] init];
//        [_likeBtn setImage:[UIImage imageNamed:@"like"] forState:UIControlStateNormal];
//    }
//    return _likeBtn;
//}

// 评论View
- (CommentView *)commentView {
    if (_commentView == nil) {
        __weak typeof(self) weakSelf = self;
        _commentView = [CommentView new];
        [_commentView setDidClickCommentLabelBlock:^(NSString * _Nonnull commentId, CGRect rectInWindow) {
                    NSLog(@"设置了commentView，点击commentlabelblock");
            weakSelf.didClickCommentLabelBlock(commentId, rectInWindow, weakSelf.indexPath);
        }];
    }
    return _commentView;
}

// moreBtn展开全文按钮
- (UIButton *)moreBtn {
    if (_moreBtn == nil) {
        _moreBtn = [[UIButton alloc] init];
        [_moreBtn setTitle:@"全文" forState:UIControlStateNormal];
        [_moreBtn setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
        [_moreBtn addTarget:self action:@selector(moreButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        _moreBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _moreBtn;
}

// 操作菜单按钮
- (UIButton *)operationButton {
    if (_operationButton == nil) {
        _operationButton = [[UIButton alloc] init];
        [_operationButton setImage:[UIImage imageNamed:@"AlbumOperateMore"] forState:UIControlStateNormal];
        
        [_operationButton addTarget:self action:@selector(operationButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _operationButton;
}


// 布局
- (void)Position {
    // Masonry
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).mas_offset(15);
        make.top.equalTo(self).mas_offset(20);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imgView.mas_right).mas_offset(10);
        make.top.equalTo(self.imgView);
    }];
    
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.title);
        make.top.equalTo(self.title.mas_bottom).mas_offset(0);
        make.right.equalTo(self).mas_offset(-40);
        make.height.mas_equalTo(50);
    }];
    
//    [self.contentImg mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.content);
//        make.top.equalTo(self.content.mas_bottom).mas_offset(10);
//        make.centerX.equalTo(self);
//        make.width.mas_equalTo(80);
//        make.height.mas_equalTo(80);
//    }];
    
    // SDLayout
    [self.title setSingleLineAutoResizeWithMaxWidth:200];   // 宽度最大值
    self.content.sd_layout.autoHeightRatio(0);  // 文字自适应
    self.moreBtn.sd_layout.leftEqualToView(self.content).topSpaceToView(self.content, 0).widthIs(30);
}


#pragma mark- set
- (void)setModel:(CellModel *)model {
    _model = model;
    // 设置数据
    [_commentView setupWithLikeItemsArray:model.likeItemsArray commentItemsArray:model.commentItemsArray];  // 设置评论和点赞内容
    _imgView.image = [UIImage imageNamed:model.iconName];   // 头像
    _title.text = model.name;   // 用户名
    _content.text = model.msgContent;   // 内容
//    _containerView    // 发布的图片合集
    
    if (model.shouldShowMoreButton) {   // BOOL如果需要展开
        _moreBtn.sd_layout.heightIs(20);
        _moreBtn.hidden = NO;
        if (model.isOpening) {  // 如果是展开状态
            _content.sd_layout.maxHeightIs(MAXFLOAT);
            [_moreBtn setTitle:@"收起" forState:UIControlStateNormal];
        }
        else {  // 没有展开
            _content.sd_layout.maxHeightIs(maxContentLabelHeight);
            [_moreBtn setTitle:@"全文" forState:UIControlStateNormal];
        }
    }
    else {  // 不需要展开
        _moreBtn.sd_layout.heightIs(0);
        _moreBtn.hidden = YES;
    }
}


#pragma mark- 方法

- (void)moreButtonClicked {
    if (self.moreButtonClickedBlock) {
        self.moreButtonClickedBlock(self.indexPath);
//        NSLog(@"FindCell中的按钮点击方法执行完毕%@",self.indexPath);
    }
}



@end
