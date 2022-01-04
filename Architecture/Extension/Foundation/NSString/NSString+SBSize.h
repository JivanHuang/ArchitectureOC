

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (SBSize)

/// 计算文字的高度
/// @param font 字体(默认为系统字体)
/// @param width 约束宽度
- (CGFloat)sb_heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;

/// 计算文字的宽度
/// @param font 字体(默认为系统字体)
/// @param height 约束高度
- (CGFloat)sb_widthWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height;

/// 计算文字的大小
/// @param font 字体(默认为系统字体)
/// @param width 约束宽度
- (CGSize)sb_sizeWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;

/// 计算文字的大小
/// @param font 字体(默认为系统字体)
/// @param height 约束高度
- (CGSize)sb_sizeWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height;

/// 反转字符串
/// @param strSrc 被反转字符串
+ (NSString *)sb_reverseString:(NSString *)strSrc;

@end

NS_ASSUME_NONNULL_END
