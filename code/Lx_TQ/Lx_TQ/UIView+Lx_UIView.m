//
//  UIView+Lx_UIView.m
//  Lx_TQ
//
//  Created by Clover on 13-11-29.
//  Copyright (c) 2013年 Clover. All rights reserved.
//

#import "UIView+Lx_UIView.h"

@implementation UIView (Lx_UIView)
-(void)setLayerRadius:(float)radius borderWidth:(float)width borderColor:(UIColor*)color
{
    self.layer.cornerRadius = radius;//设置那个圆角的有多圆
    self.layer.borderWidth = width;//设置边框的宽度，当然可以不要
    self.layer.borderColor = [color CGColor];//设置边框的颜色
    self.layer.masksToBounds = YES;//设为NO去试试
}
@end
