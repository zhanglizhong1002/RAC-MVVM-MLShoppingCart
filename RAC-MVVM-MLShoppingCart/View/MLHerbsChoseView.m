//
//  MLHerbsChoseView.m
//  Medicine
//
//  Created by Visoport on 8/2/17.
//  Copyright © 2017年 Visoport. All rights reserved.
//

#import "MLHerbsChoseView.h"

@implementation MLHerbsChoseView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)dismissBgButtonAction:(id)sender {
    
    [self.dismissClickSubject sendNext:nil];
}

- (RACSubject *)dismissClickSubject {
    if (!_dismissClickSubject) {
        _dismissClickSubject = [RACSubject subject];
    }
    return _dismissClickSubject;
}

@end
