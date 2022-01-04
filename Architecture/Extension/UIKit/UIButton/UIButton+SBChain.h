//
//  UIButton+SBChain.h
//  BaseProject
//
//  Created by Jivan on 2021/8/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (SBChain)

+ (UIButton *)sb_new;

- (UIButton * (^)(UIColor * color))sb_backgroundColor;

- (UIButton * (^)(UIFont *font))sb_font;

- (UIButton * (^)(NSInteger lines))sb_lines;

- (UIButton * (^)(UIImage * image, UIControlState state))sb_image;
- (UIButton * (^)(UIImage * image))sb_normalImage;
- (UIButton * (^)(UIImage * image))sb_selectedImage;

- (UIButton * (^)(NSString * title, UIControlState state))sb_title;
- (UIButton * (^)(NSString * title))sb_normalTitle;
- (UIButton * (^)(NSString * title))sb_selectedTitle;

- (UIButton * (^)(UIColor * titleColor, UIControlState state))sb_titleColor;
- (UIButton * (^)(UIColor * titleColor))sb_normalTitleColor;
- (UIButton * (^)(UIColor * titleColor))sb_selectTitleColor;

- (UIButton * (^)(UIImage * backgroundImage, UIControlState state))sb_backgroundImage;
- (UIButton * (^)(UIImage * backgroundImage))sb_normalBackgroundImage;
- (UIButton * (^)(UIImage * backgroundImage))sb_selectedBackgroundImage;

- (UIButton * (^)(NSAttributedString * attributedText, UIControlState state))sb_attributedText;
- (UIButton * (^)(NSAttributedString * attributedText))sb_normalAttributedText;
- (UIButton * (^)(NSAttributedString * attributedText))sb_selectedAttributedText;

- (UIButton * (^)(UIView *superView))sb_addTo;

@end

NS_ASSUME_NONNULL_END
