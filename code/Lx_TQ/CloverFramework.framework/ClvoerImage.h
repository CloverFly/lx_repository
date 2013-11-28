//
//  ClvoerImage.h
//  CloverFramework
//
//  Created by Clover on 13-8-30.
//  Copyright (c) 2013年 Clover. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ClvoerImage : NSObject


#pragma mark    图像处理
/**
 * 修改上传图片的大小
 * 指定宽
 */
-(UIImage *) imageWithImageSimple:(UIImage*)image scaledToWidth:(int) newWidth;

@end
