
#import "NSBundle+SBInfo.h"

@implementation NSBundle (SBInfo)

+ (UIImage *)sb_appIcon {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *iconFilename = [infoDictionary objectForKey: @"CFBundleIconFile"];
    NSString *iconBasename = [iconFilename stringByDeletingPathExtension] ;
    NSString *iconExtension = [iconFilename pathExtension] ;
    NSString *appIconPath = [[NSBundle mainBundle] pathForResource: iconBasename ofType: iconExtension] ;
    UIImage *appIcon = [[UIImage alloc] initWithContentsOfFile: appIconPath] ;
    return appIcon;
}

+ (NSString *)sb_version {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey: @"CFBundleShortVersionString"];
    return app_Version;
}
+ (NSInteger)sb_build {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_build = [infoDictionary objectForKey: @"CFBundleVersion"];
    return [app_build integerValue];
}
+ (NSString *)sb_bundleId {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * bundleIdentifier = [infoDictionary objectForKey: @"CFBundleIdentifier"];
    return bundleIdentifier;
}

@end
