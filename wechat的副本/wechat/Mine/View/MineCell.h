//
//  MineCell.h
//  wechat
//
//  Created by 小艾同学 on 2022/6/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MineCell : UITableViewCell

//图片
@property (nonatomic, strong) UIImageView *imgView;
//标题
@property (nonatomic, strong) UILabel *title;
//内容
@property (nonatomic, strong) UILabel *content;

@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, copy) void (^getNewImageBlock)(NSIndexPath *indexPath);

- (void)setPosition;

- (void)getNewImage;

@end

NS_ASSUME_NONNULL_END
