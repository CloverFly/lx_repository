//
//  UIImage+Lx_Image.m
//  Lx_Category
//
//  Created by Clover on 13-11-28.
//  Copyright (c) 2013年 Clover. All rights reserved.
//

#import "UIImage+Lx_Image.h"

@implementation UIImage (Lx_Image)

+(UIImage*)getImageFromColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 11, 11);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor purpleColor] CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, 5, 11));
    CGContextSetFillColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextFillRect(context, CGRectMake(5, 0, 1, 11));
    CGContextSetFillColorWithColor(context, [[UIColor purpleColor] CGColor]);
    CGContextFillRect(context, CGRectMake(6, 0, 5, 11));
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
@end
