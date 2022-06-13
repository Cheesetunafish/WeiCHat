//
//  MainCell.m
//  wechat
//
//  Created by 小艾同学 on 2022/6/5.
//

#import "MainCell.h"
//Tool
#import "Masonry.h"

@implementation MainCell

//cell方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.title];
        [self.contentView addSubview:self.imgView];
        [self.contentView addSubview:self.content];
        [self setPosition];
    }
    return self;
}

- (void)setPosition {
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).mas_offset(20);
        make.centerY.equalTo(self);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imgView.mas_right).mas_offset(15);
        make.top.equalTo(self).mas_offset(15);
    }];
    
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.title);
        make.top.equalTo(self.title.mas_bottom).mas_offset(10);
    }];
}

- (UILabel *)title {
    if (_title == nil) {
        _title = [[UILabel alloc] init];

//        _title.backgroundColor = [UIColor systemGrayColor];
    }
    return _title;
}

- (UILabel *)content {
    if (_content == nil) {
        _content = [[UILabel alloc] init];
        
        _content.textColor = [UIColor systemGrayColor];
//        _content.backgroundColor = [UIColor systemGrayColor];
    }
    return _content;
}

- (UIImageView *)imgView {
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc] init];

        _imgView.backgroundColor = [UIColor systemGrayColor];
    }
    return _imgView;
}




//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
