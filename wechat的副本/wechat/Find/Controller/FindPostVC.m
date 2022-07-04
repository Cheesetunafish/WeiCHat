//
//  FindPostVC.m
//  wechat
//
//  Created by 小艾同学 on 2022/6/15.
//

#import "FindPostVC.h"
#import "FindVC.h"
//tool
#import "Masonry.h"
#import <Photos/Photos.h>
#import <PhotosUI/PhotosUI.h>

@interface FindPostVC ()<UITextViewDelegate, PHPickerViewControllerDelegate>



@property (nonatomic, strong) UIButton *postBtn;
@property (nonatomic, strong) UIButton *cancelBtn;

@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UIAlertController *alert;
@end

@implementation FindPostVC {
    UIScrollView *scrollView;
        NSMutableArray <UIImageView*>* imageViews;
        UIButton *selectButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.cancelBtn];
    [self.view addSubview:self.postBtn];
    [self.view addSubview:self.textView];
    
    
    
    [self setPosition];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    //PHPICKER
//    imageViews = [NSMutableArray array];
//
//    // Create ScrollView
//    scrollView = [[UIScrollView alloc] init];
//    scrollView.backgroundColor = [UIColor colorWithWhite:0.98 alpha:1];
//    [self.view addSubview:scrollView];
//
//    // Select Photos Button
//    selectButton = [UIButton buttonWithType:UIButtonTypeSystem];
//    [selectButton setTitle:@"Select Photos" forState:UIControlStateNormal];
//    [selectButton addTarget:self action:@selector(selectPressed:) forControlEvents:UIControlEventTouchUpInside];
//    [selectButton sizeToFit];
//    [self.view addSubview:selectButton];
    
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
        make.height.mas_equalTo(300);
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
