//
//  MLBaseViewModel.m
//  Medicine
//
//  Created by Visoport on 10/1/17.
//  Copyright © 2017年 Visoport. All rights reserved.
//

#import "MLBaseViewModel.h"



@implementation MLBaseViewModel

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    
    MLBaseViewModel *viewModel = [super allocWithZone:zone];
    
    if (viewModel) {
        
        [viewModel ml_initialize];
    }
    return viewModel;
}

- (instancetype)initWithModel:(id)model {
    
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)ml_initialize {}

@end
