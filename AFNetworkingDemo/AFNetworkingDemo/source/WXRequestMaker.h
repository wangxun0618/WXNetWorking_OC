//
//  WXRequestMaker.h
//  AFNetworkingDemo
//
//  Created by xun wang on 2020/7/2.
//  Copyright © 2020 xun wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXNetworkDefine.h"
NS_ASSUME_NONNULL_BEGIN

@interface WXRequestMaker : NSObject

- (WXRequestMaker *(^)(WXRequestMethod))method;

- (WXRequestMaker *(^)(NSString *))baseURL;

- (WXRequestMaker *(^)(NSString *))path;

- (WXRequestMaker *(^)(NSDictionary *))params;

- (WXRequestMaker *(^)(NSDictionary *))headers;


@end

NS_ASSUME_NONNULL_END
