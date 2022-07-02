//
//  MineTopView.m
//  wechat
//
//  Created by 小艾同学 on 2022/7/2.
//

#import "MineTopView.h"
#import "Masonry.h"
#import "UIView+RoundCorner.h"
@implementation MineTopView

- (instancetype)init {
    if (self = [super init]) {
        [self addSubview:self.imgView];
        [self addSubview:self.chatNumber];
        [self addSubview:self.title];
        self.backgroundColor = [UIColor whiteColor];
        [self position];
    }
    return self;
}


- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView new];
        _imgView.layer.cornerRadius = 15;
        _imgView.backgroundColor = [UIColor systemBlueColor];
        _imgView.clipsToBounds = YES;
        NSData *cnt = [NSUserDefaults.standardUserDefaults objectForKey:@"userImage"];
        _imgView.image = [UIImage imageWithData:cnt];
    }
    return _imgView;
}
- (UILabel *)title {
    if (!_title) {
        _title = [UILabel new];
        _title.font = [UIFont boldSystemFontOfSize:20];
        _title.text = @"小艾同学在轨道";
//        _title.backgroundColor = [UIColor systemBlueColor];
        
    }
    return _title;
}
- (UILabel *)chatNumber {
    if (!_chatNumber) {
        _chatNumber = [UILabel new];
        NSString *cnt = [NSUserDefaults.standardUserDefaults objectForKey:@"userAccount"];
        _chatNumber.text = [NSString stringWithFormat:@"微信号：%@",cnt];
        _chatNumber.font = [UIFont systemFontOfSize:15];
//        _chatNumber.backgroundColor = [UIColor systemBlueColor];
        _chatNumber.textColor = [UIColor systemGrayColor];
    }
    return _chatNumber;
}

- (void)position {
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).mas_offset(20);
        make.top.equalTo(self).mas_offset(20);
        make.centerY.equalTo(self);
        make.width.equalTo(self.imgView.mas_height);
        make.height.mas_equalTo(100);
    }];
    
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imgView.mas_right).mas_offset(20);
        make.top.equalTo(self.imgView);
        make.width.mas_equalTo(200);
    }];
    
    [self.chatNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.title.mas_bottom).mas_offset(10);
        make.left.equalTo(self.title);
        make.width.mas_equalTo(200);
    }];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
