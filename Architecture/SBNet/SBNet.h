//
//  SBNet.h
//  BaseProject
//
//  Created by Jivan on 2021/8/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 请求成功的block
typedef void(^SBNetSuccess)(id response);
/// 请求失败的block
typedef void(^SBNetFailure)(NSError *error);

@interface SBNet : NSObject

@end

NS_ASSUME_NONNULL_END
