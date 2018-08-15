//
//  ViewController.m
//  ZYTransition
//
//  Created by zhouyang on 2018/8/15.
//  Copyright © 2018年 zhouyang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIImageView *imgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.imgView];
}

-(UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"0"]];
        _imgView.frame = self.view.bounds;
    }
    return _imgView;
}

@end
