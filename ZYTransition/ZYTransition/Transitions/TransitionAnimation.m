//
//  TransitionAnimation.m
//  ZYTransition
//
//  Created by zhouyang on 2018/8/15.
//  Copyright © 2018年 zhouyang. All rights reserved.
//

#import "TransitionAnimation.h"

@implementation TransitionAnimation


- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    
    return self.duration > 0? self.duration : 0.75;
}

@end
