//
//  MLShoppingCarHeaderViewModel.m
//  Medicine
//
//  Created by Visoport on 20/1/17.
//  Copyright © 2017年 Visoport. All rights reserved.
//

#import "MLShoppingCarHeaderViewModel.h"
#import "MLShoppingHeaderModel.h"


@implementation MLShoppingCarHeaderViewModel

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < 2; i++) {
            MLShoppingHeaderModel *model = [[MLShoppingHeaderModel alloc] init];
            model.title = [NSString stringWithFormat:@"中医药专用店---%d", i];
            model.sectionSelect = NO;
            model.sectionEdit = NO;
            [_dataArray addObject:model];
        }
    }
    
    return _dataArray;
}

- (RACSubject *)selectClickSubject
{
    if (!_selectClickSubject) {
        _selectClickSubject = [RACSubject subject];
    }
    return _selectClickSubject;
}

- (RACSubject *)titleClickSubject
{
    if (!_titleClickSubject) {
        _titleClickSubject = [RACSubject subject];
    }
    return _titleClickSubject;
}

- (RACSubject *)editClickSubject
{
    if (!_editClickSubject) {
        _editClickSubject = [RACSubject subject];
    }
    return _editClickSubject;
}

@end
