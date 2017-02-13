//
//  MLShoppingCarHeaderViewModel.h
//  Medicine
//
//  Created by Visoport on 20/1/17.
//  Copyright © 2017年 Visoport. All rights reserved.
//

#import "MLBaseViewModel.h"

@interface MLShoppingCarHeaderViewModel : MLBaseViewModel

//@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger section;

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) RACSubject *selectClickSubject;
@property (nonatomic, strong) RACSubject *titleClickSubject;
@property (nonatomic, strong) RACSubject *editClickSubject;

@end
