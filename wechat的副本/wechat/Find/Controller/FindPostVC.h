//
//  FindPostVC.h
//  wechat
//
//  Created by 小艾同学 on 2022/6/15.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol postViewDelegate <NSObject>

@optional

- (void) didClickedCancelButton;
- (void) didClickedPostButton;

@end

@interface FindPostVC : ViewController

@property (nonatomic, weak) id<postViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
