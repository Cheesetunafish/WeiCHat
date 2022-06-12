//
//  MainVC.m
//  wechat
//
//  Created by 小艾同学 on 2022/6/5.
//

#import "MainVC.h"
#import "MainModel.h"
#import "MainCell.h"


@interface MainVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *table;
@property (nonatomic, copy) NSMutableArray *selfArray;
@property (nonatomic, strong) MainModel *model;

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.table];
    
    
    //读取plist
    //1.创建路径（maybe
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"MainPlist2" ofType:@"plist"];
    //2.获取路径
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    //3.打印数据
    NSLog(@"%@", data);
    
    
    //取出每一个字典放入数组
//    NSMutableArray *array = [NSMutableArray array];
    NSArray *array = data[@"cell"];
    NSMutableArray *storyMuteAry = [NSMutableArray array];
    for (int i = 0; i < 15; i++) {
        //取每一个字典
        NSDictionary *everyDic = array[i];
        MainModel *mainModel = [[MainModel alloc] initWithDictionary:everyDic];
        [storyMuteAry addObject:mainModel];
    }
    self.selfArray = storyMuteAry;
    
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

#pragma mark-UITableViewDelegate
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
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
    MainCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[MainCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    MainModel *model = self.selfArray[indexPath.row];
    cell.title.text = model.title;
    cell.content.text = model.content;
    cell.imgView.image = [UIImage imageNamed:model.image];
    return cell;
}



#pragma mark-懒加载
- (UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - 100) style:UITableViewStylePlain];//屏幕大小
        _table.delegate = self;
        _table.dataSource = self;
    }
    return _table;
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
