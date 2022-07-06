//
//  PostPhotoView.h
//  wechat
//
//  Created by 小艾同学 on 2022/7/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//@protocol PostPhotoDelegate <NSObject>
//
//- (void)postPhoto;
//
//@end

@interface PostPhotoView : UIView

//@property (nonatomic, weak) id<PostPhotoDelegate> delegate;
// 图片item的数组
@property (nonatomic, strong) NSMutableArray *itemsArray;
// 添加图片按钮
@property (nonatomic, strong) UIButton *selectBtn;
@end

NS_ASSUME_NONNULL_END
