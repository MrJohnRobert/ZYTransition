//
//  TransitionAnimationExtend.m
//  ZYTransition
//
//  Created by zhouyang on 2018/8/15.
//  Copyright © 2018年 zhouyang. All rights reserved.
//

#import "TransitionAnimationExtend.h"

@interface TransitionAnimationExtend()<CAAnimationDelegate>

@property (nonatomic, strong)id<UIViewControllerContextTransitioning> transitionContext;

@end

@implementation TransitionAnimationExtend

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    
    self.transitionContext = transitionContext;
    
    // 获取源控制器  UITransitionContextFromViewKey
    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    // 获取目标控制器  UITransitionContextToViewKey
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 获得容器视图
    UIView *containView = [transitionContext containerView];
    // 都添加到container, 注意顺序
    [containView addSubview:fromVc.view];
    [containView addSubview:toVc.view];
    
    // 绘制圆形 start、end
    //    CGRect startRect = CGRectMake([UIScreen mainScreen].bounds.size.width / 2, [UIScreen mainScreen].bounds.size.height / 2, 6, 7);
    CGRect startRect = CGRectZero;
    
    UIBezierPath *startPath = [UIBezierPath bezierPathWithOvalInRect:startRect];
    
    UIBezierPath *endPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(startRect, -700, -800)];
    
    //赋值给toVc视图layer的mask
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = endPath.CGPath;
    toVc.view.layer.mask = maskLayer;
    
    CABasicAnimation *maskAnimation =[CABasicAnimation animationWithKeyPath:@"path"];
    maskAnimation.fromValue = (__bridge id)startPath.CGPath;
    maskAnimation.toValue = (__bridge id)endPath.CGPath;
    maskAnimation.duration = [self transitionDuration:transitionContext];
    maskAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    maskAnimation.delegate = self;
    [maskLayer addAnimation:maskAnimation forKey:@"path"];
    
    
}

//- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
//    
//    return 0.75;
//}

#pragma mark -- CAAnimationDelegate --
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    // transition 完成后
    [self.transitionContext completeTransition:YES];
    [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
    [self.transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view.layer.mask = nil;
    
}

@end




