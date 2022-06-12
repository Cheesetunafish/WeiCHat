//
//  MineVC.m
//  wechat
//
//  Created by 小艾同学 on 2022/6/5.
//

#import "MineVC.h"

@interface MineVC ()

@end

@implementation MineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *laa = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    laa.text = @"我";
    [self.view addSubview:laa];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
