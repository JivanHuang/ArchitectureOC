
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,SBHUDType) {
    SBHUDTypeSuccess,
    SBHUDTypeWarn,
    SBHUDTypeError,
    SBHUDTypeLoading,
};

@interface SBHUD : NSObject

+ (void)showHUDWithType:(SBHUDType)type text:(NSString *)text;
+ (void)showHUDWithType:(SBHUDType)type text:(NSString *)text view:(UIView *)view;
+ (void)showHUDWithType:(SBHUDType)type text:(NSString *)text view:(UIView *)view afterDelay:(NSTimeInterval)delay;

+ (void)hideHUD;
+ (void)hideHUDForView:(UIView *)view;


@end

NS_ASSUME_NONNULL_END
