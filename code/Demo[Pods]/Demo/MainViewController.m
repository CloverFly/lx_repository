//
//  MainViewController.m
//  Demo
//
//  Created by CloverFly on 14-6-12.
//  Copyright (c) 2014年 CloverStudio. All rights reserved.
//

#import "MainViewController.h"
#import "SKJC_ViewController.h"
#import "ForcastViewController.h"
#define TABBARNUMS 5
#define MAINTABTAG 0x200

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize m_tabbarView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.tabBar.hidden = YES;
    for (UINavigationController* subNav in self.viewControllers)
    {
        UIViewController* subTab = [subNav.viewControllers objectAtIndex:0];
        if ([subTab isKindOfClass:[UITabBarController class]])
        {
            ((UITabBarController*)subTab).moreNavigationController.navigationBarHidden = YES;
        }
    }
    
    
    
    self.m_tabbarView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height-50, 320, 50)];
    self.m_tabbarView.backgroundColor = [UIColor redColor];
    [self.view addSubview:m_tabbarView];
    NSMutableArray*tabViewControllerArray = [[NSMutableArray alloc] init];
    for (int i = 0; i<TABBARNUMS; i++)
    {
        UIButton*tabBt = [[UIButton alloc] initWithFrame:CGRectMake(i*m_tabbarView.frame.size.width*1.0/TABBARNUMS, 0, m_tabbarView.frame.size.width*1.0/TABBARNUMS, 50)];
        UIColor*color = [Tools randomColor];
        tabBt.backgroundColor = color;
        [tabBt setTitle:[NSString stringWithFormat:@"%d",i] forState:0];
        tabBt.tag = MAINTABTAG+i;
        [tabBt addTarget:self action:@selector(tabOnclicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.m_tabbarView addSubview:tabBt];
        
        switch (i) {
            case 0:
            {
                SKJC_ViewController*viewController = [[SKJC_ViewController alloc] init];
                [tabViewControllerArray addObject:viewController];
            }
                break;
            case 1:
            {
                ForcastViewController*viewController = [[ForcastViewController alloc] init];
                [tabViewControllerArray addObject:viewController];
            }
                break;
            default:
            {
                UIViewController*viewController = [[UIViewController alloc] init];
                viewController.view.backgroundColor =color;
                [tabViewControllerArray addObject:viewController];
            }
                break;
        }
        
    }

   
    UINavigationController*nav0 = [[UINavigationController alloc] initWithRootViewController:[tabViewControllerArray objectAtIndex:0]];
    nav0.navigationBar.hidden = YES;
    
    UINavigationController*nav1 = [[UINavigationController alloc] initWithRootViewController:[tabViewControllerArray objectAtIndex:1]];
    nav1.navigationBar.hidden = YES;
    
    UINavigationController*nav2 = [[UINavigationController alloc] initWithRootViewController:[tabViewControllerArray objectAtIndex:2]];
    nav2.navigationBar.hidden = YES;
    
    UINavigationController*nav3 = [[UINavigationController alloc] initWithRootViewController:[tabViewControllerArray objectAtIndex:3]];
    nav3.navigationBar.hidden = YES;
    
    UINavigationController*nav4 = [[UINavigationController alloc] initWithRootViewController:[tabViewControllerArray objectAtIndex:4]];
    nav4.navigationBar.hidden = YES;
    
    self.viewControllers = [NSArray arrayWithObjects:nav0,nav1,nav2,nav3,nav4, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tabOnclicked:(UIButton*)sender
{
    NSLog(@"%d",sender.tag-MAINTABTAG);
    self.selectedIndex = sender.tag-MAINTABTAG;
}
@end
