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

@protocol operationCellDelegate <NSObject>

// 点击like按钮
- (void)didClickLikeButtonInCell:(UITableViewCell *)cell;
// 点击comment按钮
- (void)didClickcCommentButtonInCell:(UITableViewCell *)cell with:(NSIndexPath *)indexPath;

@end

@class CellModel;

@interface FindCell : UITableViewCell

@property (nonatomic, weak) id<operationCellDelegate> delegate;

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

// 展开全文按钮
@property (nonatomic, strong) UIButton *moreBtn;
// 操作按钮
@property (nonatomic, strong) UIButton *operationButton;
// 评论view
@property (nonatomic, strong) CommentView *commentView;
// like
@property (nonatomic, strong) UIButton *likeButton; // 点赞按钮
// comment
@property (nonatomic, strong) UIButton *commentButton;  // 评论按钮
// 操作界面
@property (nonatomic, strong) MenuView *operationMenu;

- (void)Position;
- (void)moreButtonClicked;

@end

NS_ASSUME_NONNULL_END
