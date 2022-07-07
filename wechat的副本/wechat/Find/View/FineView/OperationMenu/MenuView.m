//
//  MenuView.m
//  wechat
//
//  Created by 小艾同学 on 2022/6/21.
//

#import "MenuView.h"
//tool
#import "UIView+SDAutoLayout.h"
#import "Masonry.h"

@implementation MenuView{
    UIView *_line;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 5;
        
        self.backgroundColor = [UIColor systemGrayColor];
        [self addSubview:self.likeButton];
        [self addSubview:self.commentButton];
        _line = [UIView new];
        _line.backgroundColor = [UIColor systemGray3Color];    // 分界线
        [self addSubview:_line];
        
        [self setPositon];
    }
    return self;
}



- (UIButton *)likeButton {
    if (_likeButton == nil) {
        _likeButton = [[UIButton alloc] init];
        _likeButton = [self newButtonWithTitle:@"" Image:[UIImage imageNamed:@"heart"] Target:self Selector:@selector(likeButtonClickedOperation)];
        _likeButton.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _likeButton;
}

- (UIButton *)commentButton {
    if (_commentButton == nil) {
        _commentButton = [[UIButton alloc] init];
        _commentButton = [self newButtonWithTitle:@"" Image:[UIImage imageNamed:@"bubble.left"] Target:self Selector:@selector(commentButtonClickedOperation)];
//        _commentButton.backgroundColor = [UIColor blueColor];
        _commentButton.titleLabel.font = [UIFont systemFontOfSize:10];
    }
    return _commentButton;
}

- (void)setPositon {
    [self.commentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).mas_offset(-15);
        make.centerY.equalTo(self);
        make.width.mas_equalTo(20);
        make.height.equalTo(self);
    }];
    
    [self.likeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).mas_offset(15);
        make.centerY.equalTo(self);
        make.width.mas_equalTo(20);
        make.height.equalTo(self);
    }];
    
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self);
        make.top.equalTo(self).mas_offset(2);
        make.bottom.equalTo(self).mas_offset(2);
        make.height.equalTo(self);
        make.width.mas_equalTo(1);
    }];
}

// 快捷创建方法
- (UIButton *)newButtonWithTitle:(NSString *)title Image:(UIImage *)image Target:(id)target Selector:(SEL)sel {
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:image forState:UIControlStateNormal];
    [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    return btn;
}

// 点赞按钮方法
- (void)likeButtonClicked {
    if (self.likeButtonClickedOperation) {
        self.likeButtonClickedOperation();
    }
    self.show = NO; // 关闭menu
}
// 评论按钮方法
- (void)commentButtonClicked {
    if (self.commentButtonClickedOperation) {
        self.commentButtonClickedOperation();
    }
    self.show = NO;
}

// 展示
- (void)setShow:(BOOL)show {
    _show = show;
    if(show == YES){
        
        [UIView animateWithDuration:0.2 animations:^{
            self.sd_layout.widthIs(100);
        }];
    }
    else {
        [UIView animateWithDuration:0.2 animations:^{
            self.sd_layout.widthIs(0);
        }];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
