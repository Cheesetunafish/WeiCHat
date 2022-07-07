//
//  MineVC.m
//  wechat
//
//  Created by 小艾同学 on 2022/6/5.
//

//controller
#import "MineVC.h"
#import "LogVC.h"
#import "ChangeVC.h"
//view
#import "MineCell.h"
#import "MineTopView.h"
//model
#import "MineModel.h"
//tool
#import "Masonry.h"

@interface MineVC ()<UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate>


@property (nonatomic, strong) UIButton *Btn;

@property (nonatomic, copy) NSMutableArray *selfArray2;
@property (nonatomic, copy) NSMutableArray *selfArray3;
@property (nonatomic, strong) MineTopView *topView;
@end

@implementation MineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.table];
    [self.view addSubview:self.Btn];
    [self.view addSubview:self.topView];
    self.table.tableHeaderView = self.topView;
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //读取plist
    //1.创建路径（maybe
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"MinePlist" ofType:@"plist"];
    //2.获取路径
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    //3.打印数据
    NSLog(@"%@", data);
    
    //取出每一个字典放入数组
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
    return 50;
}

#pragma mark - UITableView点击跳转到头像页面
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}

#pragma mark-UITableViewDataSource
//cell组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

//cell行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
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
        _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height-100) style:UITableViewStyleGrouped];//屏幕大小
        _table.delegate = self;
        _table.dataSource = self;
    }
    return _table;
}

- (MineTopView *)topView {
    if (!_topView) {
        _topView = [[MineTopView alloc]init];
        _topView.frame = CGRectMake(0, 100, self.view.frame.size.width, 100);
        // 设置手势
        _topView.imgView.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(alterHeadPortrait:)];
        [_topView.imgView addGestureRecognizer:singleTap];
        
        _topView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapother = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(checkPhoto:)];
        [_topView addGestureRecognizer:tapother];
    }
    return _topView;
}

- (UIButton *)Btn {
    if (_Btn == nil) {
        _Btn = [[UIButton alloc] init];
        _Btn.frame = CGRectMake(0, self.view.frame.size.height - 340, self.view.frame.size.width, 50);
        [_Btn setTitle:@"退出" forState:UIControlStateNormal];
        [_Btn setBackgroundColor:[UIColor whiteColor]];
        [_Btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_Btn addTarget:self action:@selector(exit:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _Btn;
}

#pragma mark- 方法

- (void)exit:(UIButton *)btn {
    btn.selected = !btn.selected;
    // 点击按钮
    if (btn.selected == YES) {
        // 状态：未登录
        [NSUserDefaults.standardUserDefaults setBool:NO forKey:@"isLoad"];
        LogVC *logVC = [[LogVC alloc] init];
        logVC.modalPresentationStyle = 0;
        [self presentViewController:logVC animated:NO completion:Nil];
//        [self.navigationController pushViewController:logVC animated:NO];
    }
    else {
        [NSUserDefaults.standardUserDefaults setBool:YES forKey:@"isLoad"];
    }
}

// 弹出提示框
- (void)alterHeadPortrait:(UITapGestureRecognizer *)gesture{
    //初始化提示框
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    //按钮：从相册选择，类型：UIAlertActionStyleDefault
    [alert addAction:[UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self albumPhoto];
    }]];
    
    //按钮：拍照，类型：UIAlertActionStyleDefault
    [alert addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self takePhoto];
    }]];
    
    //按钮：取消，类型：UIAlertActionStyleCancel
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)checkPhoto:(UITapGestureRecognizer *)gesture{
    ChangeVC *vc = [ChangeVC new];
    [self.navigationController pushViewController:vc animated:YES];
}

// 从相机
- (void)takePhoto {
    UIImagePickerController *pickImg = [[UIImagePickerController alloc]init];

    //获取方式1：通过相册（呈现全部相册），UIImagePickerControllerSourceTypePhotoLibrary
    //获取方式2，通过相机，UIImagePickerControllerSourceTypeCamera
    //获取方方式3，通过相册（呈现全部图片），UIImagePickerControllerSourceTypeSavedPhotosAlbum
    pickImg.sourceType = UIImagePickerControllerSourceTypeCamera;
    pickImg.allowsEditing = YES;
    pickImg.delegate = self;
    //页面跳转
    [self presentViewController:pickImg animated:YES completion:nil];
}

// 从相册
- (void)albumPhoto {
    UIImagePickerController *pickImg = [[UIImagePickerController alloc]init];
    pickImg.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    pickImg.allowsEditing = YES;
    pickImg.delegate = self;
    [self presentViewController:pickImg animated:YES completion:^{
            NSLog(@"did从相册");
    }];
}

//PickerImage完成后的代理方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    //定义一个newPhoto，用来存放我们选择的图片。
    UIImage *newPhoto = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    //把newPhono设置成头像
    _topView.imgView.image = newPhoto;
    //关闭当前界面，即回到主界面去
    [self dismissViewControllerAnimated:YES completion:nil];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *imageData = UIImageJPEGRepresentation(self.topView.imgView.image, 1);
    [userDefaults setObject:imageData forKey:@"userImage"];
    [userDefaults synchronize];
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
