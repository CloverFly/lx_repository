//
//  LxViewController.m
//  LxTableBarDemo
//
//  Created by CloverFly on 14-7-15.
//  Copyright (c) 2014年 CloverStudio. All rights reserved.
//

#import "LxViewController.h"
#import "MainTabBarViewController.h"
@interface LxViewController ()

@end

@implementation LxViewController
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)enterApp:(id)sender
{
    [self.navigationController pushViewController:[[MainTabBarViewController alloc] init] animated:YES];
}
@end
