//
//  UILabel+Chain.m
//  BaseProject
//
//  Created by Jivan on 2021/8/23.
//

#import "UILabel+SBChain.h"

@implementation UILabel (SBChain)

+ (UILabel *)sb_new {
    return [[self alloc]init];
}
- (UILabel * (^)(UIColor * color))sb_backgroundColor {
    return ^(UIColor * color){
        self.backgroundColor = color;
        return self;
    };
}

- (UILabel * (^)(UIFont *font))sb_font {
    return ^(UIFont * font){
        self.font = font;
        return self;
    };
}

- (UILabel * (^)(NSString * text))sb_text {
    return ^(NSString * text){
        self.text = text;
        return self;
    };
}

- (UILabel * (^)(NSAttributedString * attributedText))sb_attributedText {
    return ^(NSAttributedString * attributedText){
        self.attributedText = attributedText;
        return self;
    };
}

- (UILabel * (^)(UIColor * textColor))sb_textColor {
    return ^(UIColor * textColor){
        self.textColor = textColor;
        return self;
    };
}

- (UILabel * (^)(NSInteger lines))sb_lines {
    return ^(NSInteger lines){
        self.numberOfLines = lines;
        return self;
    };
}

- (UILabel * (^)(NSTextAlignment alignment))sb_textAlignment {
    return ^(NSTextAlignment alignment){
        self.textAlignment = alignment;
        return self;
    };
}

- (UILabel * (^)(UIView *superView))sb_addTo {
    return ^(UIView *superView){
        [superView addSubview: self];
        return self;
    };
}

@end
