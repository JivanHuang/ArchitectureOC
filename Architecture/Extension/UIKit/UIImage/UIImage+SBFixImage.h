
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (SBFixImage)

/// Generate an image based on the color
+ (UIImage *)sb_imageWithColor:(UIColor *)color;
/// change image alpha
- (UIImage *)sb_imageWithAlpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
