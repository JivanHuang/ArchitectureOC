
#import "UIView+SBFrame.h"

@implementation UIView (SBFrame)

#pragma mark - Shortcuts for frame properties

- (CGPoint)sb_origin {
	return self.frame.origin;
}

- (void)setSb_origin:(CGPoint)origin {
	CGRect frame = self.frame;
	frame.origin = origin;
	self.frame = frame;
}

- (CGSize)sb_size {
	return self.frame.size;
}

- (void)setSb_size:(CGSize)size {
	CGRect frame = self.frame;
	frame.size = size;
	self.frame = frame;
}

#pragma mark - Shortcuts for positions

- (CGFloat)sb_centerX {
	return self.center.x;
}

- (void)setSb_centerX:(CGFloat)centerX {
	self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)sb_centerY {
	return self.center.y;
}

- (void)setSb_centerY:(CGFloat)centerY {
	self.center = CGPointMake(self.center.x, centerY);
}

#pragma mark - Shortcuts for the coords

- (CGFloat)sb_top {
	return CGRectGetMinY(self.frame);
}

- (void)setSb_top:(CGFloat)y {
	CGRect frame = self.frame;
	frame.origin.y = y;
	self.frame = frame;
}

- (CGFloat)sb_bottom {
	CGRect frame = self.frame;
	return CGRectGetMinY(frame) + CGRectGetHeight(frame);
}

- (void)setSb_bottom:(CGFloat)bottom {
	CGRect frame = self.frame;
	frame.origin.y = bottom - self.frame.size.height;
	self.frame = frame;
}

- (CGFloat)sb_left {
	return CGRectGetMinX(self.frame);
}

- (void)setSb_left:(CGFloat)x {
	CGRect frame = self.frame;
	frame.origin.x = x;
	self.frame = frame;
}

- (CGFloat)sb_right {
	return CGRectGetMinX(self.frame) + CGRectGetWidth(self.frame);
}

- (void)setSb_right:(CGFloat)right {
	CGRect frame = self.frame;
	frame.origin.x = right - CGRectGetWidth(self.frame);
	self.frame = frame;
}

#pragma mark - Shortcuts for the size

- (CGFloat)sb_width {
	return CGRectGetWidth(self.frame);
}

- (void)setSb_width:(CGFloat)width {
	CGRect frame = self.frame;
	frame.size.width = width;
	self.frame = frame;
}

- (CGFloat)sb_height {
	return CGRectGetHeight(self.frame);
}

- (void)setSb_height:(CGFloat)height {
	CGRect frame = self.frame;
	frame.size.height = height;
	self.frame = frame;
}

@end
