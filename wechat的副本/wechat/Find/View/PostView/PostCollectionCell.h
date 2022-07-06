//
//  PostCollectionCell.h
//  wechat
//
//  Created by 小艾同学 on 2022/7/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol PostPhotoDelegate <NSObject>
- (void)postPhoto;
@end

@interface PostCollectionCell : UICollectionViewCell

@property (nonatomic, weak) id<PostPhotoDelegate> delegate;
@property (nonatomic, strong) UIImageView *image;
@property (nonatomic, strong) UIButton *selectBtn;

@end

NS_ASSUME_NONNULL_END
