//
//  UIView+Chain.h
//  BaseProject
//
//  Created by Jivan on 2021/8/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/// 链式编程
@interface UIView (SBChain)

+ (UIView *)sb_new ;

- (UIView * (^)(UIColor * color))sb_backgroundColor ;

- (UIView * (^)(NSInteger tag))sb_tag ;

- (UIView * (^)(CGFloat corner))sb_corner ;

- (UIView * (^)(UIViewContentMode contentMode))sb_contentMode;

- (UIView * (^)(CGRect frame))sb_frame;

- (UIView * (^)(BOOL hidden))sb_hidden ;

- (UIView * (^)(CGFloat alpha))sb_alpha ;

- (UIView * (^)(UIColor * tintColor))sb_tintColor ;

- (UIView * (^)(BOOL userInteractionEnabled))sb_userInteractionEnabled ;

- (UIView * (^)(UIView *superView))sb_addTo;

@end

NS_ASSUME_NONNULL_END
