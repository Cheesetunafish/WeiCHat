//
//  AccountTool.h
//  wechat
//
//  Created by 小艾同学 on 2022/5/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AccountTool : NSObject

/// 存储账号信息
/// @param account 需要存储的账号信息：第一个值为用户名，第二个值为密码
+ (void) saveAccount:(NSArray *)account;

/// 返回存储的账号信息
+ (NSArray *)getAccount;

/// 返回存储的登录用户名
+ (NSString *)getUserName;

/// 返回存储的登录用户密码
+ (NSString *)getPassword;

@end

NS_ASSUME_NONNULL_END
