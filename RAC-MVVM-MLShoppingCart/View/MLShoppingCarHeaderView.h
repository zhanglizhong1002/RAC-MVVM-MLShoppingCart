//
//  MLShoppingCarHeaderView.h
//  Medicine
//
//  Created by Visoport on 20/1/17.
//  Copyright © 2017年 Visoport. All rights reserved.
//

#import "MLBaseView.h"
#import "MLShoppingCarHeaderViewModel.h"

@interface MLShoppingCarHeaderView : MLBaseView

@property (nonatomic, strong) MLShoppingCarHeaderViewModel *viewModel;
@property (nonatomic, assign) NSInteger currenSection;

@end
