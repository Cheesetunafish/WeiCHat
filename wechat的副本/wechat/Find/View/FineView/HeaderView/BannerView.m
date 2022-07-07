//
//  BannerView.m
//  wechat
//
//  Created by 小艾同学 on 2022/6/12.
//

#import "BannerView.h"
//Tool
#import "Masonry.h"
#import "UIView+RoundCorner.h"
#import "MJRefresh.h"
@implementation BannerView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addSubview:self.bannerImg];
        [self addSubview:self.userImg];
        [self addSubview:self.userName];
        [self setPosition];
    }
    return self;
}

- (void)setPosition {
    [self.userImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).mas_offset(-10);
        make.bottom.equalTo(self).mas_offset(20);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(70);
    }];
    [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.userImg.mas_left).mas_offset(-10);
        make.bottom.equalTo(self).mas_offset(-10);
    }];
    [self.bannerImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
    }];
}

- (UIImageView *)bannerImg {
    if (_bannerImg == nil) {
        _bannerImg = [[UIImageView alloc] init];
//        _bannerImg.backgroundColor = [UIColor systemGray3Color];
        _bannerImg.image = [UIImage imageNamed:@"banner"];
    }
    return _bannerImg;
}

- (UIImageView *)userImg {
    if (_userImg == nil) {
        _userImg = [[UIImageView alloc] init];
//        _userImg.backgroundColor = [UIColor systemGrayColor];
        _userImg.image = [UIImage imageNamed:@"userImg"];
        NSDate *cnt = [NSUserDefaults.standardUserDefaults objectForKey:@"userImage"];
        _userImg.image = [UIImage imageWithData:cnt];
    }
    return _userImg;
}

- (UILabel *)userName {
    if (_userName == nil) {
        _userName = [[UILabel alloc] init];
        _userName.text = @"小艾同学在轨道";
        _userName.textColor = [UIColor whiteColor];
        _userName.font = [UIFont boldSystemFontOfSize:20];
    }
    return _userName;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
