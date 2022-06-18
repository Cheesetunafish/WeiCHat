//
//  FindCell.h
//  wechat
//
//  Created by 小艾同学 on 2022/6/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FindCell : UITableViewCell

//头像
@property (nonatomic, strong) UIImageView *imgView;
//用户名
@property (nonatomic, strong) UILabel *title;
//内容图片
@property (nonatomic, strong) UIImageView *contentImg;
//内容文字
@property (nonatomic, strong) UILabel *content;
//按钮
@property (nonatomic, strong) UIButton *likeBtn;
@property (nonatomic, strong) UIButton *commentBtn;


- (void)Position;

@end

NS_ASSUME_NONNULL_END
