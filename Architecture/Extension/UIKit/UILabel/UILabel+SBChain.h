//
//  UILabel+Chain.h
//  BaseProject
//
//  Created by Jivan on 2021/8/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/// 链式编程
@interface UILabel (SBChain)

+ (UILabel *)sb_new;

- (UILabel * (^)(UIColor * color))sb_backgroundColor;

- (UILabel * (^)(UIFont *font))sb_font;

- (UILabel * (^)(NSString * text))sb_text;
- (UILabel * (^)(NSAttributedString * attributedText))sb_attributedText;

- (UILabel * (^)(UIColor * textColor))sb_textColor;

- (UILabel * (^)(NSInteger lines))sb_lines;

- (UILabel * (^)(NSTextAlignment alignment))sb_textAlignment;

- (UILabel * (^)(UIView *superView))sb_addTo;

@end

NS_ASSUME_NONNULL_END
