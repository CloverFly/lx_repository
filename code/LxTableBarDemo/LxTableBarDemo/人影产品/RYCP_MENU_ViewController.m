//
//  RYCP_MENU_ViewController.m
//  DZQXiPhoneIn
//
//  Created by CloverFly on 14-6-25.
//  Copyright (c) 2014年 CloverStudio. All rights reserved.
//

#import "RYCP_MENU_ViewController.h"
#import "LxDocumentListViewController.h"

@interface RYCP_MENU_ViewController ()

@end

@implementation RYCP_MENU_ViewController


-(IBAction)MenuBtPressed:(UIButton*)sender
{
    LxDocumentListViewController* object=[[LxDocumentListViewController alloc] init];
    if ([[object class] isSubclassOfClass:[UIViewController class]])
    {
        object.m_infoDic = [NSDictionary dictionaryWithObject:@"区域级" forKey:@"title"];
        [[ShareAppDelegate getTopNavController] pushViewController:object animated:YES];
    }
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

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
