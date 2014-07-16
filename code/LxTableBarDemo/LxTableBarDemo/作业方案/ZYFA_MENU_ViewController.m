//
//  RYCP_MENU_ViewController.m
//  DZQXiPhoneIn
//
//  Created by CloverFly on 14-6-25.
//  Copyright (c) 2014年 CloverStudio. All rights reserved.
//

#import "ZYFA_MENU_ViewController.h"

@interface ZYFA_MENU_ViewController ()

@end

@implementation ZYFA_MENU_ViewController

-(id)init
{
    NSString * className =NSStringFromClass(self.class);
    self = [super init];
    if (self)
    {
        NSString*nibName = [NSString stringWithFormat:@"%@%@",className,iPhone5?@"_ip5":@""];
        self = [super initWithNibName:nibName bundle:nil];
    }
    return self;
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
