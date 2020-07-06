//
//  WXRequestMaker+HandleResponse.m
//  AFNetworkingDemo
//
//  Created by xun wang on 2020/7/3.
//  Copyright © 2020 xun wang. All rights reserved.
//

#import "WXRequestMaker+HandleResponse.h"
#import "WXErrorInfo.h"
#import "NSString+Encrypt.h"
#import "WXBaseModel.h"
#import "WXInfoModel.h"
#import <YYModel.h>

@implementation WXRequestMaker (HandleResponse)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

- (id)transformModel:(NSDictionary *)result
          modelClass:(Class)class {
    
    [WXBaseModel setDataClass:class];
    WXBaseModel *model = [WXBaseModel yy_modelWithDictionary:result];
    
    if (model) {
        return model;
    }
    return result;
}

- (id)handleResponseFail {
    WXErrorInfo *errorInfo = [[WXErrorInfo alloc] init];
    errorInfo.code = -1;
    errorInfo.message = @"数据解析出错";
    return errorInfo;
}

- (NSDictionary *)encryptParams:(NSDictionary *)params {
    
    // 添加时间
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:params];
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyyMMddHHmmss";
    dict[@"time"] = [dateFormatter stringFromDate:date];
    
    //拼接weiwen.com
    NSMutableString *composedString = [NSMutableString stringWithString:@"weiwen.com"];

    NSArray *sortedArray = [[dict allKeys] sortedArrayUsingSelector:@selector(compare:)];
    for (NSString *key in sortedArray) {
        [composedString appendFormat:@"%@%@",key,dict[key]];
    }
    
    //加密
    dict[@"sign"] = [composedString md5];
    
    return dict;
    
}

#pragma clang diagnostic pop
@end
