//
//  MLShoppingBottomViewModel.h
//  Medicine
//
//  Created by Visoport on 7/2/17.
//  Copyright © 2017年 Visoport. All rights reserved.
//

#import "MLBaseViewModel.h"

@interface MLShoppingBottomViewModel : MLBaseViewModel

@property (nonatomic, strong) RACSubject *checkAllClickSubject;
@property (nonatomic, strong) RACSubject *clearingClickSubject;

@end
