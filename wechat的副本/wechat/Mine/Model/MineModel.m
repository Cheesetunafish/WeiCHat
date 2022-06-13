//
//  MineModel.m
//  wechat
//
//  Created by 小艾同学 on 2022/6/13.
//

#import "MineModel.h"

@implementation MineModel

- (instancetype)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        self.title = dic[@"title"];
        self.image = dic[@"image"];
    }
    return self;
}


@end
