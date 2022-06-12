//
//  AccountTool.m
//  wechat
//
//  Created by 小艾同学 on 2022/5/25.
//

#import "AccountTool.h"
#import "AFNetworking.h"

@implementation AccountTool


+ (void)saveAccount:(NSArray *)account {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    //保存数据：用户名；用户密码
    [userDefaults setObject:account forKey:@"account"];
    [userDefaults setObject:[account objectAtIndex:0] forKey:@"userName"];
    [userDefaults setObject:[account objectAtIndex:1] forKey:@"passWord"];
}

+ (NSArray *)getAccount {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *array = [userDefaults objectForKey:@"account"];
    return array;
}

+ (NSString *)getUserName {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *userName = [userDefaults objectForKey:@"userName"];
    return userName;
}

+ (NSString *)getPassword {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *passWord = [userDefaults objectForKey:@"passWord"];
    return passWord;
}


/*
 //保存输入的信息
 #pragma mark- 方法
 - (void) loginCheck {
     //1.创建请求管理对象
     AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
     //说明服务器返回的JSON数据
     mgr.responseSerializer = [AFJSONResponseSerializer serializer];
     
     //2.封装请求参数
     NSMutableDictionary *params = [NSMutableDictionary dictionary];
     params[@"userName"] = <#userNameTextFile#>.text;
     params[@"passWord"] = <#passWordTextFile#>.text;
     
     //3.发送请求
     [mgr GET:@"http://localhost:8080/login/check.do" parameters:params headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         if ([[responseObject objectForKey:@"success"] boolValue] == true) {
             self.view.window.rootViewController = [[ViewController alloc]init];
             NSArray *array  = [NSArray  arrayWithObjects:<#userNameTextFile#>.text, <#passWorkTextFile#>.text, nil ];
             [AccountTool saveAccount:array];
         }
         else {
             self.view.window.rootViewController = [[LogVC alloc]init];
        
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"请求失败");
         }
     }];
 }
 */

@end
