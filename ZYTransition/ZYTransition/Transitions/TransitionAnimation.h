//
//  TransitionAnimation.h
//  ZYTransition
//
//  Created by zhouyang on 2018/8/15.
//  Copyright © 2018年 zhouyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TransitionAnimation : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) NSTimeInterval duration;

@end
