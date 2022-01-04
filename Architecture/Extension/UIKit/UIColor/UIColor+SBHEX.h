
#import <UIKit/UIKit.h>

@interface UIColor (SBHEX)

+ (UIColor *)sb_colorWithHex:(UInt32)hex;
+ (UIColor *)sb_colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;
+ (UIColor *)sb_colorWithHexString:(NSString *)hexString;

+ (UIColor *)sb_colorWithWholeRed:(CGFloat)red
                            green:(CGFloat)green
                             blue:(CGFloat)blue
                            alpha:(CGFloat)alpha;
+ (UIColor *)sb_colorWithWholeRed:(CGFloat)red
                            green:(CGFloat)green
                             blue:(CGFloat)blue;
- (NSString *)sb_HEXString;

@end
