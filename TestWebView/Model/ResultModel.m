//
//  ResultModel.m
//  TestWebView
//
//  Created by xiaofeishen on 2020/4/12.
//  Copyright © 2020 xiaofeishen. All rights reserved.
//

#import "ResultModel.h"
#import <MJExtension/MJExtension.h>

@implementation ResultModel

+ (void)load {
    [ResultModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"items":@"MessageModel"};
    }];
}

@end
