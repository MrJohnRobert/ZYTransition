//
//  TransitionManager.h
//  ZYTransition
//
//  Created by zhouyang on 2018/8/15.
//  Copyright © 2018年 zhouyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TransitionAnimationType) {
    
    TransitionAnimationTypeExtend,      // 扩大
    TransitionAnimationTypeRipple,      // 水滴
    TransitionAnimationTypeFlipPage,    // 翻页
    TransitionAnimationTypeBrickOpen,   // 两侧分开
    TransitionAnimationTypeSpread,      // 铺展
};

@interface TransitionManager : NSObject

+ (instancetype)sharedManager;

- (id<UIViewControllerAnimatedTransitioning>)transitionAnimationType:(TransitionAnimationType)type;
- (id<UIViewControllerAnimatedTransitioning>)transitionAnimationType:(TransitionAnimationType)type animationDuration:(NSTimeInterval)duration;

@end
