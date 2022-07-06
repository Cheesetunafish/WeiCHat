//
//  PostPhotoView.m
//  wechat
//
//  Created by 小艾同学 on 2022/7/6.
//

#import "PostPhotoView.h"
#import <Photos/Photos.h>
#import <PhotosUI/PhotosUI.h>
#import "Masonry.h"

@interface PostPhotoView()<PHPickerViewControllerDelegate>



@end

@implementation PostPhotoView
//{
//        UIScrollView *scrollView;
//        NSMutableArray <UIImageView*>* imageViews;
//        UIButton *selectButton;
//}

- (instancetype)init {
    self = [super init];
    if (self) {
        
//        self.backgroundColor = [UIColor systemGray3Color];
        [self addSubview:self.selectBtn];
        [self setPosition];
    }
    return self;
}

// 图片数组
- (NSMutableArray *)itemsArray {
    if (!_itemsArray) {
        _itemsArray = [[NSMutableArray alloc] init];
    }
    return _itemsArray;
}

// 添加图片按钮
- (UIButton *)selectBtn {
    if (_selectBtn == nil) {
        _selectBtn = [UIButton new];
        [_selectBtn setImage:[UIImage imageNamed:@"add_image" ]forState:UIControlStateNormal];
        
        [_selectBtn addTarget:self action:@selector(didClickedSelectBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectBtn;
}

- (void)setPosition {
    [self.selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
    }];
}

//- (void)didClickedSelectBtn {
//    [self.delegate postPhoto];
//}


//#pragma mark - PHPicker

//-(void)selectPressed:(id)sender{
//    PHPickerConfiguration *config = [[PHPickerConfiguration alloc] init];
//    config.selectionLimit = 3;
//    config.filter = [PHPickerFilter imagesFilter];
//
//    PHPickerViewController *pickerViewController = [[PHPickerViewController alloc] initWithConfiguration:config];
//    pickerViewController.delegate = self;
//    [self presentViewController:pickerViewController animated:YES completion:nil];
//}

@end
