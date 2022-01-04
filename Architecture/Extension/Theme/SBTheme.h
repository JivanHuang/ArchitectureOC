//
//  SBTheme.h
//  BaseProject
//
//  Created by Jivan on 2021/8/24.
//

#import <UIKit/UIKit.h>

@interface UIColor (SBTheme)

///主题色
+ (UIColor *)sb_themeColor;

@end

@interface UIFont (SBTheme)

+ (UIFont *)sb_themeRegularFontOfSize:(CGFloat)size;
+ (UIFont *)sb_themeBoldFontOfSize:(CGFloat)size;
+ (UIFont *)sb_themeHeavyFontOfSize:(CGFloat)size;

+ (UIFont *)sb_themeRegularFontOfAutoSize:(CGFloat)autoSize;
+ (UIFont *)sb_themeBoldFontOfAutoSize:(CGFloat)autoSize;
+ (UIFont *)sb_themeHeavyFontOfAutoSize:(CGFloat)autoSize;

@end
