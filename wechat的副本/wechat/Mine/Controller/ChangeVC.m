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
    
    
    // 取第一个头像
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"MinePlist" ofType:@"plist"];
    
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    
    NSArray *array0 = data[@"0"];
    NSMutableArray *storyMuteAry0 = [NSMutableArray array];
    for (int i = 0; i < 1; i++) {
        NSDictionary *everyDic = array0[i];
        MineModel *mineModel = [[MineModel alloc] initWithDictionary:everyDic];
        [storyMuteAry0 addObject:mineModel];
    }
    self.selfArray = storyMuteAry0;
    
    MineModel *model = [MineModel new];
    model = self.selfArray[0];
    self.imgView.image = [UIImage imageNamed:model.image];
}


- (UIImageView *)imgView {
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc] init];
        _imgView.image = [UIImage imageNamed:self.selfArray[1]];
        _imgView.backgroundColor = [UIColor systemGrayColor];
//        _imgView.image = [UIImage imageNamed:@"myImg"];
        
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
