//
//  TransitionAnimationRipple.m
//  ZYTransition
//
//  Created by zhouyang on 2018/8/15.
//  Copyright © 2018年 zhouyang. All rights reserved.
//

#import "TransitionAnimationRipple.h"

@interface TransitionAnimationRipple()<CAAnimationDelegate>

@property (nonatomic, strong)id<UIViewControllerContextTransitioning> transitionContext;

@end

@implementation TransitionAnimationRipple

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    self.transitionContext = transitionContext;
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:fromVC.view];
    [containerView addSubview:toVC.view];
    
    CATransition *transition = [CATransition animation];
    
    /*
     kCATransitionFade 交叉淡化过渡
     kCATransitionMoveIn 新视图移到旧视图上面
     kCATransitionPush 新视图把旧视图推出去
     kCATransitionReveal 将旧视图移开,显示下面的新视图
     
     pageCurl 向上翻一页
     pageUnCurl 向下翻一页
     rippleEffect 滴水效果
     suckEffect 收缩效果，如一块布被抽走
     cube 立方体效果
     oglFlip 上下翻转效果
     */
    
    transition.type = @"rippleEffect";
    //    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromRight;
    transition.delegate = self;
    transition.duration = [self transitionDuration:transitionContext];
    [containerView.layer addAnimation:transition forKey:nil];
}

//- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
//    
//    return 0.75;
//}

#pragma mark -- CAAnimationDelegate --
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    // transition 完成后
    [self.transitionContext completeTransition:YES];
    
    UIViewController *fromVC = [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    fromVC.view.hidden = NO;
}

@end




