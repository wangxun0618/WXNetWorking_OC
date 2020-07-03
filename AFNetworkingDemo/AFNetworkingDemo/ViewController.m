//
//  ViewController.m
//  AFNetworkingDemo
//
//  Created by xun wang on 2020/7/2.
//  Copyright © 2020 xun wang. All rights reserved.
//

#import "ViewController.h"
#import "WXRequestManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    WXRequestManager.wx_maker.method(post);
}


@end
