//
//  BookVC.m
//  wechat
//
//  Created by 小艾同学 on 2022/6/5.
//

#import "BookVC.h"
#import "BookModel.h"
#import "BookCell.h"

@interface BookVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, copy) NSMutableArray *selfArray1;
@property (nonatomic, copy) NSMutableArray *selfArray2;
@property (nonatomic, copy) NSMutableArray *selfArray3;
@property (nonatomic, copy) NSMutableArray *selfArray4;
@property (nonatomic, copy) NSMutableArray *selfArray5;
@property (nonatomic, copy) NSMutableArray *selfArray6;
@property (nonatomic, copy) NSMutableArray *selfArray7;
@property (nonatomic, copy) NSMutableArray *selfArray8;
// 总数组
@property (nonatomic, copy) NSMutableArray<NSMutableArray *> *selfArrayAll;

@property (nonatomic, strong) BookModel *model;
@end

@implementation BookVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.table];
    [self addData];
    //    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)addData {
    //读取plist
    //1.创建路径（maybe
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"BookPlist" ofType:@"plist"];
    //2.获取路径
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    
    
    for (NSArray * array in [data allValues]) {
        NSLog(@"array%@",array);
        for (int i = 0; i < array.count; i++) {
            NSMutableArray *storyMuteAry = [NSMutableArray array];
            NSDictionary *everyDic = array[i];
            BookModel *bookModel = [[BookModel alloc] initWithDictionary:everyDic];
            [storyMuteAry addObject:bookModel];
            self.selfArrayAll[i] = storyMuteAry;
        }
        
    }
    
    /*
    //取出每一个字典放入数组
    NSArray *array = data[@"cell"];
    NSMutableArray *storyMuteAry = [NSMutableArray array];
    for (int i = 0; i < array.count; i++) {
        //取每一个字典
        NSDictionary *everyDic = array[i];
        BookModel *bookModel = [[BookModel alloc] initWithDictionary:everyDic];
        [storyMuteAry addObject:bookModel];
    }
    self.selfArray1 = storyMuteAry;
    
    //A组数据
    NSArray *array2 = data[@"A"];
    NSMutableArray *storyMuteAry2 = [NSMutableArray array];
    for (int i = 0; i < array2.count; i++) {
        //取每一个字典
        NSDictionary *everyDic = array2[i];
        BookModel *bookModel = [[BookModel alloc] initWithDictionary:everyDic];
        [storyMuteAry2 addObject:bookModel];
    }
    self.selfArray2 = storyMuteAry2;
    
    //B组数据
    NSArray *array3 = data[@"B"];
    NSMutableArray *storyMuteAry3 = [NSMutableArray array];
    for (int i = 0; i < array3.count; i++) {
        //取每一个字典
        NSDictionary *everyDic = array3[i];
        BookModel *bookModel = [[BookModel alloc] initWithDictionary:everyDic];
        [storyMuteAry3 addObject:bookModel];
    }
    self.selfArray3 = storyMuteAry3;
    
    //C组数据
    NSArray *array4 = data[@"C"];
    NSMutableArray *storyMuteAry4 = [NSMutableArray array];
    for (int i = 0; i < array4.count; i++) {
        //取每一个字典
        NSDictionary *everyDic = array4[i];
        BookModel *bookModel = [[BookModel alloc] initWithDictionary:everyDic];
        [storyMuteAry4 addObject:bookModel];
    }
    self.selfArray4 = storyMuteAry4;
    
    //D组数据
    NSArray *array5 = data[@"D"];
    NSMutableArray *storyMuteAry5 = [NSMutableArray array];
    for (int i = 0; i < array5.count; i++) {
        //取每一个字典
        NSDictionary *everyDic = array5[i];
        BookModel *bookModel = [[BookModel alloc] initWithDictionary:everyDic];
        [storyMuteAry5 addObject:bookModel];
    }
    self.selfArray5 = storyMuteAry5;
    
    //E组数据
    NSArray *array6 = data[@"E"];
    NSMutableArray *storyMuteAry6 = [NSMutableArray array];
    for (int i = 0; i < array6.count; i++) {
        //取每一个字典
        NSDictionary *everyDic = array6[i];
        BookModel *bookModel = [[BookModel alloc] initWithDictionary:everyDic];
        [storyMuteAry6 addObject:bookModel];
    }
    self.selfArray6 = storyMuteAry6;
    
    //F组数据
    NSArray *array7 = data[@"F"];
    NSMutableArray *storyMuteAry7 = [NSMutableArray array];
    for (int i = 0; i < array7.count; i++) {
        //取每一个字典
        NSDictionary *everyDic = array7[i];
        BookModel *mainModel = [[BookModel alloc] initWithDictionary:everyDic];
        [storyMuteAry7 addObject:mainModel];
    }
    self.selfArray7 = storyMuteAry7;
    
    //G组数据
    NSArray *array8 = data[@"G"];
    NSMutableArray *storyMuteAry8 = [NSMutableArray array];
    for (int i = 0; i < array8.count; i++) {
        //取每一个字典
        NSDictionary *everyDic = array8[i];
        BookModel *mainModel = [[BookModel alloc] initWithDictionary:everyDic];
        [storyMuteAry8 addObject:mainModel];
    }
    self.selfArray8 = storyMuteAry8;
     */
    
}

#pragma mark-UITableViewDelegate
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

#pragma mark-UITableViewDataSource
//cell组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 8;
}

//cell头标签
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return nil;
    }
    if (section == 1) {
        return @"A";
    }
    else if (section == 2) {
        return @"B";
    }
    else if (section == 3) {
        return @"C";
    }
    else if (section == 4) {
        return @"D";
    }
    else if (section == 5) {
        return @"E";
    }
    else if (section == 6) {
        return @"F";
    }
    else
        return @"G";
}

//cell行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 4;
            break;
        case 1://a
            return 3;
            break;
        case 2://b
            return 3;
            break;
        case 3://c
            return 2;
            break;
        case 4://d
            return 1;
            break;
        case 5://e
            return 1;
            break;
        case 6://f
            return 2;
            break;
        default://g
            return 1;
            break;
    }
}

//cell内容 自定义
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"cell";
    BookCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[BookCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    
    for (int i = 0; i < self.selfArrayAll.count; i++) {
        BookModel *model = self.selfArrayAll[i][indexPath.row];
        cell.title.text = model.title;
        cell.imgView.image = [UIImage imageNamed:model.image];
    }
    
    /*
    
    //@"cell"
    if (indexPath.section == 0) {
        BookModel *model = self.selfArray1[indexPath.row];
        cell.title.text = model.title;
        cell.imgView.image = [UIImage imageNamed:model.image];
    }
    //@"A"
    else if (indexPath.section == 1) {
        BookModel *model = self.selfArray2[indexPath.row];
        cell.title.text = model.title;
        cell.imgView.image = [UIImage imageNamed:model.image];
    }
    //@"B"
    else if (indexPath.section == 2) {
        BookModel *model = self.selfArray3[indexPath.row];
        cell.title.text = model.title;
        cell.imgView.image = [UIImage imageNamed:model.image];
    }
    //@"C"
    else if (indexPath.section == 3) {
        BookModel *model = self.selfArray4[indexPath.row];
        cell.title.text = model.title;
        cell.imgView.image = [UIImage imageNamed:model.image];
    }
    //@"D"
    else if (indexPath.section == 4) {
        BookModel *model = self.selfArray5[indexPath.row];
        cell.title.text = model.title;
        cell.imgView.image = [UIImage imageNamed:model.image];
    }
    //@"E"
    else if (indexPath.section == 5) {
        BookModel *model = self.selfArray6[indexPath.row];
        cell.title.text = model.title;
        cell.imgView.image = [UIImage imageNamed:model.image];
    }
    //@"F"
    else if (indexPath.section == 6) {
        BookModel *model = self.selfArray7[indexPath.row];
        cell.title.text = model.title;
        cell.imgView.image = [UIImage imageNamed:model.image];
    }
    //@"G"
    else{
        BookModel *model = self.selfArray8[indexPath.row];
        cell.title.text = model.title;
        cell.imgView.image = [UIImage imageNamed:model.image];
    }
     */
    return cell;
}

#pragma mark-懒加载
- (UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];//屏幕大小
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
