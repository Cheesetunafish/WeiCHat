//
//  FindPostVC.m
//  wechat
//
//  Created by 小艾同学 on 2022/6/15.
//

#import "FindPostVC.h"
#import "FindVC.h"
//view
#import "PostPhotoView.h"
#import "PostCollectionCell.h"
//tool
#import "Masonry.h"
#import <Photos/Photos.h>
#import <PhotosUI/PhotosUI.h>

#define screenWidth self.view.frame.size.width
#define screenHeight self.view.frame.size.height

#define LINESPACING 5 // 行间距
#define INTERSPACING 10 // item间距

#define CELLW (screenWidth - 40)/3
#define CELLH (screenWidth - 40)/3

@interface FindPostVC ()<UITextViewDelegate, PostPhotoDelegate, PHPickerViewControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

// 按钮
@property (nonatomic, strong) UIButton *postBtn;
@property (nonatomic, strong) UIButton *cancelBtn;
// 文本框
@property (nonatomic, strong) UITextView *textView;
// 提示框
@property (nonatomic, strong) UIAlertController *alert;
// 图片view
@property (nonatomic, strong) PostPhotoView *postPhotoView;
// 图片collectionView
@property (nonatomic, strong) UICollectionView *collection;
// 图片
@property (nonatomic, copy) NSMutableArray *imgArray;
@property (nonatomic, strong) UIImage *selectImg;
@end

@implementation FindPostVC 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.cancelBtn];
    [self.view addSubview:self.postBtn];
    [self.view addSubview:self.textView];
    [self.view addSubview:self.collection];
//    [self.view addSubview:self.postPhotoView];
    
    
    [self setPosition];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    
    
}

- (UIButton *)cancelBtn {
    if (_cancelBtn == nil) {
        _cancelBtn = [UIButton new];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        // 弹出提示
        [_cancelBtn addTarget:self action:@selector(popAlert) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _cancelBtn;
}

- (UIButton *)postBtn {
    if (_postBtn == nil) {
        _postBtn = [UIButton new];
        [_postBtn setImage:[UIImage imageNamed:@"rectangle.fill"] forState:UIControlStateNormal];
        [_postBtn setImage:[UIImage imageNamed:@"rectangle.unable"] forState:UIControlStateDisabled];
        _postBtn.enabled = NO;
        
        [_postBtn addTarget:self action:@selector(postSaySay) forControlEvents:UIControlEventTouchUpInside];
    }
    return _postBtn;
}

- (UITextView *)textView {
    if (_textView == nil) {
        _textView = [UITextView new];
        _textView.keyboardType = UIKeyboardTypeDefault;
        _textView.text = @"这一刻的想法...";
        _textView.font = [UIFont systemFontOfSize:15];
        _textView.textColor = [UIColor systemGrayColor];
        _textView.delegate = self;
        
    }
    return _textView;
}

- (UICollectionView *)collection {
    if (_collection == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        [layout setItemSize:CGSizeMake(CELLW, CELLH)];
        layout.minimumLineSpacing = LINESPACING; // 行间距
        layout.minimumInteritemSpacing = INTERSPACING; // 列间距
//        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];    // 滚动方向垂直
        _collection.scrollEnabled = NO;
        _collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 250, screenWidth, 400) collectionViewLayout:layout];
        
        _collection.delegate = self;
        _collection.dataSource = self;
        _collection.showsVerticalScrollIndicator = NO;  // 隐藏垂直方向滚动条
        
        [_collection registerClass:[PostCollectionCell class] forCellWithReuseIdentifier:@"MyCell"];  // 注册cell
    }
    return _collection;
}
//- (PostPhotoView *)postPhotoView {
//    if (_postPhotoView == nil) {
//        _postPhotoView = [[PostPhotoView alloc] init];
//        _postPhotoView.frame = CGRectMake(0, 250, screenWidth, 400);
//        _postPhotoView.delegate = self;
//    }
//    return _postPhotoView;
//}

- (void)setPosition {
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).mas_offset(20);
        make.top.equalTo(self.view).mas_offset(45);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(50);
    }];
    
    [self.postBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).mas_offset(-20);
        make.top.equalTo(self.cancelBtn);
//        make.centerY.equalTo(self);
        make.width.mas_equalTo(self.cancelBtn);
        make.height.mas_equalTo(50);
    }];
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).mas_offset(20);
        make.right.equalTo(self.view).mas_offset(-20);
        make.height.mas_equalTo(100);
        make.top.equalTo(self.cancelBtn.mas_bottom).mas_offset(20);
    }];
    
}

// 弹出提示框
- (void)popAlert {
    if ([self.textView.text isEqualToString:@"这一刻的想法..."] || self.textView.text.length < 1){
        [self.delegate didClickedCancelButton];
    }
    else{
        // 1.弹框提醒
            // 初始化对话框
        self.alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否保存？" preferredStyle:UIAlertControllerStyleAlert];
        [self.alert addAction:[UIAlertAction actionWithTitle:@"不保存" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            self.textView.text=@"";
            [self.delegate didClickedCancelButton];
        }]];
        [self.alert addAction:[UIAlertAction actionWithTitle:@"保存" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.delegate didClickedCancelButton];
        }]];
            [self presentViewController:self.alert animated:true completion:nil];
    }
}

- (void)postSaySay {
    [self.delegate didClickedPostButton];
}


#pragma mark - UICollectionViewDelegateFlowLayout
// 缩进
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(10, 10, 0, 10);
}

#pragma mark - UICollectionViewDataSource
// 定义展示的UICollectionViewCell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 9;
}

// 定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
// 内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // 创建cell (重用)
    PostCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCell" forIndexPath:indexPath];
    cell.delegate = self;
    // 设置cell
    
    if (cell.image.image == nil) {
        cell.selectBtn.hidden = NO;
    }
    else {
        self.postBtn.enabled = YES;
        cell.image.image = self.imgArray[indexPath.row];
        cell.selectBtn.hidden = YES;
    }
//    UILabel *label = [[UILabel alloc] initWithFrame:cell.bounds];
//    label.textAlignment = NSTextAlignmentCenter;
//    label.text = @"cell";
//    label.textColor = [UIColor whiteColor];
//    [cell addSubview:label];

    return cell;
}

#pragma mark - UICollectionViewDelegate
// 点击cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"选中cell: %ld", indexPath.row);
}
// UICollectionView是否可以被选择
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}



#pragma mark - UITextViewDelegate
- (void)textViewDidEndEditing:(UITextView *)textView {
    
    if(textView.text.length < 1){
        textView.text = @"这一刻的想法...";
        textView.textColor = [UIColor grayColor];
    }
}

// 开始编辑，清空文本
- (void)textViewDidBeginEditing:(UITextView *)textView {
    
    if([textView.text isEqualToString:@"这一刻的想法..."]){
        textView.text=@"";
        textView.textColor=[UIColor blackColor];
        self.postBtn.enabled = YES;
    }
}

#pragma mark - PostPhotoDelegate
- (void)postPhoto {
    PHPickerConfiguration *config = [[PHPickerConfiguration alloc] init];
    config.selectionLimit = 9;
    config.filter = [PHPickerFilter imagesFilter];

    PHPickerViewController *pickerViewController = [[PHPickerViewController alloc] initWithConfiguration:config];
    pickerViewController.delegate = self;
    [self presentViewController:pickerViewController animated:YES completion:nil];
}


#pragma mark - PHPickerDelegate
// 完成选择，
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    [self.imgArray addObject:image];
    
//    self.imageView.image = image;

    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)picker:(PHPickerViewController *)picker didFinishPicking:(NSArray<PHPickerResult *> *)results{
   [picker dismissViewControllerAnimated:YES completion:nil];
    
   for (PHPickerResult *result in results)
   {
      // Get UIImage
      [result.itemProvider loadObjectOfClass:[UIImage class] completionHandler:^(__kindof id<NSItemProviderReading>  _Nullable object, NSError * _Nullable error)
      {
         if ([object isKindOfClass:[UIImage class]])
         {
            dispatch_async(dispatch_get_main_queue(), ^{
               NSLog(@"Selected image: %@", (UIImage*)object);
            });
         }
      }];
   }
}
/*
- (UIImageView*)newImageViewForImage:(UIImage*)image{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.backgroundColor = [UIColor blackColor];
    imageView.image = image;
    return imageView;
}

- (void)clearImageViews{
    for (UIImageView *imageView in self.imgArray) {
        [imageView removeFromSuperview];
    }
    [self.imgArray removeAllObjects];
}


- (void)picker:(PHPickerViewController *)picker didFinishPicking:(NSArray<PHPickerResult *> *)results{
    NSLog(@"-picker:%@ didFinishPicking:%@", picker, results);
    
    [self clearImageViews];// 上面声明的方法
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    for (PHPickerResult *result in results) {
        NSLog(@"result: %@", result);
        
        NSLog(@"%@", result.assetIdentifier);
        NSLog(@"%@", result.itemProvider);
        
        // Get UIImage
        [result.itemProvider loadObjectOfClass:[UIImage class] completionHandler:^(__kindof id<NSItemProviderReading>  _Nullable object, NSError * _Nullable error) {
            NSLog(@"object: %@, error: %@", object, error);

            if ([object isKindOfClass:[UIImage class]]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    UIImageView *imageView = [self newImageViewForImage:(UIImage*)object];
                    [self.imgArray addObject:imageView];
//                    [self->scrollView addSubview:imageView];
                    
                    [self.view setNeedsLayout];
                });
            }
        }];
    }
 
}
 */
 
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
