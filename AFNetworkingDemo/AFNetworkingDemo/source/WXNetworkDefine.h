//
//  WXNetworkDefine.h
//  AFNetworkingDemo
//
//  Created by xun wang on 2020/7/2.
//  Copyright © 2020 xun wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXErrorInfo.h"

#define WeakObj(o) try{}@finally{} __weak typeof(o) o##Weak = o;

#define StrongObj(o) autoreleasepool{} __strong typeof(o) o = o##Weak;

// 成功回调
typedef void (^WXNetSuccessBlock)(id model, NSDictionary *result);
// 失败回调
typedef void (^WXNetFailedBlock)(WXErrorInfo *errorInfo);
// 进度回调
typedef void (^WXProgressBlock)(double progress);


typedef enum : NSUInteger {
    get,
    post,
    bodyPost,
    uploadImage,
} WXRequestMethod;
