//
//  MineVC.m
//  wechat
//
//  Created by 小艾同学 on 2022/6/5.
//

//controller
#import "MineVC.h"
#import "LogVC.h"
//view
#import "MineCell.h"
//model
#import "MineModel.h"
//tool
#import "Masonry.h"

@interface MineVC ()<UITableViewDelegate, UITableViewDataSource>

//table
@property (nonatomic, strong) UITableView *table;
//退出按钮
@property (nonatomic, strong) UIButton *Btn;
@property (nonatomic, copy) NSMutableArray *selfArray1;
@property (nonatomic, copy) NSMutableArray *selfArray2;
@property (nonatomic, copy) NSMutableArray *selfArray3;
@end

@implementation MineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.table];
    [self.view addSubview:self.Btn];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //读取plist
    //1.创建路径（maybe
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"MinePlist" ofType:@"plist"];
    //2.获取路径
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    //3.打印数据
    NSLog(@"%@", data);
    
    //取出每一个字典放入数组
    NSArray *array0 = data[@"0"];
    NSMutableArray *storyMuteAry0 = [NSMutableArray array];
    for (int i = 0; i < 1; i++) {
        //取每一个字典
        NSDictionary *everyDic = array0[i];
        MineModel *mineModel = [[MineModel alloc] initWithDictionary:everyDic];
        [storyMuteAry0 addObject:mineModel];
    }
    self.selfArray1 = storyMuteAry0;
    
    NSArray *array1 = data[@"1"];
    NSMutableArray *storyMuteAry1 = [NSMutableArray array];
    for (int i = 0; i < 1; i++) {
        //取每一个字典
        NSDictionary *everyDic = array1[i];
        MineModel *mineModel = [[MineModel alloc] initWithDictionary:everyDic];
        [storyMuteAry1 addObject:mineModel];
    }
    self.selfArray2 = storyMuteAry1;
    
    NSArray *array2 = data[@"2"];
    NSMutableArray *storyMuteAry2 = [NSMutableArray array];
    for (int i = 0; i < 4; i++) {
        //取每一个字典
        NSDictionary *everyDic = array2[i];
        MineModel *mineModel = [[MineModel alloc] initWithDictionary:everyDic];
        [storyMuteAry2 addObject:mineModel];
    }
    self.selfArray3 = storyMuteAry2;
}


#pragma mark-UITableViewDelegate
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 100;
    }
    else
        return 50;
}

#pragma mark-UITableViewDataSource
//cell组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

//cell行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 1;
            break;
        default:
            return 4;
            break;
    }
}

//cell内容 自定义
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identify = @"cell";
    MineCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[MineCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    if (indexPath.section == 0) {
        MineModel *model = self.selfArray1[indexPath.row];
        cell.title.text = model.title;
        //灰色微信号
        NSString *cnt = [NSUserDefaults.standardUserDefaults objectForKey:@"userAccount"];
        cell.content.text = [NSString stringWithFormat:@"微信号：%@",cnt];
    }
    else if (indexPath.section == 1) {
        MineModel *model = self.selfArray2[indexPath.row];
        cell.title.text = model.title;
        cell.imageView.image = [UIImage imageNamed:model.image];
    }
    else {
        MineModel *model = self.selfArray3[indexPath.row];
        cell.title.text = model.title;
        cell.imageView.image = [UIImage imageNamed:model.image];
    }
    return cell;
}


#pragma mark-懒加载
- (UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - 100) style:UITableViewStyleGrouped];//屏幕大小
        _table.delegate = self;
        _table.dataSource = self;
    }
    return _table;
}

- (UIButton *)Btn {
    if (_Btn == nil) {
        _Btn = [[UIButton alloc] init];
        _Btn.frame = CGRectMake(0, self.view.frame.size.height - 270, self.view.frame.size.width, 50);
        [_Btn setTitle:@"退出" forState:UIControlStateNormal];
        [_Btn setBackgroundColor:[UIColor whiteColor]];
        [_Btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_Btn addTarget:self action:@selector(exit:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _Btn;
}

#pragma mark- 方法

- (void)exit:(UIButton *)btn {
    btn.selected = !btn.selected;
    //删除
    if (btn.selected == YES) {
        [NSUserDefaults.standardUserDefaults setBool:NO forKey:@"isLoad"];
        LogVC *logVC = [[LogVC alloc] init];
        [self.navigationController pushViewController:logVC animated:NO];
//        [self.navigationController presentViewController:logVC animated:NO completion:^{
//                    NSLog(@"成功");
//        }];
    }
    else {
        [NSUserDefaults.standardUserDefaults setBool:YES forKey:@"isLoad"];
    }
    
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
