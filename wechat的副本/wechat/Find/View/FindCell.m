//
//  FindCell.m
//  wechat
//
//  Created by 小艾同学 on 2022/6/12.
//

#import "FindCell.h"
#import "Masonry.h"

@implementation FindCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.title];
        [self.contentView addSubview:self.imgView];
        [self.contentView addSubview:self.contentImg];
        [self.contentView addSubview:self.content];
        [self.contentView addSubview:self.likeBtn];
        [self.contentView addSubview:self.commentBtn];
        [self Position];
    }
    return self;
}

- (UILabel *)title {
    if (_title == nil) {
        _title = [[UILabel alloc] init];
        _title.backgroundColor = [UIColor systemGray6Color];
        _title.textColor = [UIColor systemBlueColor];
    }
    return _title;
}
// 头像
- (UIImageView *)imgView {
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc] init];
        _imgView.backgroundColor = [UIColor systemGrayColor];
    }
    return _imgView;
}
// 内容
- (UILabel *)content {
    if (_content == nil) {
        _content = [[UILabel alloc] init];
        _content.numberOfLines = 0;
//        _content.backgroundColor = [UIColor systemGrayColor];
    }
    return _content;
}
// 图片
- (UIImageView *)contentImg {
    if (_contentImg == nil) {
        _contentImg = [[UIImageView alloc] init];
//        _contentImg.backgroundColor = [UIColor systemGrayColor];
    }
    return _contentImg;
}
// 按钮
- (UIButton *)likeBtn {
    if (_likeBtn == nil) {
        _likeBtn = [[UIButton alloc] init];
        [_likeBtn setImage:[UIImage imageNamed:@"like"] forState:UIControlStateNormal];
    }
    return _likeBtn;
}

- (void)Position {
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).mas_offset(20);
        make.top.equalTo(self).mas_offset(20);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
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
    
    [self.contentImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.content);
        make.top.equalTo(self.content.mas_bottom).mas_offset(10);
//        make.centerX.equalTo(self);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(80);
    }];
}

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
