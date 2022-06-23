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
//model
#import "CellModel.h"


@interface FindVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) BannerView *banner;
@property (nonatomic, strong) TopView *topView;
@property (nonatomic, strong) FindCell *cell;

@property (nonatomic, strong) NSMutableArray *dataArray;



@end

@implementation FindVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.table];
    [self.table addSubview:self.banner];
    self.table.tableHeaderView = self.banner;
//    [self.view addSubview:self.topView];
    
    //读取plist
    //1.创建路径（maybe
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"FindList" ofType:@"plist"];
    //2.获取路径
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    
    NSArray *array = data[@"cell"];
    NSMutableArray *storyMuteAry = [NSMutableArray array];
    for (int i = 0; i < 13; i++) {
        //取每一个字典
        NSDictionary *everyDic = array[i];
        CellModel *cellModel = [[CellModel alloc] initWithDictionary:everyDic];
        [storyMuteAry addObject:cellModel];
    }
    self.dataArray = storyMuteAry;
    
    
    
    
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

//    if (self.cell.contentImg.image == nil) {
//        return 100;
//    }
//    else{
//        return 200;
//    }
    return 200;
}

#pragma mark-UITableViewDataSource
//cell组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//cell行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 13;
}

//cell内容 自定义
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"cell";
    FindCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    cell.indexPath = indexPath;
    __weak typeof(self) weakSelf = self;
    CellModel *model = weakSelf.dataArray[indexPath.row];
    if (cell == nil) {
        cell = [[FindCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    
        
    if (!cell.moreButtonClickedBlock) {
        [cell setMoreButtonClickedBlock:^(NSIndexPath *indexPath) {
            
            model.isOpening = !model.isOpening;
            [weakSelf.table reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            
        }];
    }
    
    // 设置数据
    cell.model = self.dataArray[indexPath.row];
//    cell.content.text = @"我早上全款买下的牛肉饼饼在路上掉了，我一口没吃着我早上全款买下的牛肉饼饼在路上掉了，我一口没吃着";
//    cell.title.text = @"何克宇";
//    cell.content.text = @"学姐超厉害，任何人不看这篇我都会难过的OK？";
    
//    cell.contentImg.image = [UIImage imageNamed:@"iShot2022-06-16_21.53.34"];

    
    return cell;
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
