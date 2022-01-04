
#import <UIKit/UIKit.h>

@interface UIView (SBFrame)

// shortcuts for frame properties
@property (nonatomic, assign) CGPoint sb_origin;
@property (nonatomic, assign) CGSize sb_size;

// shortcuts for positions
@property (nonatomic) CGFloat sb_centerX;
@property (nonatomic) CGFloat sb_centerY;

// shortcuts for the coords
@property (nonatomic) CGFloat sb_top;
@property (nonatomic) CGFloat sb_bottom;
@property (nonatomic) CGFloat sb_left;
@property (nonatomic) CGFloat sb_right;

// shortcuts for the size
@property (nonatomic) CGFloat sb_width;
@property (nonatomic) CGFloat sb_height;

@end
