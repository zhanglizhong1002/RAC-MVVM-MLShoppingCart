//
//  MLBaseViewController.h
//  Medicine
//
//  Created by Visoport on 11/1/17.
//  Copyright © 2017年 Visoport. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLBaseViewControllerProtocol.h"


@interface MLBaseViewController : UIViewController <MLBaseViewControllerProtocol>


/**
 * 功能：隐藏显示导航栏
 * 参数：（1）是否隐藏导航栏：isHide
 *      （2）是否有动画过渡：animated
 */
-(void)hideTabBar:(BOOL)isHide
         animated:(BOOL)animated;

@end
