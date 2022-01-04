
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (SBInfo)

/// AppIcon
+ (UIImage *)sb_appIcon;
/// App Version
+ (NSString *)sb_version;
/// App Build Version
+ (NSInteger)sb_build;
/// App   Bundle Identifier
+ (NSString *)sb_bundleId;


@end

NS_ASSUME_NONNULL_END
