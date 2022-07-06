//
//  PostCollectionCell.m
//  wechat
//
//  Created by 小艾同学 on 2022/7/6.
//

#import "PostCollectionCell.h"
#import "Masonry.h"
@implementation PostCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.image];
        [self.contentView addSubview:self.selectBtn];
        self.backgroundColor = [UIColor systemGray6Color];
        [self setPosition];
    }
    return self;
}

- (void)setPosition {
    [self.image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.width.equalTo(self);
        make.height.equalTo(self);
    }];
    [self.selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.width.equalTo(self);
        make.height.equalTo(self);
    }];
}

- (UIImageView *)image {
    if (_image == nil) {
        _image = [UIImageView new];
    }
    return _image;
}

// 添加图片的按钮
- (UIButton *)selectBtn {
    if (_selectBtn == nil) {
        _selectBtn = [UIButton new];
        [_selectBtn setImage:[UIImage imageNamed:@"add_image" ]forState:UIControlStateNormal];
        [_selectBtn addTarget:self action:@selector(didClickedSelectBtn) forControlEvents:UIControlEventTouchUpInside];
        _selectBtn.hidden = YES;
    }
    return _selectBtn;
}

- (void)didClickedSelectBtn {
    [self.delegate postPhoto];
}
@end
