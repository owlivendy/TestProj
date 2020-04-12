//
//  ResultModel.h
//  TestWebView
//
//  Created by xiaofeishen on 2020/4/12.
//  Copyright © 2020 xiaofeishen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class MessageModel;
@interface ResultModel : NSObject
@property (nonatomic, copy) NSArray<MessageModel *> *items;
@property (nonatomic, assign) NSInteger count;
@end

NS_ASSUME_NONNULL_END
