//
//  FindCell.m
//  wechat
//
//  Created by 小艾同学 on 2022/6/12.
//

#import "FindCell.h"

@implementation FindCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.title];
        [self.contentView addSubview:self.imgView];
    }
    return self;
}

- (UILabel *)title {
    if (_title == nil) {
        _title = [[UILabel alloc] init];
    }
    return _title;
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
