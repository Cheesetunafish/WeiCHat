//
//  TopView.m
//  wechat
//
//  Created by 小艾同学 on 2022/6/14.
//

#import "TopView.h"
#import "Masonry.h"
@implementation TopView


- (instancetype)init {
    self = [super init];
    if (self) {
        [self addSubview:self.addBtn];
        [self setBtn];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (UIButton *)addBtn {
    if (_addBtn == nil) {
        _addBtn = [[UIButton alloc] init];
//        [_addBtn setBackgroundColor:[UIColor blackColor]];
        [_addBtn setImage:[UIImage imageNamed:@"iShot2022-06-14_10.56.28"] forState:UIControlStateNormal];
    }
    return _addBtn;
}

- (void)setBtn {
    [self.addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).mas_offset(-10);
        make.top.equalTo(self).mas_offset(55);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
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
