//
//  FindVC.m
//  wechat
//
//  Created by 小艾同学 on 2022/6/5.
//

//Controller
#import "FindVC.h"
#import "FindPostVC.h"
//View
#import "FindCell.h"
#import "BannerView.h"
#import "TopView.h"


@interface FindVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) BannerView *banner;
@property (nonatomic, strong) TopView *topView;
@property (nonatomic, strong) FindCell *cell;




@end

@implementation FindVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.table];
    [self.table addSubview:self.banner];
    self.table.tableHeaderView = self.banner;
//    [self.view addSubview:self.topView];
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"相机" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonItemAction:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[[UILabel alloc]initWithFrame:CGRectMake(0, 5, 60, 30)]];
     self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

//相机界面跳转
-(void)rightBarButtonItemAction:(id)sender{
    FindPostVC *post = [[FindPostVC alloc]init];
    [self.navigationController pushViewController:post animated:YES];
}

#pragma mark-UITableViewDelegate
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (self.cell.contentImg.image == nil) {
        return 100;
    }
    else{
        return 200;
    }
}

#pragma mark-UITableViewDataSource
//cell组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//cell行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 15;
}

//cell内容 自定义
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"cell";
    FindCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    self.cell = cell;
    if (self.cell == nil) {
        self.cell = [[FindCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    
    self.cell.title.text = @"何克宇";
    self.cell.content.text = @"学姐超厉害，任何人不看这篇我都会难过的OK？";
    self.cell.contentImg.image = [UIImage imageNamed:@"iShot2022-06-16_21.53.34"];

    
    return self.cell;
}

#pragma mark- 懒加载
- (UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];//屏幕大小
        _table.delegate = self;
        _table.dataSource = self;
    }
    return _table;
}

- (BannerView *)banner {
    if (_banner == nil) {
        _banner = [[BannerView alloc] init];
        
        _banner.frame = CGRectMake(0, 0, self.view.frame.size.width, 300);
        _banner.backgroundColor = [UIColor systemBlueColor];
    }
    return _banner;
}

- (TopView *)topView {
    if (_topView == nil) {
        _topView = [[TopView alloc] init];
        
        _topView.frame = CGRectMake(0, 0, self.view.frame.size.width, 100);
    }
    return _topView;
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
