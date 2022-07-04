//
//  MenuView.h
//  wechat
//
//  Created by 小艾同学 on 2022/6/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MenuView : UIView

// 判断显示状态
@property (nonatomic, assign, getter=isShowing) BOOL show;

// 点击点赞按钮block
@property (nonatomic, copy) void(^likeButtonClickedOperation)(void);
// 点击评论按钮block
@property (nonatomic, copy) void(^commentButtonClickedOperation)(void);

// 点赞按钮
@property (nonatomic, strong) UIButton *likeButton;
// 评论按钮
@property (nonatomic, strong) UIButton *commentButton;

- (void)setPositon;
@end

NS_ASSUME_NONNULL_END
