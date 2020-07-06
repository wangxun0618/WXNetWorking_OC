//
//  WXRequestMaker.m
//  AFNetworkingDemo
//
//  Created by xun wang on 2020/7/2.
//  Copyright © 2020 xun wang. All rights reserved.
// **************************************************
//   return_type表示返回的对象/关键字等(可以是void，并省略)
//    blockName表示block的名称
//    var_type表示参数的类型(可以是void，并省略)
//    varName表示参数名称
    //return_type (^blockName)(var_type) = ^return_type (var_type varName) { // ... };


#import "WXRequestMaker.h"
#import "WXRequestManager.h"

@interface WXRequestMaker()
{
    NSString *_baseURL;
    NSString *_path;
    NSDictionary *_params;
    Class _modelClass;
    WXProgressBlock _progressBlock;
    WXNetSuccessBlock _successBlock;
    WXNetFailedBlock _failedBlock;
}

@end

@implementation WXRequestMaker

#pragma mark -请求
- (void)requestURL:(WXRequestMethod)method {
    
    NSString *url = [NSString stringWithFormat:@"%@%@",_baseURL, _path];
    NSDictionary *encryptParams = [self encryptParams:_params];

    // 设置请求头
    switch (method) {
        case get:
            [self get:url parameters:encryptParams];
            break;
        case post:
            [self post:url parameters:encryptParams];
            break;
        case bodyPost:
            
            break;
        case uploadImage:
            
            break;
        default:
            break;
    }
}

- (NSURLSessionDataTask *)get:(NSString *)url
                   parameters:(NSDictionary *)params {
    
    NSURLSessionDataTask *task = [WXRequestManager.shareInstance.sessionManager GET:url
                                                parameters:params progress: nil
                                                   success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        [self handleResponse:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self handleRequestError:error];
    }];
    
    return task;
}

- (NSURLSessionDataTask *)post:(NSString *)url
                    parameters:(NSDictionary *)params{
    
    NSURLSessionDataTask *task = [WXRequestManager.shareInstance.sessionManager POST:url
                                                parameters:params progress: nil
                                                   success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        [self handleResponse:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self handleRequestError:error];
    }];
    
    return task;
}


#pragma mark --扩展重写方法

- (NSDictionary *)encryptParams:(NSDictionary *)params {
    return params;
}

- (id)transformModel:(NSDictionary *)result
          modelClass:(Class)class  {

    return result;
}

- (void)handleResponseFail {
    
    
}

- (void)dealloc
{
    NSLog(@"销毁成功");
}


#pragma mark -- 处理返回数据
- (void)handleResponse:(NSDictionary *)result {
    id model = [self transformModel:result modelClass:_modelClass];
    if ([model isKindOfClass:WXErrorInfo.class]) {
        if (_failedBlock) {
            _failedBlock(model);
        }
    } else if (_successBlock && model) {
        if (_successBlock) {
            _successBlock(model, result);
        }
    }
}

- (void)handleRequestError:(NSError *)error {
    WXErrorInfo *errorInfo = [[WXErrorInfo alloc] init];
    errorInfo.code = (int)error.code;
    errorInfo.error = error;
    if ( errorInfo.code == -1009 ) {
        errorInfo.message = @"无网络连接";
    }else if ( errorInfo.code == -1001 ){
        errorInfo.message = @"请求超时";
    }else if ( errorInfo.code == -1005 ){
        errorInfo.message = @"网络连接丢失(服务器忙)";
    }else if ( errorInfo.code == -1004 ){
        errorInfo.message = @"服务器没有启动";
    }else if ( errorInfo.code == 404 || errorInfo.code == 3) {
    }
    if (_failedBlock) {
        _failedBlock(errorInfo);
    }
}

#pragma mark -Getter

- (WXRequestMaker *(^)(NSString *))baseURL {
    return ^id(NSString *baseURL) {
        self.baseURL = baseURL;
        return self;
    };
}

- (WXRequestMaker *(^)(NSString *))path {
    return ^id(NSString *path) {
        self.path = path;
        return self;
    };
}

- (WXRequestMaker *(^)(NSDictionary *))params {
    return ^id(NSDictionary *params) {
        self.params = params;
        return self;
    };
}

- (WXRequestMaker *(^)(NSDictionary *))headers {
    return ^id(NSDictionary *headers) {
        self.headers = headers;
        return self;
    };
}

- (WXRequestMaker *(^)(Class))modelClass {
    return ^id(Class class) {
        self.modelClass = class;
        return self;
    };
}

- (WXRequestMaker *(^)(WXNetSuccessBlock))successBlock {
    return ^id(WXNetSuccessBlock blcok) {
        self.successBlock = blcok;
        return self;
    };
}

- (WXRequestMaker *(^)(WXNetFailedBlock))fialedBlock {
    return ^id(WXNetFailedBlock block) {
        self.fialedBlock = block;
        return self;
    };
}

- (WXRequestMaker *(^)(WXProgressBlock))progressBlock {
    return ^id(WXProgressBlock block) {
        self.progressBlock = block;
        return self;
    };
}

- (WXRequestMaker *(^)(WXRequestMethod))request {
    return ^id(WXRequestMethod method) {
        [self requestURL:method];
        return self;
    };
}
#pragma mark -Setter
- (void)setBaseURL:(NSString *)baseURL {
    _baseURL = baseURL;
}

- (void)setPath:(NSString *)path {
    _path = path;
}

- (void)setParams:(NSDictionary *)params {
    _params = params;
}

- (void)setHeaders:(NSDictionary *)headers {
    // 添加请求头参数
    for (NSString *key in headers) {
        [WXRequestManager.shareInstance.sessionManager.requestSerializer setValue:headers[key] forHTTPHeaderField:key];
    }
}

- (void)setModelClass:(Class)modelClass {
    _modelClass = modelClass;
}

- (void)setSuccessBlock:(WXNetSuccessBlock)block {
    _successBlock = block;
}

- (void)setFialedBlock:(WXNetFailedBlock)block {
    _failedBlock = block;
}

- (void)setProgressBlock:(WXProgressBlock)block {
    _progressBlock = block;
}


@end
