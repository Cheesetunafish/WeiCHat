//
//  FindVC.m
//  wechat
//
//  Created by 小艾同学 on 2022/6/5.
//

// Controller
#import "FindVC.h"
#import "FindPostVC.h"
// View
#import "FindCell.h"
#import "BannerView.h"
#import "TopView.h"
#import "MenuView.h"
// model
#import "CellModel.h"
// tool
#import "SDAutoLayout.h"
#import "MJRefresh.h"

#define SCREENHEIGHT self.view.frame.size.height
#define SCREENWIDTH self.view.frame.size.width

@interface FindVC ()<UITableViewDelegate,UITableViewDataSource,/*operationCellDelegate,*/ UITextFieldDelegate, postViewDelegate>
// 评论
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) BannerView *banner;
@property (nonatomic, strong) TopView *topView;
@property (nonatomic, strong) FindCell *cell;
@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) FindPostVC *post;


@end

@implementation FindVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.table];
    [self.table addSubview:self.banner];
    self.table.tableHeaderView = self.banner;
    _post = [FindPostVC new];
    _post.delegate = self;
    [self loadTopView];
    
    /*
     MJRefresh
     */
//    __weak typeof(self) weakSelf = self;
//    self.table.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        //刷新时候，需要执行的代码。一般是请求最新数据，请求成功之后，刷新列表
//        [weakSelf loadNewData];
//    }];
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
    
    
    
    
    
    // Do any additional setup after loading the view.
}
- (void)loadTopView {
    // 相机
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"camera"] style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonItemAction:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[[UILabel alloc]initWithFrame:CGRectMake(0, 5, 20, 20)]];
     self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    self.view.backgroundColor = [UIColor whiteColor];
}
#pragma mark - 方法
// 相机界面跳转
-(void)rightBarButtonItemAction:(id)sender{
    _post.modalPresentationStyle = 0;
    [self presentViewController:_post animated:YES completion:nil];
}

//- (void)loadNewData{
//    NSLog(@"请求最新数据");
//    //这里假设2秒之后获取到了最新的数据，刷新tableview，并且结束刷新控件的刷新状态
//    __weak typeof(self) weakSelf = self;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        //刷新列表
//        [weakSelf.table reloadData];
////        [self.banner setNeedsLayout];
//        //拿到当前的刷新控件，结束刷新状态
//        [weakSelf.table.mj_header endRefreshing];
//    });
//}

#pragma mark-UITableViewDelegate
// 行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//     2.计算高度
    CellModel *model = self.dataArray[indexPath.row];
    NSString *content = model.msgContent;

    CGFloat contentW = [UIScreen mainScreen].bounds.size.width - 20;
    
    CGRect textRect = [content boundingRectWithSize:CGSizeMake(contentW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil];
    CGFloat contentHeight;
    
    contentHeight = ceilf(textRect.size.height);

    return contentHeight + 100;
//    return 200;
    
}

#pragma mark-UITableViewDataSource
// cell组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
// cell行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

// cell内容 自定义
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"cell";
    FindCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[FindCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }  
    
    cell.indexPath = indexPath;
    NSLog(@"\\内容自定义%@\\",cell.indexPath);
    
    __weak typeof(self) weakSelf = self;
    if (!cell.moreButtonClickedBlock) {
        [cell setMoreButtonClickedBlock:^(NSIndexPath *indexPath) {
            CellModel *model = weakSelf.dataArray[indexPath.row];
            // 手动反一次open状态
            model.isOpening = !model.isOpening;
            NSLog(@"%d",model.isOpening);
            
            NSLog(@"FindVC中的block实行!!%@",indexPath);
            // 重新加载cell
            [weakSelf.table reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        }];
    }
//    cell.delegate = self;
    // 设置数据
    cell.model = self.dataArray[indexPath.row];
    return cell;
}


#pragma mark - postViewDelegate
- (void)didClickedCancelButton {
    self.modalPresentationStyle = 0;
//    [_post presentViewController:self animated:YES completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didClickedPostButton {
    
}

#pragma mark- 懒加载
- (UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];// 屏幕大小
        _table.delegate = self;
        _table.dataSource = self;
    }
    return _table;
}

- (BannerView *)banner {
    if (_banner == nil) {
        _banner = [BannerView new];
        
        _banner.frame = CGRectMake(0, 0, self.view.frame.size.width, 300);
        _banner.backgroundColor = [UIColor systemBlueColor];
    }
    return _banner;
}

- (TopView *)topView {
    if (_topView == nil) {
        _topView = [TopView new];
        _topView.frame = CGRectMake(0, 0, self.view.frame.size.width, 100);
    }
    return _topView;
}


#pragma mark - operationCellDelegate
// 点赞

- (void)didClickedLikeButtonInCell:(UITableViewCell *)cell with:(NSIndexPath *)indexPath {
    CellModel *model = self.dataArray[indexPath.row];
    NSMutableArray *temp = [NSMutableArray arrayWithArray:model.likeItemsArray];
    
    //添加点赞
    if (!model.isLiked) {
        CellLikeItemModel *likeModel = [CellLikeItemModel new];
        likeModel.userName = @"小艾同学在轨道";
//        likeModel.userId = @"randomUserId";
        [temp addObject:likeModel];
        model.liked = YES;
    }
    // 删除点赞
    else {
        CellLikeItemModel *tempLikeModel = nil;
        for (CellLikeItemModel *likeModel in model.likeItemsArray) {
            if ([likeModel.userName isEqualToString:@"小艾同学在轨道"]) {
                tempLikeModel = likeModel;
                break;
            }
        }
        [temp removeObject:tempLikeModel];
        model.liked = NO;
    }
    model.likeItemsArray = [temp copy];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.table reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    });
}

// 评论
- (void)didClickedCommentButtonInCell:(UITableViewCell *)cell with:(NSIndexPath *)indexPath {
    CellModel *model = self.dataArray[indexPath.row];
    _textField.frame = CGRectMake(0, SCREENHEIGHT-120, SCREENWIDTH, 40);
    _textField.placeholder = [NSString stringWithFormat:@" 评论 %@", model.name];
    [_textField becomeFirstResponder];

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
