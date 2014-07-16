//
//  LxAppDelegate.h
//  LxTableBarDemo
//
//  Created by CloverFly on 14-7-15.
//  Copyright (c) 2014年 CloverStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LxViewController;

@interface LxAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,strong)UINavigationController*navigationController;
@property (strong, nonatomic) LxViewController *viewController;

-(UINavigationController*)getTopNavController;

@end

 
