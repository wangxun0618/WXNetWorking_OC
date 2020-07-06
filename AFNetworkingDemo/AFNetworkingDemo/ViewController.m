//
//  ViewController.m
//  AFNetworkingDemo
//
//  Created by xun wang on 2020/7/2.
//  Copyright © 2020 xun wang. All rights reserved.
//

#import "ViewController.h"
#import "WXRequestManager.h"
#import "WXBaseModel.h"
#import "WXInfoModel.h"
#import "WXDataModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSDictionary *dict = @{@"versionNo":@"471",
                           @"source":@"iphone",
                           @"OS":@"13.1.3",
                           @"UUID":@"31980DB1-998E-4FE4-8994-0F9B118649FA",
                           @"deviceType":@"iPhone 6s",
                           @"networkType":@"WIFI",
                           @"sid":@"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1OTUwNjI1MjQwNTAsInBheWxvYWQiOiJcIjE1ODEzODY1NjU1XCIifQ.Vaq56AgTkuhoDyECmK_yLlzSkIfsnruxQhCvY92UZ9I",
                           @"aid":@"193",
};
    
        dict = @{@"versionNo":@"471",
                               @"source":@"iphone",
                               @"OS":@"13.1.3",
                               @"UUID":@"31980DB1-998E-4FE4-8994-0F9B118649FA",
                               @"deviceType":@"iPhone 6s",
                               @"networkType":@"WIFI",
                               @"sid":@"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1OTUwNjI1MjQwNTAsInBheWxvYWQiOiJcIjE1ODEzODY1NjU1XCIifQ.Vaq56AgTkuhoDyECmK_yLlzSkIfsnruxQhCvY92UZ9I",
                               @"aid":@"124",
    };

    
    WXRequestManager.wx_maker
                    .params(dict)
                    .modelClass([WXDataModel class])
                    .baseURL(@"https://appdr.wenwo.com")
                    .path(@"/action/doAction")
                    .request(post)
                    .successBlock(^(WXBaseModel<WXDataModel *> *model, NSDictionary *result) {
        
                        NSLog(@"%@",model.data.interviewList.firstObject.guestNickname);
    });
    
    
}


@end
