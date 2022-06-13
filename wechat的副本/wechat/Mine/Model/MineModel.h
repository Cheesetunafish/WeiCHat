//
//  MineModel.h
//  wechat
//
//  Created by 小艾同学 on 2022/6/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MineModel : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *image;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
