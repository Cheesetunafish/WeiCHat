//
//  MineTopView.h
//  wechat
//
//  Created by 小艾同学 on 2022/7/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MineTopView : UIView

@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *chatNumber;
@property (nonatomic, strong) UIImageView *imgView;

- (void)position;
@end

NS_ASSUME_NONNULL_END
