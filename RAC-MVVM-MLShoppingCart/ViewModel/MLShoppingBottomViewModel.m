//
//  MLShoppingBottomViewModel.m
//  Medicine
//
//  Created by Visoport on 7/2/17.
//  Copyright © 2017年 Visoport. All rights reserved.
//

#import "MLShoppingBottomViewModel.h"

@implementation MLShoppingBottomViewModel

- (RACSubject *)checkAllClickSubject
{
    if (!_checkAllClickSubject) {
        _checkAllClickSubject = [RACSubject subject];
    }
    return _checkAllClickSubject;
}

- (RACSubject *)clearingClickSubject
{
    if (!_clearingClickSubject) {
        _clearingClickSubject = [RACSubject subject];
    }
    return _clearingClickSubject;
}

@end
