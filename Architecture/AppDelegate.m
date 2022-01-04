//
//  AppDelegate.m
//  BaseProject
//
//  Created by Jivan on 2021/8/23.
//

#import "AppDelegate.h"
#import "SBTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	// Override point for customization after application launch.
	[self makeKeyWindow];
	return YES;
}

- (void)makeKeyWindow {

	UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
	SBTabBarController *tabController = [[SBTabBarController alloc]init];
	window.rootViewController = tabController;
	window.backgroundColor = [UIColor whiteColor];
	[UIApplication sharedApplication].delegate.window = window;
	[window makeKeyAndVisible];
}

@end
