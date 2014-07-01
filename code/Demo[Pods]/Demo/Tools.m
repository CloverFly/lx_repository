//
//  Tools.m
//  Demo
//
//  Created by CloverFly on 14-6-12.
//  Copyright (c) 2014年 CloverStudio. All rights reserved.
//

#import "Tools.h"

@implementation Tools
+(UIColor *)randomColor
{
	static BOOL seeded = NO;
	if (!seeded) {
		seeded = YES;
        (time(NULL));
	}
	CGFloat red = (CGFloat)random() / (CGFloat)RAND_MAX;
	CGFloat green = (CGFloat)random() / (CGFloat)RAND_MAX;
	CGFloat blue = (CGFloat)random() / (CGFloat)RAND_MAX;
	return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}
@end
