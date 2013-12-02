//
//  AppDelegate.h
//  Foodspotting
//
//  Created by jetson  on 12-8-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DDMenuController;
@class ViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>{

	UINavigationController *navigationController;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) DDMenuController *menuController;
@property (strong, nonatomic) ViewController *viewController;

@end
