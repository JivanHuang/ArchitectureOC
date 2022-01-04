
#import "UIImage+SBResize.h"

@implementation UIImage (SBResize)

- (UIImage *)sb_imageCroppedToRect:(CGRect)rect{
    //create drawing context
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0f);
    
    //draw
    [self drawAtPoint:CGPointMake(-rect.origin.x, -rect.origin.y)];
    
    //capture resultant image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //return image
    return image;
}

- (UIImage *)sb_imageScaledToSize:(CGSize)size{
    //avoid redundant drawing
    if (CGSizeEqualToSize(self.size, size))
    {
        return self;
    }
    
    //create drawing context
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    
    //draw
    [self drawInRect:CGRectMake(0.0f, 0.0f, size.width, size.height)];
    
    //capture resultant image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //return image
    return image;
}

- (UIImage *)sb_imageScaledToFitSize:(CGSize)size{
    //calculate rect
    CGFloat aspect = self.size.width / self.size.height;
    if (size.width / aspect <= size.height)
    {
        return [self sb_imageScaledToSize:CGSizeMake(size.width, size.width / aspect)];
    }
    else
    {
        return [self sb_imageScaledToSize:CGSizeMake(size.height * aspect, size.height)];
    }
}

- (UIImage *)sb_imageScaledToFillSize:(CGSize)size{
    if (CGSizeEqualToSize(self.size, size))
    {
        return self;
    }
    //calculate rect
    CGFloat aspect = self.size.width / self.size.height;
    if (size.width / aspect >= size.height)
    {
        return [self sb_imageScaledToSize:CGSizeMake(size.width, size.width / aspect)];
    }
    else
    {
        return [self sb_imageScaledToSize:CGSizeMake(size.height * aspect, size.height)];
    }
}


@end
