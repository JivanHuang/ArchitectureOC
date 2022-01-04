//
//  NSDate+Utilities.h
//  BaseProject
//
//  Created by Jivan on 2021/8/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Utilities)

/// 现在
+ (NSDate *)sb_now;
/// 当前时间戳
+ (NSTimeInterval)sb_nowTimeInterval;
/// 是否是明天
- (BOOL)sb_isDateTomorrow;
/// 是否是昨天
- (BOOL)sb_isDateYesterday;
/// 是否是今天
- (BOOL)sb_isDateToday;
/// 是否是周末
- (BOOL)sb_isDateInWeekend;
/// 格式化日期
- (NSString *)sb_dateDescription;
/// 格式化日期
- (NSString *)sb_dateStringFormatter:(NSString *)formatterString;
/// 时间戳
- (NSTimeInterval)sb_timeInterval;

@end



NS_ASSUME_NONNULL_END
