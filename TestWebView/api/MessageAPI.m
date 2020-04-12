//
//  MessageAPI.m
//  TestWebView
//
//  Created by xiaofeishen on 2020/4/12.
//  Copyright © 2020 xiaofeishen. All rights reserved.
//

#import "MessageAPI.h"
#import "ResultModel.h"
#import "ResponseModel.h"

#import <AFNetworking/AFNetworking.h>
#import <MJExtension/MJExtension.h>

static NSString *baseURL = @"https://3evjrl4n5d.execute-api.us-west-1.amazonaws.com";

@implementation MessageAPI

+ (void)getMessageWithDict:(NSDictionary *)dict completion:(void(^)(NSArray<MessageModel *> *data))completion {
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:baseURL]];
    [manager GET:@"/dev/message" parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        ResponseModel *responseModel = [ResponseModel mj_objectWithKeyValues:responseObject];
        completion(responseModel.data.items);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error.description);
    }];
}

+ (void)postMessageWithDict:(NSDictionary *)dict completion:(void(^)(BOOL success))completion {
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:baseURL]];
    manager.requestSerializer = [[AFJSONRequestSerializer alloc] init];
    [manager POST:@"/dev/message" parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        double creationTime = [responseObject[@"creationTime"] doubleValue];
        completion(creationTime > 0);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error.description);
    }];
}
@end
