//
//  SBNet.m
//  BaseProject
//
//  Created by Jivan on 2021/8/30.
//

#import "SBNet.h"
#import "SBApi.h"
#import "SBNetwork.h"

@implementation SBNet

//MARK: 请求的公共方法

+ (NSURLSessionTask *)POST:(NSString *)URL
                parameters:(NSDictionary *)parameter
                   success:(SBNetSuccess)success
                   failure:(SBNetFailure)failure{
    //设置请求头, 请求参数的格式, 返回数据的格式....这样你就不需要每次请求都要设置一遍相关参数
    [SBNetwork setValue:@"iOS" forHTTPHeaderField:@"OS"];
    // 发起请求
    return [SBNetwork post:URL parameters:parameter headers:nil success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
