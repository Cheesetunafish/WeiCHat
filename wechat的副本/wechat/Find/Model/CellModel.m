//
//  CellModel.m
//  wechat
//
//  Created by 小艾同学 on 2022/6/20.
//

#import "CellModel.h"
#import <UIKit/UIKit.h>
#import "Masonry.h"

extern const CGFloat contentLabelFontSize;
extern CGFloat maxContentLabelHeight;

@implementation CellModel {
    CGFloat _lastContentWidth;
}

@synthesize  msgContent = _msgContent;

// init
- (instancetype)initWithDictionary:(NSDictionary *)dic {
   self = [super init];
   if (self) {
       self.iconName = dic[@"iconName"];
       self.name = dic[@"name"];
       self.msgContent = dic[@"msgContent"];
       self.picNamesArray = dic[@"picNamesArray"];
   }
   return self;
}

// set方法
- (void)setMsgContent:(NSString *)msgContent {
    _msgContent = msgContent;
}

- (NSString *)msgContent {
    // 设置文字宽度
    CGFloat contentW = [UIScreen mainScreen].bounds.size.width - 70;
    if (contentW != _lastContentWidth) {
        _lastContentWidth = contentW;
        // 获取label高度/计算文本尺寸
        CGRect textRect = [_msgContent boundingRectWithSize:CGSizeMake(contentW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:contentLabelFontSize]} context:nil];
        // 判断是否应该展开
        if (textRect.size.height > maxContentLabelHeight) {
            _shouldShowMoreButton = YES;
        } else {
            _shouldShowMoreButton = NO;
        }
    }
    return _msgContent;
}

// 判断是否在展开状态
- (void)setIsOpening:(BOOL)isOpening {
    // 不存在展开按钮
    if (!_shouldShowMoreButton) {
        _isOpening = NO;
    }
    else {
        _isOpening = isOpening;
    }
}

@end

@implementation CellLikeItemModel


@end

@implementation CellCommentItemModel



@end
