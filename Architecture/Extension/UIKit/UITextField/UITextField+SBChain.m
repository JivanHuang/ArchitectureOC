//
//  UITextField+SBChain.m
//  BaseProject
//
//  Created by Jivan on 2021/8/24.
//

#import "UITextField+SBChain.h"

@implementation UITextField (SBChain)

+ (UITextField *)sb_new {
    return [[self alloc]init];
}

- (UITextField * (^)(UIColor * color))sb_backgroundColor {
    return ^(UIColor * color){
        self.backgroundColor = color;
        return self;
    };
}

- (UITextField * (^)(UIFont *font))sb_font {
    return ^(UIFont * font){
        self.font = font;
        return self;
    };
}

- (UITextField * (^)(UIColor * textColor))sb_textColor {
    return ^(UIColor * textColor){
        self.textColor = textColor;
        return self;
    };
}

- (UITextField * (^)(NSString * placeholder))sb_placeholder {
    return ^(NSString * placeholder){
        self.placeholder = placeholder;
        return self;
    };
}

- (UITextField * (^)(NSAttributedString * attributedPlaceholder))sb_attributedPlaceholder {
    return ^(NSAttributedString * attributedPlaceholder){
        self.attributedPlaceholder = attributedPlaceholder;
        return self;
    };
}

- (UITextField * (^)(NSTextAlignment alignment))sb_textAlignment {
    return ^(NSTextAlignment alignment){
        self.textAlignment = alignment;
        return self;
    };
}

- (UITextField * (^)(NSString *text))sb_text {
    return ^(NSString * text){
        self.text = text;
        return self;
    };
}

- (UITextField * (^)(NSAttributedString * attributedText))sb_attributedText {
    return ^(NSAttributedString * attributedText){
        self.attributedText = attributedText;
        return self;
    };
}

- (UITextField * (^)(UIView *superView))sb_addTo {
    return ^(UIView *superView){
        [superView addSubview: self];
        return self;
    };
}

@end
