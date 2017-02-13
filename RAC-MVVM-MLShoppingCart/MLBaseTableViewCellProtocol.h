//
//  MLBaseTableViewCellProtocol.h
//  Medicine
//
//  Created by Visoport on 12/1/17.
//  Copyright © 2017年 Visoport. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MLBaseTableViewCellProtocol <NSObject>
@optional

- (void)ml_setupViews;
- (void)ml_bindViewModel;

@end
