//
//  CellModel.h
//  wechat
//
//  Created by 小艾同学 on 2022/6/20.
//

//#import <Foundation/Foundation.h>
//
//NS_ASSUME_NONNULL_BEGIN
//
//@interface CellModel : NSObject
//
//@end
//
//NS_ASSUME_NONNULL_END


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class CellLikeItemModel, CellCommentItemModel;

@interface CellModel : NSObject

// 头像
@property (nonatomic, copy) NSString *iconName;
// 名字
@property (nonatomic, copy) NSString *name;
// 内容
@property (nonatomic, copy) NSString *msgContent;
// 图片
@property (nonatomic, strong) NSArray *picNamesArray;
// 点赞
@property (nonatomic, assign, getter = isLiked) BOOL liked;
// 点赞Array
@property (nonatomic, strong) NSArray<CellLikeItemModel *> *likeItemsArray;
// 评论Array
@property (nonatomic, strong) NSArray<CellCommentItemModel *> *commentItemsArray;


// 是否展开全文
@property (nonatomic, assign) BOOL isOpening;
@property (nonatomic, assign, readonly) BOOL shouldShowMoreButton;

- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end


#pragma mark- LikeItemModel
@interface CellLikeItemModel : NSObject

@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSAttributedString *attributedContent;


@end


#pragma mark- CommentItemModel
@interface CellCommentItemModel : NSObject

@property (nonatomic, copy) NSString *commentString;

@property (nonatomic, copy) NSString *firstUserName;
@property (nonatomic, copy) NSString *firstUserId;

@property (nonatomic, copy) NSString *secondUserName;
@property (nonatomic, copy) NSString *secondUserId;
@property (nonatomic, copy) NSAttributedString *attributedContent;

@end

NS_ASSUME_NONNULL_END
