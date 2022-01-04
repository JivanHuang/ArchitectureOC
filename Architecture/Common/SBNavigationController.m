//
//  SBNavigationController.m
//  BaseProject
//
//  Created by Jivan on 2021/8/23.
//

#import "SBNavigationController.h"

@interface SBNavigationController ()

@end

@implementation SBNavigationController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
}

#pragma mark - overwrite

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
	if (self.viewControllers.count > 0) {
		viewController.hidesBottomBarWhenPushed = YES;
	}
	[super pushViewController:viewController animated:animated];
}


@end
