//
//  WXDataModel.h
//  AFNetworkingDemo
//
//  Created by xun wang on 2020/7/6.
//  Copyright © 2020 xun wang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WXInterviewModel : NSObject
@property (nonatomic, copy) NSString *activeState;
@property (nonatomic, copy) NSString *applyingFlag;
@property (nonatomic, copy) NSString *guestNickname;
@property (nonatomic, copy) NSString *interviewPic;

@end

@interface WXDataModel : NSObject
@property (nonatomic, copy) NSString *answerQuestions;
@property (nonatomic, copy) NSString *exposureNumber;
@property (nonatomic, copy) NSString *increaseFans;
@property (nonatomic, copy) NSArray<WXInterviewModel *> *interviewList;

@end





NS_ASSUME_NONNULL_END
