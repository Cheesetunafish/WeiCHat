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

@protocol FindCellDelegate <NSObject>

// 点击like按钮
- (void)didClickedLikeButtonInCell:(UITableViewCell *)cell with:(NSIndexPath *)indexPath;
// 点击comment按钮
- (void)didClickedCommentButtonInCell:(UITableViewCell *)cell with:(NSIndexPath *)indexPath;

@end

@class CellModel;

@interface FindCell : UITableViewCell

@property (nonatomic, weak) id<FindCellDelegate> delegate;

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
// like按钮
//@property (nonatomic, strong) UIButton *likeBtn;
// comment按钮
//@property (nonatomic, strong) UIButton *commentBtn;
// 操作界面
@property (nonatomic, strong) MenuView *operationMenu;

- (void)Position;
- (void)moreButtonClicked;

@end

NS_ASSUME_NONNULL_END
