
#import "SBHUD.h"
#import <MBProgressHUD/MBProgressHUD.h>

@implementation SBHUD

+ (void)showHUDWithType:(SBHUDType)type text:(NSString *)text {
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if (window == nil) {
        window = [UIApplication sharedApplication].windows.firstObject;
    }
    [SBHUD showHUDWithType: type text: text view: window];
}

+ (void)showHUDWithType:(SBHUDType)type text:(NSString *)text view:(UIView *)view {
    [SBHUD showHUDWithType: type text: text view: view afterDelay: 1.0];
}

+ (void)showHUDWithType:(SBHUDType)type text:(NSString *)text view:(UIView *)view afterDelay:(NSTimeInterval)delay {
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo: view animated: YES];
    hud.label.text = text;
    
    if (type == SBHUDTypeLoading) {
        hud.mode = MBProgressHUDModeIndeterminate;
    }else{
        NSString *imageName ;
        if (type == SBHUDTypeSuccess) {
            imageName = @"success";
        }
        else if (type == SBHUDTypeError) {
            imageName = @"error";
        }
        else {
            imageName = @"warn";
        }
        hud.mode = MBProgressHUDModeCustomView;
        NSString *imagePath = [[SBHUD hudBundle] pathForResource: imageName ofType: @"png"];
        UIImage *image = [UIImage imageWithContentsOfFile: imagePath];
        image = [image imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)];
        UIImageView *imageView = [[UIImageView alloc] initWithImage: image];
        imageView.tintColor = [UIColor whiteColor];
        hud.customView = imageView;
        [hud hideAnimated:YES afterDelay: delay];
    }
    hud.contentColor = [UIColor whiteColor];
    hud.bezelView.blurEffectStyle = UIBlurEffectStyleDark;
    hud.bezelView.color = [UIColor blackColor];
    hud.removeFromSuperViewOnHide = YES;
}

+ (void)hideHUD {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if (window == nil) {
        window = [UIApplication sharedApplication].windows.firstObject;
    }
    [MBProgressHUD hideHUDForView:window animated:YES];
}

+ (void)hideHUDForView:(UIView *)view {
    [MBProgressHUD hideHUDForView:view animated:YES];
}


+ (NSBundle *)hudBundle {
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource: @"SBHUD" ofType: @"bundle"];
    return [NSBundle bundleWithPath: bundlePath];
}


@end
