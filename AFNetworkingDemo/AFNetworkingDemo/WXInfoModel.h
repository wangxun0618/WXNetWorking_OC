//
//  WXInfoModel.h
//  AFNetworkingDemo
//
//  Created by xun wang on 2020/7/3.
//  Copyright © 2020 xun wang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WXInfoModel : NSObject

@property (nonatomic, copy) NSString *areaCode;
@property (nonatomic, copy) NSString *areaName;
@property (nonatomic, copy) NSString *areaType;
@property (nonatomic, copy) NSString *cityName;
@property (nonatomic, copy) NSString *clinicName;

@end

NS_ASSUME_NONNULL_END
