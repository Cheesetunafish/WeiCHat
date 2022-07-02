//
//  AppDelegate.m
//  wechat
//
//  Created by 小艾同学 on 2022/5/25.
//

#import "AppDelegate.h"

//VC
#import "LogVC.h"
#import "MainVC.h"
#import "BookVC.h"
#import "FindVC.h"
#import "MineVC.h"

//Tool
#import "AccountTool.h"
#import "AFNetworking.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


//  [NSUserDefaults.standardUserDefaults boolForKey:@"isLoad"]

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    //页面控制
    MainVC *mainVC = [[MainVC alloc] init];
    mainVC.title = @"微信";
    mainVC.tabBarItem.title = @"微信";
    mainVC.tabBarItem.image = [UIImage systemImageNamed:@"message"];
    mainVC.tabBarItem.selectedImage = [UIImage systemImageNamed:@"message.fill"];
    
    UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:mainVC];
    mainNav.navigationBar.translucent = YES;
    
    //通讯录
    BookVC *bookVC = [[BookVC alloc] init];
    bookVC.title = @"通讯录";
    bookVC.tabBarItem.title = @"通讯录";
    bookVC.tabBarItem.image = [UIImage systemImageNamed:@"person.3"];
    bookVC.tabBarItem.selectedImage = [UIImage systemImageNamed:@"person.3.fill"];
    
    UINavigationController *bookNav = [[UINavigationController alloc] initWithRootViewController:bookVC];
    bookNav.navigationBar.translucent = YES;
    
    //发现
    FindVC *findVC = [[FindVC alloc] init];
    findVC.title = @"朋友圈";
    findVC.tabBarItem.title = @"发现";
    findVC.tabBarItem.image = [UIImage systemImageNamed:@"safari"];
    findVC.tabBarItem.selectedImage = [UIImage systemImageNamed:@"safari.fill"];
    UINavigationController *findNav = [[UINavigationController alloc] initWithRootViewController:findVC];

    findNav.navigationBar.translucent = YES;
    
    //我
    MineVC *mineVC = [[MineVC alloc] init];
    mineVC.title = @"我";
    mineVC.tabBarItem.title = @"我";
    mineVC.tabBarItem.image = [UIImage systemImageNamed:@"person"];
    mineVC.tabBarItem.selectedImage = [UIImage systemImageNamed:@"person.fill"];
    UINavigationController *mineNav = [[UINavigationController alloc] initWithRootViewController:mineVC];
    mineNav.navigationBar.translucent = YES;
    
    //创建tableBarController
    NSArray *vcsArray = [NSArray arrayWithObjects:mainNav, bookNav, findNav, mineNav, nil];
    UITabBarController *tabBarVC = [[UITabBarController alloc] init];
    
    //tabbar颜色
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    
    
    // 设置多个Tab的ViewController到TabBarViewController
    tabBarVC.viewControllers = vcsArray;
    
    //4、将UITabBarController设置为Window的RootViewController
//    self.window.rootViewController = tabBarVC;
    self.window.rootViewController.view.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //判断是否是第一次进入--------引导页，不要。
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isLoad"] == NO) {
            NSLog(@"第一次启动");
            self.window.rootViewController = [[LogVC alloc] init];
        }
    else if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isLoad"] == YES){
            NSLog(@"非第一次启动");
            self.window.rootViewController = tabBarVC;
        }
    
    return YES;
}
    
    
    //判断是否登录
//    if ([AccountTool getUserName] == nil) { // 之前没有登录成功
//            self.window.rootViewController = [[LogVC alloc] init];
//        }
//    else {// 之前登录成功
//            self.window.rootViewController = [[ViewController alloc] init];
//        }
//
//
//    return YES;
//}



//#pragma mark - UISceneSession lifecycle
//
//
//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end
