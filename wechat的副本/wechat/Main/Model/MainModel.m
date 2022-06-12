//
//  MainModel.m
//  wechat
//
//  Created by 小艾同学 on 2022/6/10.
//

#import "MainModel.h"

@implementation MainModel


- (instancetype)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        self.title = dic[@"title"];
        self.image = dic[@"image"];
        self.content = dic[@"content"];
    }
    return self;
}


@end
