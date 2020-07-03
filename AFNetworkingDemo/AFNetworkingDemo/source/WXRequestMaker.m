//
//  WXRequestMaker.m
//  AFNetworkingDemo
//
//  Created by xun wang on 2020/7/2.
//  Copyright © 2020 xun wang. All rights reserved.
//

#import "WXRequestMaker.h"

@interface WXRequestMaker()
{
    WXRequestMethod method;
    NSString *baseURL;
    NSString *path;
    NSString *params;
    NSString *headers;
}

@end

@implementation WXRequestMaker

- (WXRequestMaker *(^)(WXRequestMethod))method {
    return ^(WXRequestMethod method) {
        
        return self;
    };
}

- (WXRequestMaker *(^)(NSString *))baseURL {
    return ^(NSString *baseURL) {
        self.
        return self;
    };
}

- (WXRequestMaker *(^)(NSString *))path {
    return ^(NSString *path) {
        
        return self;
    };
}

- (WXRequestMaker *(^)(NSDictionary *))params {
    return ^(NSDictionary *params) {
        
        return self;
    };
}

- (WXRequestMaker *(^)(NSDictionary *))headers {
    return ^(NSDictionary *headers) {
        
        return self;
    };
}



@end
