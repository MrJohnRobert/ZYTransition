//
//  TransitionAnimationSpread.m
//  ZYTransition
//
//  Created by zhouyang on 2018/8/14.
//  Copyright © 2018年 zhouyang. All rights reserved.
//

#import "TransitionAnimationSpread.h"

@interface TransitionAnimationSpread()<CAAnimationDelegate>

@property (strong, nonatomic) id<UIViewControllerContextTransitioning> transitionContext;

@property (strong, nonatomic) UIView *tempView;

@end

@implementation TransitionAnimationSpread

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    
    self.transitionContext = transitionContext;
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containView = [transitionContext containerView];
    
    [containView addSubview:toVC.view];
    [containView addSubview:fromVC.view];
    
    UIView *tempView = [toVC.view snapshotViewAfterScreenUpdates:YES];
    [containView addSubview:tempView];
    self.tempView = tempView;
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    CGRect rect0 = CGRectMake(screenWidth - 2, 0, 2, screenHeight);
    CGRect rect1 = CGRectMake(0, 0, screenWidth, screenHeight);
    
    UIBezierPath *path0 = [UIBezierPath bezierPathWithRect:rect0];
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRect:rect1];
    
    // 添加layer，作为mask
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = path1.CGPath; //动画结束后的值
    tempView.layer.mask = maskLayer;
    
    // path
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.fromValue = (__bridge id)path0.CGPath;
    animation.toValue = (__bridge id)path1.CGPath;
    animation.delegate = self;
    animation.duration = [self transitionDuration:transitionContext];
    [maskLayer addAnimation:animation forKey:@"path"];
    
}

//- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
//    
//    return self.duration > 0? self.duration : 0.75;
//}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    [self.transitionContext completeTransition:YES];
    [self.tempView removeFromSuperview];
}


@end



