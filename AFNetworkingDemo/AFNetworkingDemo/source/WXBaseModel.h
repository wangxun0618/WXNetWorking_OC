//
//  WXBaseModel.h
//  AFNetworkingDemo
//
//  Created by xun wang on 2020/7/3.
//  Copyright © 2020 xun wang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface WXBaseModel<T> : NSObject

@property (nonatomic, strong) T data;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *ret;

+ (void)setDataClass:(Class)dataClass;
@end
NS_ASSUME_NONNULL_END
