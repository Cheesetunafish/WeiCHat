//
//  MenuView.m
//  wechat
//
//  Created by 小艾同学 on 2022/6/21.
//

#import "MenuView.h"

@implementation MenuView

- (instancetype)init {
    if (self = [super init]) {
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 5;
        self.backgroundColor = [UIColor redColor];
        [self addSubview:self.likeButton];
        [self addSubview:self.commentButton];
    }
    return self;
}



- (UIButton *)likeButton {
    if (_likeButton == nil) {
        _likeButton = [[UIButton alloc] init];
        _likeButton = [self newButtonWithTitle:@"点赞" Image:[UIImage imageNamed:@""] Target:self Selector:@selector(likeButtonClickedOperation)];
        _likeButton.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _likeButton;
}

- (UIButton *)commentButton {
    if (_commentButton == nil) {
        _commentButton = [[UIButton alloc] init];
        _commentButton = [self newButtonWithTitle:@"评论" Image:[UIImage imageNamed:@""] Target:self Selector:@selector(commentButtonClickedOperation)];
        _commentButton.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _commentButton;
}


- (UIButton *)newButtonWithTitle:(NSString *)title Image:(UIImage *)image Target:(id)target Selector:(SEL)sel {
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:image forState:UIControlStateNormal];
    [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
