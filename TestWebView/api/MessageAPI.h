//
//  MessageAPI.h
//  TestWebView
//
//  Created by xiaofeishen on 2020/4/12.
//  Copyright © 2020 xiaofeishen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MessageModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MessageAPI : NSObject

//键 (Key)    类型 （Type）    值 （Value）    描述
//id    字符串    长度1到16    用户名
//limit    数值    1到20，缺省为10    取的元素个数
//lastItem    数值 （可选）    timestamp    前一次调用返回的最后一个元素
//direction    数值
//（可选）    0或1，缺省为0取更旧的元素，1取更新的元素（注意lastItem作相应选择）    用于下拉获取更多元素或刷新新消息
+ (void)getMessageWithDict:(NSDictionary *)dict completion:(void(^)(NSArray<MessageModel *> *data))completion;

+ (void)postMessageWithDict:(NSDictionary *)dict completion:(void(^)(BOOL success))completion;

@end

NS_ASSUME_NONNULL_END
