//
//  MLShoppingCarTableViewModel.m
//  Medicine
//
//  Created by Visoport on 20/1/17.
//  Copyright © 2017年 Visoport. All rights reserved.
//

#import "MLShoppingCarTableViewModel.h"
#import "MLShoppingCarModel.h"

@implementation MLShoppingCarTableViewModel


- (void)ml_initialize
{
    
    // 对网络请求的数据进行处理
    @weakify(self);
    [self.refreshDataCommand.executionSignals.switchToLatest subscribeNext:^(NSArray *array) {
        
        @strongify(self);
        
        
        NSMutableArray *alArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < 2; i++) {
            MLShoppingCarModel *model = [[MLShoppingCarModel alloc] init];
            model.goodId = [NSString stringWithFormat:@"%ld",(long)i];
            model.cartItemId = [NSString stringWithFormat:@"%ld",(long)i];
            model.goodName = [NSString stringWithFormat:@"商品名称%ld",(long)i+1];
            model.quantity = [NSString stringWithFormat:@"%ld",(long)i+1];
            model.standard = [NSString stringWithFormat:@"%ld",(long)i+60];
            model.goodPrice = [NSString stringWithFormat:@"%ld",(long)i+80];
            model.isEdit = NO;
            model.btnSelected = NO;
            model.sectionSelect = NO;//
            model.sectionEdit = NO;
            [alArray addObject:model];
        }
        
        NSMutableArray *arr2 = [[NSMutableArray alloc] init];
        for (int i = 0; i < 3; i++) {
            MLShoppingCarModel *model = [[MLShoppingCarModel alloc] init];
            model.goodId = [NSString stringWithFormat:@"%ld",(long)i];
            model.cartItemId = [NSString stringWithFormat:@"%ld",(long)i];
            model.goodName = [NSString stringWithFormat:@"商品名称%ld",(long)i+1];
            model.quantity = [NSString stringWithFormat:@"%ld",(long)i+1];
            model.standard = [NSString stringWithFormat:@"%ld",(long)i+160];
            model.goodPrice = [NSString stringWithFormat:@"%ld",(long)i+180];
            model.isEdit = NO;
            model.btnSelected = NO;
            model.sectionSelect = NO;//
            model.sectionEdit = NO;
            [arr2 addObject:model];
        }
        [self.dataArray addObject:alArray];
        [self.dataArray addObject:arr2];
        
//        self.dataArray = alArray;
        //        self.dataArray = (NSMutableArray *)array;
        //        [self.listHeaderViewModel.refreshUISubject sendNext:nil];
        [self.refreshEndSubject sendNext:nil];
        
//        [MLCommonTool dismissHUD];
    }];
    
    
    [[[self.refreshDataCommand.executing skip:1] take:1] subscribeNext:^(id x) {
        
        if ([x isEqualToNumber:@(YES)]) {
//            [MLCommonTool showWithStatus:@"正在加载"];
        }
    }];
    
}

// 初始化上拉刷新
- (RACCommand *)refreshDataCommand {
    
    if (!_refreshDataCommand) {
        
        //        @weakify(self);
        _refreshDataCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            
            //            @strongify(self);
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                
                //                @strongify(self);
                //                self.currentPage = 1;
                //                [MLHttpTool postText:@(self.currentPage) success:^(id responseObject) {
                //
                //                    [subscriber sendNext:responseObject];
                //                    [subscriber sendCompleted];
                //                } failure:^(id errorResult) {
                //                    [MLCommonTool showErrorWithStatus:@"网络连接失败"];
                //                    [self.refreshEndSubject sendNext:@(MLRefreshError)];
                //                    [subscriber sendCompleted];
                //                }];
                
                [subscriber sendNext:@""];
                [subscriber sendCompleted];
                return nil;
            }];
        }];
    }
    
    return _refreshDataCommand;
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    
    return _dataArray;
}

- (RACSubject *)cellClickSubject {
    
    if (!_cellClickSubject) {
        
        _cellClickSubject = [RACSubject subject];
    }
    
    return _cellClickSubject;
}

- (RACSubject *)bottomClearingClickSubject {
    if (!_bottomClearingClickSubject) {
        _bottomClearingClickSubject = [RACSubject subject];
    }
    return _bottomClearingClickSubject;
}

// 加载完成刷新试图
- (RACSubject *)refreshEndSubject {
    
    if (!_refreshEndSubject) {
        
        _refreshEndSubject = [RACSubject subject];
    }
    return _refreshEndSubject;
}

- (MLShoppingCarHeaderViewModel *)headerViewModel
{
    if (!_headerViewModel) {
        _headerViewModel = [[MLShoppingCarHeaderViewModel alloc] init];
    }
    return _headerViewModel;
}

- (RACSubject *)hiddenTabbar
{
    if (!_hiddenTabbar) {
        _hiddenTabbar = [RACSubject subject];
    }
    return _hiddenTabbar;
}


@end
