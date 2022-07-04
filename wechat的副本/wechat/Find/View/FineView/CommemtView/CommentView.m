//
//  CommentView.m
//  wechat
//
//  Created by 小艾同学 on 2022/6/20.
//

#import "CommentView.h"
#import "UIView+SDAutoLayout.h"
#import "CellModel.h"

@interface CommentView()

// 点赞数组
@property (nonatomic, strong) NSArray *likeItemsArray;
// 评论数组
@property (nonatomic, strong) NSArray *commentItemsArray;
// 背景图片框
@property (nonatomic, strong) UIImageView *bgImageView;
//
@property (nonatomic, strong) UIView *likeLabelBottomLine;
// 评论label
@property (nonatomic, strong) NSMutableArray *commentLabelsArray;
// 点赞label
@property (nonatomic, strong) UILabel *likeLabel;
@end

@implementation CommentView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:_bgImageView];
        [self addSubview:_likeLabel];
        [self addSubview:_likeLabelBottomLine];
        self.backgroundColor = [UIColor whiteColor];
        [self setLayout];
//        [self setup];
    }
    return self;
}

- (UIImageView *)bgImageView {
    if (_bgImageView == nil) {
        _bgImageView = [[UIImageView alloc]init];
        UIImage *bgImage = [[[UIImage imageNamed:@"LikeCmtBg"] stretchableImageWithLeftCapWidth:40 topCapHeight:30] imageWithRenderingMode:UIImageRenderingModeAutomatic];
        _bgImageView.image = bgImage;
        _bgImageView.backgroundColor = [UIColor clearColor];
    }
    return _bgImageView;
}

- (UILabel *)likeLabel {
    if (_likeLabel == nil) {
        _likeLabel = [[UILabel alloc]init];
        _likeLabel.font = [UIFont systemFontOfSize:14];
        _likeLabel.isAttributedContent = YES;
    }
    return _likeLabel;
}

- (UIView *)likeLabelBottomLine {
    if (_likeLabelBottomLine == nil) {
        _likeLabelBottomLine = [UIView new];
    }
    return _likeLabelBottomLine;
}

- (void)setLayout {
    self.bgImageView.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
}

- (void)setCommentItemsArray:(NSArray *)commentItemsArray {
    _commentItemsArray = commentItemsArray;
    
    long originalLabelsCount = self.commentLabelsArray.count;
    long needsToAddCount = commentItemsArray.count > originalLabelsCount ? (commentItemsArray.count - originalLabelsCount) : 0;
    for (int i = 0; i < needsToAddCount; i++) {
        UILabel *label = [UILabel new];
        label.font = [UIFont systemFontOfSize:14];
        [self addSubview:label];
        [self.commentLabelsArray addObject:label];
    }
    
    for (int i = 0; i < commentItemsArray.count; i++) {
        CellLikeItemModel *model = commentItemsArray[i];
        UILabel *label = self.commentLabelsArray[i];
        if (model.attributedContent == nil) {
            model.attributedContent = [self generateAttributedStringWithLikeItemModel:model];
        }
        label.attributedText = model.attributedContent;
    }
}

- (void)setLikeItemsArray:(NSArray *)likeItemsArray {
    _likeItemsArray = likeItemsArray;
    
    NSTextAttachment *attach = [NSTextAttachment new];
    attach.image = [UIImage imageNamed:@"Like"];
    attach.bounds = CGRectMake(0, -3, 16, 16);
    NSAttributedString *likeIcon = [NSAttributedString attributedStringWithAttachment:attach];
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithAttributedString:likeIcon];
    
    for (int i = 0; i < likeItemsArray.count; i++) {
        CellLikeItemModel *model = likeItemsArray[i];
        if (i > 0) {
            [attributedText appendAttributedString:[[NSAttributedString alloc] initWithString:@"，"]];
        }
        if (!model.attributedContent) {
            model.attributedContent = [self generateAttributedStringWithLikeItemModel:model];
        }
        [attributedText appendAttributedString:model.attributedContent];
    }
    
    _likeLabel.attributedText = [attributedText copy];
}

- (NSMutableArray *)commentLabelsArray {
    if (_commentLabelsArray == nil) {
        _commentLabelsArray = [[NSMutableArray alloc] init];
    }
    return _commentLabelsArray;
}

// like
- (void)setupWithLikeItemsArray:(NSArray *)likeItemsArray commentItemsArray:(NSArray *)commentItemsArray {
    self.likeItemsArray = likeItemsArray;
    self.commentItemsArray = commentItemsArray;
    
    if (self.commentLabelsArray.count) {
        [self.commentLabelsArray enumerateObjectsUsingBlock:^(UILabel *label, NSUInteger idx, BOOL *stop) {
            [label sd_clearAutoLayoutSettings];
            label.hidden = YES;  //重用时先隐藏评论label，然后根据评论个数显示label
        }];
    }
    
    // 没有评论&&没有点赞
    if (!commentItemsArray.count && !likeItemsArray.count) {
        self.fixedWidth = @(0); // 如果没有评论或者点赞，设置commentview的固定宽度为0（设置了fixedWith的控件将不再在自动布局过程中调整宽度）
        self.fixedHeight = @(0); // 如果没有评论或者点赞，设置commentview的固定高度为0（设置了fixedHeight的控件将不再在自动布局过程中调整高度）
        return;
    } else {
        self.fixedHeight = nil; // 取消固定宽度约束
        self.fixedWidth = nil; // 取消固定高度约束
    }
    
    CGFloat margin = 5;
    UIView *lastTopView = nil;
    
    if (likeItemsArray.count) {
        _likeLabel.sd_resetLayout.leftSpaceToView(self, margin).rightSpaceToView(self, margin).topSpaceToView(lastTopView, 10).autoHeightRatio(0);
        
        lastTopView = _likeLabel;
    } else {
        _likeLabel.attributedText = nil;
        _likeLabel.sd_resetLayout.heightIs(0);
    }
    
    //已存在点赞
    if (self.commentItemsArray.count && self.likeItemsArray.count) {
        _likeLabelBottomLine.sd_resetLayout.leftSpaceToView(self, 0).rightSpaceToView(self, 0).heightIs(1).topSpaceToView(lastTopView, 3);
        
        lastTopView = _likeLabelBottomLine;
    } else {
        _likeLabelBottomLine.sd_resetLayout.heightIs(0);
    }
    
    for (int i = 0; i < self.commentItemsArray.count; i++) {
        UILabel *label = (UILabel *)self.commentLabelsArray[i];
        label.hidden = NO;
        CGFloat topMargin = (i == 0 && likeItemsArray.count == 0) ? 10 : 5;
        
        label.sd_layout.leftSpaceToView(self, 8).rightSpaceToView(self, 5).topSpaceToView(lastTopView, topMargin).autoHeightRatio(0);
        
        label.isAttributedContent = YES;
        lastTopView = label;
    }
    
    [self setupAutoHeightWithBottomView:lastTopView bottomMargin:6];
    
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
}


// 回复文字样式
- (NSMutableAttributedString *)generateAttributedStringWithCommentItemModel:(CellCommentItemModel *)model {
    NSString *text = model.firstUserName;
    if (model.secondUserName.length) {
        text = [text stringByAppendingString:[NSString stringWithFormat:@"回复%@", model.secondUserName]];
    }
    
    text = [text stringByAppendingString:[NSString stringWithFormat:@"：%@", model.commentString]];
    
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:text];
    [attString setAttributes:@{NSLinkAttributeName : model.firstUserId} range:[text rangeOfString:model.firstUserName]];
    if (model.secondUserName) {
        [attString setAttributes:@{NSLinkAttributeName : model.secondUserId} range:[text rangeOfString:model.secondUserName]];
    }
    return attString;
}

// like样式
- (NSMutableAttributedString *)generateAttributedStringWithLikeItemModel:(CellLikeItemModel *)model {
    NSString *text = model.userName;
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:text];
    UIColor *highLightColor = [UIColor blueColor];
    [attString setAttributes:@{NSForegroundColorAttributeName : highLightColor, NSLinkAttributeName : model.userId} range:[text rangeOfString:model.userName]];
    return attString;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
