//
//  SecondViewController.m
//  ZYTransition
//
//  Created by zhouyang on 2018/8/6.
//  Copyright © 2018年 zhouyang. All rights reserved.
//

#import "SecondViewController.h"
#import "UIView+anchorPoint.h"

@interface SecondViewController ()<CAAnimationDelegate>

@property (strong, nonatomic) UIImageView *imgView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:self.imgView];
    
}

-(UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1"]];
        _imgView.frame = self.view.bounds;
    }
    return _imgView;
}

@end
