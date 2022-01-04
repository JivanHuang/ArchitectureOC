
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM (NSInteger, JKImagePosition) {
	SBImagePositionLeft = 0,          // 图片在左，文字在右，默认
	SBImagePositionRight = 1,         // 图片在右，文字在左
	SBImagePositionTop = 2,           // 图片在上，文字在下
	SBImagePositionBottom = 3,        // 图片在下，文字在上
};

@interface UIButton (SBImagePosition)
/// 利用 UIButton 的 titleEdgeInsets 和 imageEdgeInsets 来实现文字和图片的自由排列
/// 注意：这个方法需要在设置图片和文字之后才可以调用，且 button 的大小要大于 图片大小+文字大小+spacing
- (void)setImagePosition:(JKImagePosition)postion spacing:(CGFloat)spacing;

@end

NS_ASSUME_NONNULL_END
