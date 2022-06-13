//
//  BannerView.h
//  wechat
//
//  Created by 小艾同学 on 2022/6/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BannerView : UIView
//图片
@property (nonatomic, strong) UIImageView *bannerImg;
//用户头像
@property (nonatomic, strong) UIImageView *userImg;
//用户名称
@property (nonatomic, strong) UILabel *userName;

- (void)setPosition;

@end

NS_ASSUME_NONNULL_END
