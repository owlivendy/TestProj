//
//  ResponseModel.h
//  TestWebView
//
//  Created by xiaofeishen on 2020/4/12.
//  Copyright © 2020 xiaofeishen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class ResultModel;
@interface ResponseModel : NSObject
@property (nonatomic, strong) ResultModel *data;
@end

NS_ASSUME_NONNULL_END
