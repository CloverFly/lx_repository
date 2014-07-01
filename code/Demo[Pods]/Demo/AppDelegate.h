//
//  AppDelegate.h
//  Demo
//
//  Created by CloverFly on 14-6-12.
//  Copyright (c) 2014年 CloverStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LogoViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>


@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) LogoViewController* viewController;
@property(strong, nonatomic) UINavigationController*    navigationController;

-(UINavigationController*)getTopNavController;

@end
