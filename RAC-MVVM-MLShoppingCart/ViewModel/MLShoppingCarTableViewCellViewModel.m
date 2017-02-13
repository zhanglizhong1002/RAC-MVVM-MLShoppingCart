//
//  MLShoppingCarTableViewCellViewModel.m
//  Medicine
//
//  Created by Visoport on 20/1/17.
//  Copyright © 2017年 Visoport. All rights reserved.
//

#import "MLShoppingCarTableViewCellViewModel.h"

@implementation MLShoppingCarTableViewCellViewModel

- (instancetype)initWithModel:(MLShoppingCarModel *)model
{
    _goodName = [NSString stringWithFormat:@"%@",model.goodName];
    _goodPrice = [NSString stringWithFormat:@"￥ %.2f", [model.goodPrice floatValue]];
    _standard = [NSString stringWithFormat:@"规格分类: 大包%@g", model.standard];
    //    self.iconImageView.image = [UIImage imageNamed:@"pic_goods_01"];
    _btnSelected = model.btnSelected;
    _isEdit = model.isEdit;
    _countNum = model.quantity;
    _quantity = [NSString stringWithFormat:@"x%@", model.quantity];
    
    return self;
}

- (RACSubject *)selectBtnClickSubject
{
    if (!_selectBtnClickSubject) {
        _selectBtnClickSubject = [RACSubject subject];
    }
    return _selectBtnClickSubject;
}

- (RACSubject *)addBtnClickSubject {
    if (!_addBtnClickSubject) {
        _addBtnClickSubject = [RACSubject subject];
    }
    return _addBtnClickSubject;
}

- (RACSubject *)reduceBtnClickSubject {
    if (!_reduceBtnClickSubject) {
        _reduceBtnClickSubject = [RACSubject subject];
    }
    return _reduceBtnClickSubject;
}

- (RACSubject *)deleteBtnClickSubject {
    if (!_deleteBtnClickSubject) {
        _deleteBtnClickSubject = [RACSubject subject];
    }
    return _deleteBtnClickSubject;
}

- (RACSubject *)editsetBtnClickSubject {
    if (!_editsetBtnClickSubject) {
        _editsetBtnClickSubject = [RACSubject subject];
    }
    return _editsetBtnClickSubject;
}

@end
