//
//  MLShoppingHeaderModel.h
//  Medicine
//
//  Created by Visoport on 7/2/17.
//  Copyright © 2017年 Visoport. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLShoppingHeaderModel : NSObject

@property (nonatomic, copy) NSString *title;
/*
 * 测试组头选中
 */
@property (nonatomic, assign) BOOL sectionSelect;
@property (nonatomic, assign) BOOL sectionEdit;

@end
