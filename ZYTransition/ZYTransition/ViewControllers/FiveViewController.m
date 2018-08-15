
//
//  FiveViewController.m
//  ZYTransition
//
//  Created by zhouyang on 2018/8/14.
//  Copyright © 2018年 zhouyang. All rights reserved.
//

#import "FiveViewController.h"

@interface FiveViewController ()

@property (strong, nonatomic) UIImageView *imgView;

@end

@implementation FiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.imgView];
}

-(UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"4"]];
        _imgView.frame = self.view.bounds;
    }
    return _imgView;
}

@end
