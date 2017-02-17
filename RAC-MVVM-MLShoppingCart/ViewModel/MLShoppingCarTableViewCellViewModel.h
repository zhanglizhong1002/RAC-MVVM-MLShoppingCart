//
//  MLShoppingCarTableViewCellViewModel.h
//  Medicine
//
//  Created by Visoport on 20/1/17.
//  Copyright © 2017年 Visoport. All rights reserved.
//

#import "MLBaseViewModel.h"
#import "MLShoppingCarModel.h"

@interface MLShoppingCarTableViewCellViewModel : MLBaseViewModel

@property (nonatomic, strong) RACSubject *editsetBtnClickSubject;
@property (nonatomic, strong) RACSubject *selectBtnClickSubject;
@property (nonatomic, strong) RACSubject *deleteBtnClickSubject;
@property (nonatomic, strong) RACSubject *editTextFieldSubject;

@property (nonatomic, copy) NSString *cartItemId;
/*
 * 单价
 */
@property (nonatomic, copy) NSString *goodPrice;
/*
 * 图片
 */
@property (nonatomic, copy) NSString *goodImagePath;
/*
 * 商品ID
 */
@property (nonatomic, copy) NSString *goodId;
/*
 * 商品昵称
 */
@property (nonatomic, copy) NSString *goodName;
/*
 * 数量
 */
@property (nonatomic, copy) NSString *quantity;
/*
 * 规格
 */
@property (nonatomic, copy) NSString *standard;
/*
 * 是否编辑
 */
@property (nonatomic, assign) BOOL isEdit;
/*
 * 是否选择
 */
@property (nonatomic, assign) BOOL btnSelected;

/*
 * 测试组头选中
 */
@property (nonatomic, assign) BOOL sectionSelect;
/*
 * 测试组头编辑
 */
@property (nonatomic, assign) BOOL sectionEdit;
/* 数量
*/
@property (nonatomic, copy) NSString *countNum;
@end
