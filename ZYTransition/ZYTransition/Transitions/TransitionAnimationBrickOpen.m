//
//  TransitionAnimationBrickOpen.m
//  ZYTransition
//
//  Created by zhouyang on 2018/8/15.
//  Copyright © 2018年 zhouyang. All rights reserved.
//

#import "TransitionAnimationBrickOpen.h"

@interface TransitionAnimationBrickOpen()<CAAnimationDelegate>

@end

@implementation TransitionAnimationBrickOpen

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containView = [transitionContext containerView];
    
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    CGRect rect0 ;
    CGRect rect1;
    
    rect0 = CGRectMake(0 , 0 , screenWidth/2, screenHeight);
    rect1 = CGRectMake(screenWidth/2 , 0 , screenWidth/2, screenHeight);
    
    // 截图，截rect范围内
    UIImage *image0 = [self imageFromView:fromVC.view atFrame:rect0];
    UIImage *image1 = [self imageFromView:fromVC.view atFrame:rect1];
    
    UIImageView *imgView0 = [[UIImageView alloc] initWithImage:image0];
    UIImageView *imgView1 = [[UIImageView alloc] initWithImage:image1];
    
    [containView addSubview:fromVC.view];
    [containView addSubview:toVC.view];
    [containView addSubview:imgView0];
    [containView addSubview:imgView1];
    
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        // 分别左、右移动
        imgView0.layer.transform = CATransform3DMakeTranslation(-screenWidth/2, 0, 0);
        imgView1.layer.transform = CATransform3DMakeTranslation(screenWidth/2, 0, 0);
    } completion:^(BOOL finished) {
        
        if ([transitionContext transitionWasCancelled]) {
            
            [transitionContext completeTransition:NO];
            [imgView0 removeFromSuperview];
            [imgView1 removeFromSuperview];
            
        }else{
            [transitionContext completeTransition:YES];
            [imgView0 removeFromSuperview];
            [imgView1 removeFromSuperview];
        }
    }];
}

//-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
//    
//    return 0.75;
//}

/// 截图
- (UIImage *)imageFromView:(UIView *)view atFrame:(CGRect)rect{
    
    UIGraphicsBeginImageContext(view.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    UIRectClip(rect);
    [view.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return  theImage;
}

@end


