//
//  MLHerbsChoseView.h
//  Medicine
//
//  Created by Visoport on 8/2/17.
//  Copyright © 2017年 Visoport. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLHerbsChoseView : UIView

@property (nonatomic, strong) RACSubject *dismissClickSubject;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@end
