

#import "NSString+SBTrims.h"

@implementation NSString (SBTrims)

- (NSString *)sb_trimmingWhitespace {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)sb_trimmingWhitespaceAndNewlines {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (BOOL)sb_isEmptyString {
    if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if (self.length == 0 || [self sb_trimmingWhitespaceAndNewlines].length == 0) {
        return YES;
    }
    return NO;
}

@end
