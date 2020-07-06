//
//  WXBaseModel.m
//  AFNetworkingDemo
//
//  Created by xun wang on 2020/7/3.
//  Copyright © 2020 xun wang. All rights reserved.
//

#import "WXBaseModel.h"
#import <YYModel.h>

static Class _dataClass;

@implementation WXBaseModel

+ (void)setDataClass:(Class)dataClass {
    _dataClass = dataClass;
}

+ (NSArray *)modelPropertyBlacklist {
    return @[@"data"];
}

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    if ([[dic valueForKeyPath:@"data"] isKindOfClass:[NSArray class]]) {
        _data = [NSArray yy_modelArrayWithClass:_dataClass json:[dic valueForKeyPath:@"data"]];
    }
    
    _data = [[_dataClass class] yy_modelWithDictionary:[dic valueForKeyPath:@"data"]];
    
    return YES;
}

@end

