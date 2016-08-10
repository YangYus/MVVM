//
//  UIColor+zhangshujia.h
//  AJIA
//
//  Created by zsj on 15/9/1.
//  Copyright (c) 2015年 p_reganan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (zhangshujia)
+ (UIColor *)colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
@end
