//
//  NSString+Encrypt.m
//  AFNetworkingDemo
//
//  Created by xun wang on 2020/7/3.
//  Copyright © 2020 xun wang. All rights reserved.
//

#import "NSString+Encrypt.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Encrypt)

- (NSString *)md5
{
    const char *utfAuthString = self.UTF8String;
    int length = (int)strlen(utfAuthString);
    unsigned char bytes[CC_MD5_DIGEST_LENGTH];
    CC_MD5(utfAuthString, length, bytes);
    NSMutableString *MD5AuthString = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [MD5AuthString appendFormat:@"%02x", bytes[i]];
    
    return MD5AuthString;
}


@end
