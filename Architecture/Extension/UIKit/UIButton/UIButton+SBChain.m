//
//  UIButton+SBChain.m
//  BaseProject
//
//  Created by Jivan on 2021/8/24.
//

#import "UIButton+SBChain.h"

@implementation UIButton (SBChain)

+ (UIButton *)sb_new {
    return [self buttonWithType:(UIButtonTypeCustom)];
}

- (UIButton * (^)(UIColor * color))sb_backgroundColor {
    return ^(UIColor * color){
        self.backgroundColor = color;
        return self;
    };
}

- (UIButton * (^)(UIFont *font))sb_font {
    return ^(UIFont * font){
        self.titleLabel.font = font;
        return self;
    };
}


- (UIButton * (^)(NSInteger lines))sb_lines {
    return ^(NSInteger lines){
        self.titleLabel.numberOfLines = lines;
        return self;
    };
}

- (UIButton * (^)(UIImage * image, UIControlState state))sb_image {
    return ^(UIImage * image, UIControlState state){
        [self setImage: image forState: state];
        return self;
    };
}

- (UIButton * (^)(UIImage * image))sb_normalImage {
    return ^(UIImage * image){
        [self setImage: image forState: UIControlStateNormal];
        return self;
    };
}
- (UIButton * (^)(UIImage * image))sb_selectedImage {
    return ^(UIImage * image){
        [self setImage: image forState: UIControlStateSelected];
        return self;
    };
}

- (UIButton * (^)(NSString * title, UIControlState state))sb_title {
    return ^(NSString * title, UIControlState state){
        [self setTitle: title forState: state];
        return self;
    };
}
- (UIButton * (^)(NSString * title))sb_normalTitle {
    return ^(NSString * title){
        [self setTitle: title forState: UIControlStateNormal];
        return self;
    };
}

- (UIButton * (^)(NSString * title))sb_selectedTitle {
    return ^(NSString * title){
        [self setTitle: title forState: UIControlStateSelected];
        return self;
    };
}


- (UIButton * (^)(UIColor * titleColor, UIControlState state))sb_titleColor {
    return ^(UIColor * titleColor, UIControlState state){
        [self setTitleColor: titleColor forState: state];
        return self;
    };
}
- (UIButton * (^)(UIColor * titleColor))sb_normalTitleColor {
    return ^(UIColor * titleColor){
        [self setTitleColor: titleColor forState: UIControlStateNormal];
        return self;
    };
}
- (UIButton * (^)(UIColor * titleColor))sb_selectTitleColor {
    return ^(UIColor * titleColor){
        [self setTitleColor: titleColor forState: UIControlStateSelected];
        return self;
    };
}


- (UIButton * (^)(UIImage * backgroundImage, UIControlState state))sb_backgroundImage {
    return ^(UIImage * backgroundImage, UIControlState state){
        [self setBackgroundImage:backgroundImage forState:state];
        return self;
    };
}
- (UIButton * (^)(UIImage * backgroundImage))sb_normalBackgroundImage {
    return ^(UIImage * backgroundImage){
        [self setBackgroundImage:backgroundImage forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton * (^)(UIImage * backgroundImage))sb_selectedBackgroundImage {
    return ^(UIImage * backgroundImage){
        [self setBackgroundImage:backgroundImage forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton * (^)(NSAttributedString * attributedText, UIControlState state))sb_attributedText {
    return ^(NSAttributedString * attributedText, UIControlState state){
        [self setAttributedTitle:attributedText forState:(state)];
        return self;
    };
}
- (UIButton * (^)(NSAttributedString * attributedText))sb_normalAttributedText {
    return ^(NSAttributedString * attributedText){
        [self setAttributedTitle:attributedText forState:(UIControlStateNormal)];
        return self;
    };
}

- (UIButton * (^)(NSAttributedString * attributedText))sb_selectedAttributedText {
    return ^(NSAttributedString * attributedText){
        [self setAttributedTitle:attributedText forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton * (^)(UIView *superView))sb_addTo {
    return ^(UIView *superView){
        [superView addSubview: self];
        return self;
    };
}

@end
