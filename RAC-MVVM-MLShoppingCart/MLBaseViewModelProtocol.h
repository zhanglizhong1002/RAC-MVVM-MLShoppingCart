//
//  MLBaseViewModelProtocol.h
//  Medicine
//
//  Created by Visoport on 12/1/17.
//  Copyright © 2017年 Visoport. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    MLHeaderRefresh_HasMoreData = 1,
    MLHeaderRefresh_HasNoMoreData,
    MLFooterRefresh_HasMoreData,
    MLFooterRefresh_HasNoMoreData,
    MLRefreshError,
    MLRefreshUI,
} MLRefreshDataStatus;

@protocol MLBaseViewModelProtocol <NSObject>

@optional

- (instancetype)initWithModel:(id)model;
/**
 *  初始化
 */
- (void)ml_initialize;

@end
