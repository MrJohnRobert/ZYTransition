
//
//  MyTabBarController.m
//  ZYTransition
//
//  Created by zhouyang on 2018/8/13.
//  Copyright © 2018年 zhouyang. All rights reserved.
//

#import "MyTabBarController.h"
#import "ViewController.h"
#import "SecondViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"
#import "TransitionManager.h"

@interface MyTabBarController ()<UITabBarControllerDelegate>

@property (nonatomic, assign) NSUInteger storedIndex;

@end

@implementation MyTabBarController

- (instancetype)init {
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
}

#pragma mark --UITabBarControllerDelegate
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
    NSLog(@"%s", __func__);
}

-(id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController animationControllerForTransitionFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {

    UINavigationController *nav = (UINavigationController *)toVC;
    UIViewController *vc = nav.topViewController;
    
    if ([vc isKindOfClass:[SecondViewController class]]) {
        return [[TransitionManager sharedManager] transitionAnimationType:TransitionAnimationTypeExtend];
    }else if([vc isKindOfClass:[ThreeViewController class]]) {
        return [[TransitionManager sharedManager] transitionAnimationType:TransitionAnimationTypeFlipPage animationDuration:1.3];
    }else if([vc isKindOfClass:[ViewController class]]) {
        return [[TransitionManager sharedManager] transitionAnimationType:TransitionAnimationTypeRipple];
    }else if([vc isKindOfClass:[FourViewController class]]) {
        return [[TransitionManager sharedManager] transitionAnimationType:TransitionAnimationTypeBrickOpen];
    }else if([vc isKindOfClass:[FiveViewController class]]) {
        return [[TransitionManager sharedManager] transitionAnimationType:TransitionAnimationTypeSpread];
    }{
        return nil;
    }

}

- (void)setup {
    
    [self addChildViewController:[[ViewController alloc] init] title:@"首页" imageName:@"tab_icon_community"];
    [self addChildViewController:[[SecondViewController alloc] init] title:@"发现" imageName:@"tab_icon_community"];
    [self addChildViewController:[[ThreeViewController alloc] init] title:@"社区" imageName:@"tab_icon_community"];
    [self addChildViewController:[[FourViewController alloc] init] title:@"联系" imageName:@"tab_icon_community"];
    [self addChildViewController:[[FiveViewController alloc] init] title:@"我的" imageName:@"tab_icon_community"];
}

/// 添加子控制器
- (void)addChildViewController:(UIViewController *)viewController title:(NSString *)title imageName:(NSString *)name {
    
    viewController.tabBarItem.title = title;
    viewController.tabBarItem.image = [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_press", name]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [viewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blueColor]} forState:UIControlStateNormal];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    [self addChildViewController:nav];
}

@end



