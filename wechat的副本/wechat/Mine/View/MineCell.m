//
//  MineCell.m
//  wechat
//
//  Created by 小艾同学 on 2022/6/12.
//

#import "MineCell.h"

@implementation MineCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.title];
        [self.contentView addSubview:self.imgView];
        [self.contentView addSubview:self.content];
    }
    return self;
}


- (UILabel *)title {
    if (_title == nil) {
        _title = [[UILabel alloc] init];
        _title.frame = CGRectMake(50, 10, 100, 20);
        _title.backgroundColor = [UIColor systemGrayColor];
    }
    return _title;
}

- (UILabel *)content {
    if (_content == nil) {
        _content = [[UILabel alloc] init];
        _content.frame = CGRectMake(50, 30, 200, 20);
//        _content.backgroundColor = [UIColor systemGrayColor];
    }
    return _content;
}

- (UIImageView *)imgView {
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc] init];
        _imgView.frame = CGRectMake(10, 10, 30, 30);
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
