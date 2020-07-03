//
//  WXNetworkManager.m
//  AFNetworkingDemo
//
//  Created by xun wang on 2020/7/2.
//  Copyright © 2020 xun wang. All rights reserved.
//

#import "WXRequestManager.h"
#import <AFNetworking.h>

@interface WXRequestManager()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation WXRequestManager

static WXRequestManager *instance = nil;

#pragma mark -----Start 创建单例
+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

//使用gcd的dispatch_once()方法，在传入的代码段中，调用父类的内存申请函数
+(id) allocWithZone:(struct _NSZone*)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone];
    });
    return instance;
}
#pragma mark -----End 创建单例


#pragma mark -----初始化
- (instancetype)init {
    if (self = [super init]) {
        [self setConfiguration];
    }
    return self;
}

- (void)setConfiguration {
    NSURLSessionConfiguration *configuration = NSURLSessionConfiguration.defaultSessionConfiguration;
    configuration.timeoutIntervalForRequest = 20;

    _sessionManager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    
    //可以接受的类型
    _sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript",@"text/plain", nil];
}

- (WXRequestMaker *)wx_makeRequests {
    
    WXRequestMaker *marker = [[WXRequestMaker alloc] init];
    return marker;
}




@end
