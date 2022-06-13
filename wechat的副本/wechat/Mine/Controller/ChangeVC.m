//
//  ChangeVC.m
//  wechat
//
//  Created by 小艾同学 on 2022/6/13.
//

#import "ChangeVC.h"
#import "MineModel.h"
#import "Masonry.h"

@interface ChangeVC ()

@property (nonatomic, copy) NSMutableArray *selfArray;

@property (nonatomic, strong) UIImageView *imgView;

@end

@implementation ChangeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.imgView];
    [self setPosition];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"个人头像";
    
    //读取plist
    //1.创建路径（maybe
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"MinePlist" ofType:@"plist"];
    //2.获取路径
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    
    //取出每一个字典放入数组
    NSArray *array0 = data[@"0"];
    NSMutableArray *storyMuteAry0 = [NSMutableArray array];
    for (int i = 0; i < 1; i++) {
        //取每一个字典
        NSDictionary *everyDic = array0[i];
        MineModel *mineModel = [[MineModel alloc] initWithDictionary:everyDic];
        [storyMuteAry0 addObject:mineModel];
    }
    self.selfArray = storyMuteAry0;
}


- (UIImageView *)imgView {
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc] init];
        _imgView.image = [UIImage imageNamed:self.selfArray[1]];
        _imgView.backgroundColor = [UIColor systemGrayColor];
        
        
    }
    return _imgView;
}

- (void)setPosition {
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.mas_equalTo(self.imgView.mas_width);
    }];
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
