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

@interface MineVC ()<UITableViewDelegate, UITableViewDataSource>

//table
@property (nonatomic, strong) UITableView *table;
//退出按钮
@property (nonatomic, strong) UIButton *Btn;

@end

@implementation MineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.table];
    [self.view addSubview:self.Btn];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    // Do any additional setup after loading the view.
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
            return 5;
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
        cell.title.text = @"userName";
        //灰色微信号
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString *userAccount = [userDefaults objectForKey:@"userAccount"];
        cell.content.text = userAccount;
    }
    else
        cell.title.text = @"text";
        
    
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
        _Btn.frame = CGRectMake(0, self.view.frame.size.height - 220, self.view.frame.size.width, 50);
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
