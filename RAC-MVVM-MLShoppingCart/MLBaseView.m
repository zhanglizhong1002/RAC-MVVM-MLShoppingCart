//
//  MLBaseView.m
//  Medicine
//
//  Created by Visoport on 10/1/17.
//  Copyright © 2017年 Visoport. All rights reserved.
//

#import "MLBaseView.h"
#import "AppDelegate.h"


@implementation MLBaseView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self ml_setupViews];
        [self ml_bindViewModel];
    }
    return self;
}

- (instancetype)initWithViewModel:(id <MLBaseViewModelProtocol>)viewModel {
    
    self = [super init];
    if (self) {
        
        [self ml_setupViews];
        [self ml_bindViewModel];
    }
    return self;
}

- (void)ml_bindViewModel {
}

- (void)ml_setupViews {
}

- (void)ml_addReturnKeyBoard {
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [tap.rac_gestureSignal subscribeNext:^(id x) {
        
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [appDelegate.window endEditing:YES];
    }];
    [self addGestureRecognizer:tap];
}

@end
