//
//  BookCell.h
//  wechat
//
//  Created by 小艾同学 on 2022/6/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BookCell : UITableViewCell
//图片
@property (nonatomic, strong) UIImageView *imgView;
//名称
@property (nonatomic, strong) UILabel *title;

- (void)setPosition;

@end

NS_ASSUME_NONNULL_END
