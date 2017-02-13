//
//  ViewController.m
//  RAC-MVVM-MLShoppingCart
//
//  Created by Visoport on 13/2/17.
//  Copyright © 2017年 Visoport. All rights reserved.
//

#import "ViewController.h"
#import "MLShoppingCartViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation ViewController


#pragma mark - Demo
/* 
 这个demo是根据当前项目中抽出来的  由于项目使用的是MVVM
 所以拿出来跟大伙一起分享   如果有什么需要改进的   或者说有更好的意见   欢迎密我
 qq: 1031974317
*/


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"RAC-MVVM-MLShoppingCart";
    
    [self.view addSubview:self.button];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
    }];
}

- (void)pushShoppingCartAction{
    MLShoppingCartViewController *vc = [[MLShoppingCartViewController alloc] init];
    vc.title = @"MLShoppingCart";
    [self.navigationController pushViewController:vc animated:YES];
}

- (UIButton *)button {
    if (!_button) {
        _button = [[UIButton alloc] init];
        _button.backgroundColor = [UIColor orangeColor];
        
        [_button setTitle:@"点击进入购物车" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(pushShoppingCartAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}


@end
