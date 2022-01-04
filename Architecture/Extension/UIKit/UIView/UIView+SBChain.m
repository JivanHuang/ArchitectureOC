//
//  UIView+Chain.m
//  BaseProject
//
//  Created by Jivan on 2021/8/24.
//

#import "UIView+SBChain.h"

@implementation UIView (SBChain)

+ (UIView *)sb_new {
    return [[UIView alloc]init];
}

- (UIView * (^)(UIColor * color))sb_backgroundColor {
    return ^(UIColor * color){
        self.backgroundColor = color;
        return self;
    };
}

- (UIView * (^)(NSInteger tag))sb_tag {
    return ^(NSInteger tag){
        self.tag = tag;
        return self;
    };
}

- (UIView * (^)(CGFloat corner))sb_corner {
    return ^(CGFloat corner){
        self.layer.cornerRadius = corner;
        self.layer.masksToBounds = YES;
        return self;
    };
}

- (UIView * (^)(UIViewContentMode contentMode))sb_contentMode {
    return ^(UIViewContentMode contentMode){
        self.contentMode = contentMode;
        return self;
    };
}

- (UIView * (^)(CGRect frame))sb_frame {
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (UIView * (^)(BOOL hidden))sb_hidden {
    return ^(BOOL hidden){
        self.hidden = hidden;
        return self;
    };
}

- (UIView * (^)(CGFloat alpha))sb_alpha {
    return ^(CGFloat alpha){
        self.alpha = alpha;
        return self;
    };
}

- (UIView * (^)(UIColor * tintColor))sb_tintColor {
    return ^(UIColor * tintColor){
        self.tintColor = tintColor;
        return self;
    };
}

- (UIView * (^)(BOOL userInteractionEnabled))sb_userInteractionEnabled {
    return ^(BOOL userInteractionEnabled){
        self.userInteractionEnabled = userInteractionEnabled;
        return self;
    };
}

- (UIView * (^)(UIView *superView))sb_addTo {
    return ^(UIView *superView){
        [superView addSubview: self];
        return self;
    };
}

@end
