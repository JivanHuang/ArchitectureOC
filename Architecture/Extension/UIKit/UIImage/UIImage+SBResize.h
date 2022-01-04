
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (SBResize)

- (UIImage *)sb_imageCroppedToRect:(CGRect)rect;
- (UIImage *)sb_imageScaledToSize:(CGSize)size;
- (UIImage *)sb_imageScaledToFitSize:(CGSize)size;
- (UIImage *)sb_imageScaledToFillSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
