//
//  NSDate+Utilities.m
//  BaseProject
//
//  Created by Jivan on 2021/8/24.
//

#import "NSDate+Utilities.h"

static NSDateFormatter * _sharedDateFormatter;
static NSCalendar *_sharedCalendar;

@implementation NSDate (Utilities)

- (NSString *)sb_dateDescription {
    
    if ([self sb_isDateToday]) {
        //今天
        NSInteger interval = ABS((NSInteger)[self timeIntervalSinceNow]);
        if (interval < 60) {
            return @"刚刚";
        }
        interval /= 60;
        if (interval < 60) {
            return [NSString stringWithFormat:@"%zd 分钟前", interval];
        }
        return [NSString stringWithFormat:@"%zd 小时前", interval / 60];
    }
    
    NSMutableString *formatString = [NSMutableString stringWithString:@" HH:mm"];
    
    if ([self sb_isDateYesterday]) {
        //昨天
        [formatString insertString:@"昨天" atIndex:0];
    }else{
        [formatString insertString:@"MM-dd" atIndex:0];
        if (![self sb_isThisyear]) {
            [formatString insertString:@"yyyy-" atIndex:0];
        }
    }
    
    NSDateFormatter *formatter = [NSDate sb_dateFormatter];
    formatter.dateFormat = formatString;
    return [formatter stringFromDate:self];
}

- (NSString *)sb_dateStringFormatter:(NSString *)formatterString{
    
    NSDateFormatter *formatter = [NSDate sb_dateFormatter];
    formatter.dateFormat = formatterString;
    return [formatter stringFromDate:self];
    
}
- (BOOL)sb_isDateTomorrow {
    return [[NSDate sb_currentCalendar] isDateInTomorrow:self];
}

- (BOOL)sb_isDateYesterday {
    return [[NSDate sb_currentCalendar] isDateInYesterday:self];
}

- (BOOL)sb_isDateToday {
    return [[NSDate sb_currentCalendar] isDateInToday:self];
}

- (BOOL)sb_isDateInWeekend {
    return [[NSDate sb_currentCalendar] isDateInWeekend:self];
}

- (BOOL)sb_isThisyear {
    NSCalendar *calendar = [NSDate sb_currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear;
    NSDateComponents *selfDateComponents = [calendar components:unit fromDate:self];
    NSDateComponents *nowDateComponents = [calendar components:unit fromDate:[NSDate date]];
    return selfDateComponents.year == nowDateComponents.year;
    
}

+ (NSTimeInterval)sb_nowTimeInterval {
    return [[NSDate sb_now] timeIntervalSince1970];
}

- (NSTimeInterval)sb_timeInterval {
    return [self timeIntervalSince1970];
}
+ (NSCalendar *)sb_currentCalendar {
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedCalendar = [NSCalendar autoupdatingCurrentCalendar];
    });
    
    return _sharedCalendar;
}

+ (NSDateFormatter *)sb_dateFormatter {
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedDateFormatter = [[NSDateFormatter alloc] init];
    });
    
    return _sharedDateFormatter;
    
}

+ (NSDate *)sb_now {
    if (@available(iOS 13.0, *)) {
        return [NSDate now];
    } else {
        return [NSDate date];
    }
}

@end
