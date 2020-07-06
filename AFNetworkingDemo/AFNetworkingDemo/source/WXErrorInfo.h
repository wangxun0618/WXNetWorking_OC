//
//  WXErrorInfo.h
//  AFNetworkingDemo
//
//  Created by xun wang on 2020/7/2.
//  Copyright © 2020 xun wang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WXErrorInfo : NSObject

/// 错误码
@property (nonatomic, assign) int code;

/// 错误信息
@property (nonatomic, copy) NSString *message;

/// error
@property (nonatomic, strong) NSError *error;


@end

NS_ASSUME_NONNULL_END
