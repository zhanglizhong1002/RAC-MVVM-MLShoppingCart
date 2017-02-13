//
//  MLShoppingBottomView.h
//  Medicine
//
//  Created by Visoport on 7/2/17.
//  Copyright © 2017年 Visoport. All rights reserved.
//

#import "MLBaseView.h"
#import "MLShoppingBottomViewModel.h"

@interface MLShoppingBottomView : MLBaseView

@property (nonatomic, strong) MLShoppingBottomViewModel *viewModel;
@property (nonatomic, strong) UIButton *checkAllButton;
@property (nonatomic, strong) UIButton *clearingButton;
@property (nonatomic, strong) UILabel *moneyLabel;

@end
