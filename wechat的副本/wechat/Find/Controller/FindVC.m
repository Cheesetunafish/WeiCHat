//
//  FindVC.m
//  wechat
//
//  Created by 小艾同学 on 2022/6/5.
//

//Controller
#import "FindVC.h"
//View
#import "FindCell.h"
#import "BannerView.h"


@interface FindVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) BannerView *banner;

@end

@implementation FindVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.table];
    [self.view addSubview:self.banner];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

#pragma mark-UITableViewDelegate
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
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
    if (cell == nil) {
        cell = [[FindCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    
    
    cell.title.text = @"title";
    
    return cell;
}



#pragma mark- 懒加载
- (UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];//屏幕大小
        _table.backgroundColor = [UIColor systemPinkColor];
//        _table.delegate = self;
//        _table.dataSource = self;
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
