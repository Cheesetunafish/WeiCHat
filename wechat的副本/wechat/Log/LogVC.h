//
//  LogVC.h
//  wechat
//
//  Created by 小艾同学 on 2022/5/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LogVC : UIViewController
//登录标题
@property (nonatomic, strong) UILabel *titleLbl;
//账号
@property (nonatomic, strong) UILabel *accountLbl;
//输入账号
@property (nonatomic, strong) UITextField *accountText;
//密码
@property (nonatomic, strong) UILabel *passwordLbl;
//输入密码
@property (nonatomic, strong) UITextField *passwordText;
//登录按钮
@property (nonatomic, strong) UIButton *logBtn;


- (void)tagLog:(UIButton *)btn;
- (void)getUserDefault;
@end

NS_ASSUME_NONNULL_END
