//
//  CommentView.h
//  wechat
//
//  Created by 小艾同学 on 2022/6/20.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface CommentView : UIView

@property (nonatomic, copy) void (^didClickCommentLabelBlock)(NSString *commentId, CGRect rectInWindow);

- (void)setupWithLikeItemsArray:(NSArray *)likeItemsArray commentItemsArray:(NSArray *)commentItemsArray;

@end

NS_ASSUME_NONNULL_END
