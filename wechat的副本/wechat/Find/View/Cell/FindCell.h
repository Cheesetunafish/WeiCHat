//
//  FindCell.h
//  wechat
//
//  Created by 小艾同学 on 2022/6/12.
//

#import "MenuView.h"
#import "PhotoContainerView.h"
#import "CommentView.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SDTimeLineCellDelegate <NSObject>

// 点击cell按钮
- (void)didClickLikeButtonInCell:(UITableViewCell *)cell;
// 索引点击
- (void)didClickcCommentButtonInCell:(UITableViewCell *)cell with:(NSIndexPath *)indexPath;

@end

@class CellModel;

@interface FindCell : UITableViewCell

@property (nonatomic, weak) id<SDTimeLineCellDelegate> delegate;

@property (nonatomic, strong) CellModel *model;

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, copy) void (^moreButtonClickedBlock)(NSIndexPath *indexPath);

@property (nonatomic, copy) void (^didClickCommentLabelBlock)(NSString *commentId, CGRect rectInWindow, NSIndexPath *indexPath);

// 头像
@property (nonatomic, strong) UIImageView *imgView;

// 用户名
@property (nonatomic, strong) UILabel *title;

// 内容图片
@property (nonatomic, strong) PhotoContainerView *containerView;

// 内容文字
@property (nonatomic, strong) UILabel *content;

// 按钮
@property (nonatomic, strong) UIButton *moreBtn;    // 展开折叠文字内容
// 操作按钮
@property (nonatomic, strong) MenuView *operationButton;    // 展开点赞和评论按钮
@property (nonatomic, strong) CommentView *commentView;
// like
@property (nonatomic, strong) UIButton *likeButton;
// comment
@property (nonatomic, strong) UIButton *commentButton;


- (void)Position;
//- (void)moreButtonClicked;

@end

NS_ASSUME_NONNULL_END
