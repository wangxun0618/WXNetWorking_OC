//
//  WXRequestMaker.h
//  AFNetworkingDemo
//
//  Created by xun wang on 2020/7/2.
//  Copyright © 2020 xun wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WXNetworkDefine.h"
NS_ASSUME_NONNULL_BEGIN

@interface WXRequestMaker : NSObject

- (id)transformModel:(NSDictionary *)result
          modelClass:(Class)class ;

- (void)handleResponseFail;

- (NSDictionary *)encryptParams:(NSDictionary *)params;


#pragma mark -Getter

- (WXRequestMaker *(^)(NSString *))baseURL;

- (WXRequestMaker *(^)(NSString *))path;

- (WXRequestMaker *(^)(NSDictionary *))params;

- (WXRequestMaker *(^)(NSDictionary *))headers;

- (WXRequestMaker *(^)(Class))modelClass;

- (WXRequestMaker *(^)(WXNetSuccessBlock))successBlock;

- (WXRequestMaker *(^)(WXNetFailedBlock))fialedBlock;

- (WXRequestMaker *(^)(WXProgressBlock))progressBlock;

- (WXRequestMaker *(^)(WXRequestMethod))request;


#pragma mark -Setter
- (void)setBaseURL:(NSString *)baseURL;

- (void)setPath:(NSString *)path;

- (void)setParams:(NSDictionary *)params;

- (void)setHeaders:(NSDictionary *)headers;

- (void)setModelClass:(Class)modelClass;

- (void)setSuccessBlock:(WXNetSuccessBlock)block;

- (void)setFialedBlock:(WXNetFailedBlock)block;

- (void)setProgressBlock:(WXProgressBlock)block;


@end

NS_ASSUME_NONNULL_END
