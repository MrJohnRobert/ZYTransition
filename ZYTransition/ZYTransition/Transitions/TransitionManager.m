//
//  TransitionManager.m
//  ZYTransition
//
//  Created by zhouyang on 2018/8/15.
//  Copyright © 2018年 zhouyang. All rights reserved.
//

#import "TransitionManager.h"
#import "TransitionAnimation.h"
#import "TransitionAnimationExtend.h"
#import "TransitionAnimationRipple.h"
#import "TransitionAnimationSpread.h"
#import "TransitionAnimationFlipPage.h"
#import "TransitionAnimationBrickOpen.h"

@implementation TransitionManager

+(instancetype)sharedManager {
    static TransitionManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[TransitionManager alloc] init];
    });
    return manager;
}

/// 直接返回animatedTransition
- (id<UIViewControllerAnimatedTransitioning>)transitionAnimationType:(TransitionAnimationType)type {
    
    TransitionAnimation *transition;
    
    switch (type) {
        case TransitionAnimationTypeExtend:
            transition = [[TransitionAnimationExtend alloc] init];
            break;
        case TransitionAnimationTypeFlipPage:
            transition = [[TransitionAnimationFlipPage alloc] init];
            break;
        case TransitionAnimationTypeBrickOpen:
            transition = [[TransitionAnimationBrickOpen alloc] init];
            break;
        case TransitionAnimationTypeRipple:
            transition = [[TransitionAnimationRipple alloc] init];
            break;
        case TransitionAnimationTypeSpread:
            transition = [[TransitionAnimationSpread alloc] init];
            break;
        default:
            transition = [[TransitionAnimation alloc] init];
            break;
    }
    return transition;
}

// 返回animatedTransition，动画时间duration
- (id<UIViewControllerAnimatedTransitioning>)transitionAnimationType:(TransitionAnimationType)type animationDuration:(NSTimeInterval)duration {
    
    TransitionAnimation *transition = [self transitionAnimationType:type];
    transition.duration = duration;
    
    return transition;
}

@end






