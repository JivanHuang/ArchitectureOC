//
//  SBTabBarController.m
//  BaseProject
//
//  Created by Jivan on 2021/8/23.
//

#import "SBTabBarController.h"
#import "SBNavigationController.h"
#import "SBViewController.h"

@interface SBTabBarController ()

@end

@implementation SBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupChildControllers];
}

- (void)setupChildControllers{
    [self configureChildsWithController:[[SBViewController alloc] init] title:@"资讯" imageName:@"information"];
    [self configureChildsWithController:[[SBViewController alloc] init] title:@"社区" imageName:@"community"];
    [self configureChildsWithController:[[SBViewController alloc] init] title:@"我的" imageName:@"personal"];
}

- (void)configureChildsWithController:(SBViewController *)controller
                                title:(NSString *)title
                            imageName:(NSString *)imageName {
    
    controller.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    controller.tabBarItem.selectedImage =  [[UIImage imageNamed:[NSString stringWithFormat:@"%@_sel",imageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    controller.title = title;
    SBNavigationController *nav = [[SBNavigationController alloc] initWithRootViewController:controller];
    [self addChildViewController:nav];
}

@end
