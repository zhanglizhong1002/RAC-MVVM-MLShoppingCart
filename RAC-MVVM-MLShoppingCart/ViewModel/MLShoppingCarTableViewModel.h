//
//  MLShoppingCarTableViewModel.h
//  Medicine
//
//  Created by Visoport on 20/1/17.
//  Copyright © 2017年 Visoport. All rights reserved.
//

#import "MLBaseViewModel.h"
#import "MLShoppingCarHeaderViewModel.h"


@interface MLShoppingCarTableViewModel : MLBaseViewModel

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) RACSubject *cellClickSubject;//点击cell相应
@property (nonatomic, strong) RACSubject *refreshEndSubject;// 加载完刷新试图
@property (nonatomic, strong) RACCommand *refreshDataCommand;//上啦
@property (nonatomic, strong) RACSubject *bottomClearingClickSubject;

@property (nonatomic, strong) MLShoppingCarHeaderViewModel *headerViewModel;
@property (nonatomic, strong) RACSubject *hiddenTabbar;

@end
