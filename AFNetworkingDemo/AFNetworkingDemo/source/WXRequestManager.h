//
//  WXNetworkManager.h
//  AFNetworkingDemo
//
//  Created by xun wang on 2020/7/2.
//  Copyright © 2020 xun wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXNetworkDefine.h"
#import "WXRequestMaker.h"
#import <AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

@interface WXRequestManager : NSObject

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

/// 创建请求管理类单例
+ (instancetype)shareInstance;

+ (WXRequestMaker *)wx_maker;


@end

NS_ASSUME_NONNULL_END
