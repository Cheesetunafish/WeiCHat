//
//  LogVC.m
//  wechat
//
//  Created by 小艾同学 on 2022/5/25.
//

#import "LogVC.h"
#import "MainVC.h"
//Tool
#import "AccountTool.h"
#import "Masonry.h"
#import "AFNetworking.h"


@interface LogVC ()


@end

@implementation LogVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.titleLbl];
    [self.view addSubview:self.accountText];
    [self.view addSubview:self.accountLbl];
    [self.view addSubview:self.passwordLbl];
    [self.view addSubview:self.passwordText];
    [self.view addSubview:self.logBtn];
    self.view.backgroundColor = [UIColor systemGreenColor];
    
    //保存数据
//    [NSUserDefaults.standardUserDefaults setObject:self.accountText.text forKey:@"userAccount"];
    
    
    
    //将输入的账户和密码存入可变数组
//    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//    dic[@"userName"] = self.accountText.text;
//    dic[@"passWord"] = self.passwordText.text;
//    NSMutableArray *muteAry = [NSMutableArray array];
//    [muteAry addObject:dic];
    
    
}

#pragma mark- 懒加载
//标题
- (UILabel *)titleLbl {
    if (_titleLbl == nil) {
        _titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(90, 60, 600, 100)];
        _titleLbl.text = @"微信号/QQ号/邮箱登录";
        _titleLbl.font = [UIFont boldSystemFontOfSize:20];
//        [_titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.center.equalTo(self.view).centerOffset(CGPointMake(0, 50));
//
//        }];
    }
    return _titleLbl;
}
//账号
- (UILabel *)accountLbl {
    if (_accountLbl == nil) {
        _accountLbl = [[UILabel alloc] initWithFrame:CGRectMake(30, 250, 50, 50)];
        _accountLbl.text = @"账号";
        _accountLbl.textColor = [UIColor blackColor];
        _accountLbl.font = [UIFont boldSystemFontOfSize:20];
    }
    return _accountLbl;
}
//账号输入
- (UITextField *)accountText {
    if (_accountText == nil) {
        _accountText = [[UITextField alloc] initWithFrame:CGRectMake(100, 250, 200, 50)];
        _accountText.placeholder = @"微信号/QQ号/邮箱";
        _accountText.secureTextEntry = NO;
        _accountText.font = [UIFont systemFontOfSize:20];
    }
    return _accountText;
}
//密码
- (UILabel *)passwordLbl {
    if (_passwordLbl == nil) {
        _passwordLbl = [[UILabel alloc] initWithFrame:CGRectMake(30, 300, 50, 50)];
        _passwordLbl.text = @"密码";
        _passwordLbl.font = [UIFont boldSystemFontOfSize:20];
    }
    return _passwordLbl;
}
//密码输入
- (UITextField *)passwordText {
    if (_passwordText == nil) {
        _passwordText = [[UITextField alloc] initWithFrame:CGRectMake(100, 305, 200, 50)];
        _passwordText.placeholder = @"输入密码";
        _passwordText.secureTextEntry = YES;
        _passwordText.font = [UIFont systemFontOfSize:20];
    }
    return _passwordText;
}

- (UIButton *)logBtn {
    if (_logBtn == nil) {
        _logBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 500, 200, 50)];
        [_logBtn setTitle:@"登录" forState:UIControlStateNormal];
        _logBtn.titleLabel.textColor = [UIColor whiteColor];
        _logBtn.backgroundColor = [UIColor systemBlueColor];
        [_logBtn addTarget:self action:@selector(logIn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _logBtn;
}

#pragma mark- 方法
//点击按钮
- (void)logIn:(UIButton *)btn{
    btn.selected = !btn.selected;
    if (btn.selected == YES) {  //点击存储，yes
        btn.backgroundColor = [UIColor grayColor];
        [NSUserDefaults.standardUserDefaults setBool:YES forKey:@"isLoad"];
        UIViewController *vc = [[UIViewController alloc]init];
        
//        MainVC *mainVC = [[MainVC alloc] init];
        MainVC *mainVC = [[MainVC alloc] init];
        [mainVC inita];
//        [self presentViewController:mainVC animated:YES completion:nil];
        [self.navigationController pushViewController:vc animated:YES];
        
        // 存名字
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:self.accountText.text forKey:@"userAccount"];
        // 存入磁盘
        [defaults synchronize];
        NSString *string = [defaults objectForKey:@"userAccount"];
        
        NSLog(@"????????%@",string);

    }
    else{   //没点击，no
        btn.backgroundColor = [UIColor orangeColor];
        [NSUserDefaults.standardUserDefaults setBool:NO forKey:@"isLoad"];
    }
}



//- (void)getUserDefault {
//    if ([NSUserDefaults.standardUserDefaults boolForKey:@"isLoad"]) {
//        self.logBtn.selected = YES;
//        self.logBtn.backgroundColor = [UIColor grayColor];
//    }
//    else {
//        self.logBtn.selected = NO;
//        self.logBtn.backgroundColor = [UIColor orangeColor];
//    }
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
