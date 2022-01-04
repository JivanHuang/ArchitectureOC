

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (SBTrims)

/// 去除空格
- (NSString *)sb_trimmingWhitespace;
/// 去除空格和换行符
- (NSString *)sb_trimmingWhitespaceAndNewlines;
/// 是否为空字符串
- (BOOL)sb_isEmptyString;

@end

NS_ASSUME_NONNULL_END
