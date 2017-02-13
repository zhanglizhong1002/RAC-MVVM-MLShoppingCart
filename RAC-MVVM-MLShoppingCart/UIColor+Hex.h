//
//  UIColor+Hex.h
//  eTianXia
//
//  Created by PoBo_mac on 16/3/8.
//  Copyright © 2016年 PoBo_mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (extension)

+ (UIColor*) colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
+ (UIColor*) colorWithHex:(NSInteger)hexValue;
+ (NSString *) hexFromUIColor: (UIColor*) color;
+ (UIColor *)colorWithHexCD:(NSString *)hex;

@end
