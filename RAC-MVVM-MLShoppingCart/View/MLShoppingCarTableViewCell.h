//
//  MLShoppingCarTableViewCell.h
//  Medicine
//
//  Created by Visoport on 20/1/17.
//  Copyright © 2017年 Visoport. All rights reserved.
//

#import "MLBaseTableViewCell.h"
#import "MLShoppingCarTableViewCellViewModel.h"

@interface MLShoppingCarTableViewCell : MLBaseTableViewCell <UITextFieldDelegate>

//@property (nonatomic, strong) UILabel *editNumLabel;
@property (nonatomic, strong) MLShoppingCarTableViewCellViewModel *viewModel;

@property (nonatomic, strong) UITextField *editNumTextField;
@property (nonatomic, strong) UIView *bottomLineView;


@end
