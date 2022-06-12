//
//  MainCell.h
//  wechat
//
//  Created by 小艾同学 on 2022/6/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainCell : UITableViewCell

//cell标题
@property (nonatomic, strong) UILabel *title;
//cell图片（头像
@property (nonatomic, strong) UIImageView *imgView;
//cell内容
@property (nonatomic, strong) UILabel *content;
//cell时间
//@property (nonatomic, strong) UILabel *time;

@end

NS_ASSUME_NONNULL_END
