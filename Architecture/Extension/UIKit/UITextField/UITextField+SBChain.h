//
//  UITextField+SBChain.h
//  BaseProject
//
//  Created by Jivan on 2021/8/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (SBChain)

+ (UITextField *)sb_new;

- (UITextField * (^)(UIColor * color))sb_backgroundColor;

- (UITextField * (^)(UIFont *font))sb_font;

- (UITextField * (^)(UIColor * textColor))sb_textColor;

- (UITextField * (^)(NSTextAlignment alignment))sb_textAlignment;

- (UITextField * (^)(NSString * placeholder))sb_placeholder;
- (UITextField * (^)(NSAttributedString * attributedPlaceholder))sb_attributedPlaceholder;

- (UITextField * (^)(NSString *text))sb_text;
- (UITextField * (^)(NSAttributedString * attributedText))sb_attributedText;

- (UITextField * (^)(UIView *superView))sb_addTo;

@end

NS_ASSUME_NONNULL_END
