//
//  SBTheme.m
//  BaseProject
//
//  Created by Jivan on 2021/8/24.
//

#import "SBTheme.h"
#import "UIColor+SBHEX.h"

@implementation UIColor (SBTheme)

+ (UIColor *)sb_themeColor{
    return [UIColor sb_colorWithHex:0X2F2F2F];
}

@end

@implementation UIFont (SBTheme)

+ (UIFont *)sb_themeRegularFontOfAutoSize:(CGFloat)autoSize {
    return [UIFont systemFontOfSize:AutoWidth(autoSize) weight:(UIFontWeightRegular)];
}

+ (UIFont *)sb_themeBoldFontOfAutoSize:(CGFloat)autoSize {
    return [UIFont systemFontOfSize:AutoWidth(autoSize) weight:(UIFontWeightBold)];
}

+ (UIFont *)sb_themeHeavyFontOfAutoSize:(CGFloat)autoSize {
    return [UIFont systemFontOfSize:AutoWidth(autoSize) weight:(UIFontWeightHeavy)];
}

+ (UIFont *)sb_themeRegularFontOfSize:(CGFloat)size {
    return [UIFont systemFontOfSize:size weight:(UIFontWeightRegular)];
}

+ (UIFont *)sb_themeBoldFontOfSize:(CGFloat)size {
    return [UIFont systemFontOfSize:size weight:(UIFontWeightBold)];
}

+ (UIFont *)sb_themeHeavyFontOfSize:(CGFloat)size {
    return [UIFont systemFontOfSize:size weight:(UIFontWeightHeavy)];
}

@end
