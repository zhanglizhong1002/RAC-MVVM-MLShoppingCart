//
//  MLBaseViewControllerProtocol.h
//  Medicine
//
//  Created by Visoport on 12/1/17.
//  Copyright © 2017年 Visoport. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MLBaseViewModelProtocol;

@protocol MLBaseViewControllerProtocol <NSObject>
@optional

- (instancetype)initWithViewModel:(id <MLBaseViewModelProtocol>)viewModel;

- (void)ml_bindViewModel;
- (void)ml_addSubviews;
- (void)ml_getNewData;
- (void)ml_estimateNetwork;

@end
