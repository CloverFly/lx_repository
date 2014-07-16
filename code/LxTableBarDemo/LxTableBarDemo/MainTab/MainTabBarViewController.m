//
//  MainTabBarViewController.m
//  scMobileWeather
//
//  Created by lesogo on 14-2-20.
//  Copyright (c) 2014年 Lesogo. All rights reserved.
//

#import "MainTabBarViewController.h"

#define KMainTabBarDefaultTag   0x100
#define MENUCOUNT 5

@implementation MainTabBarViewController

@synthesize m_selectedIndex;
@synthesize m_currShowView;
@synthesize lxViewControllers;



- (id)init
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
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIColor *) setRandowColor
{
    return [UIColor colorWithRed:235/255.00 green:248/255.00 blue:249/255.00 alpha:1.0];
    return [UIColor colorWithRed:arc4random()%256/255.00 green:arc4random()%256/255.00 blue:arc4random()%256/255.00 alpha:1.0];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray*classNameArray = [NSArray arrayWithObjects:
                              @"SKZL_MENU_ViewController",
                              @"RYCP_MENU_ViewController",
                              @"ZYFA_MENU_ViewController",
                              @"KYSB_MENU_ViewController",
                              @"XTSZ_MENU_ViewController",nil];
    
    m_MenuScrolViw.frame = CGRectMake(0, [[UIScreen mainScreen] bounds].size.height-m_MenuScrolViw.frame.size.height-(ISIOS7?0:20), m_MenuScrolViw.frame.size.width, m_MenuScrolViw.frame.size.height);
    m_selectedIndex = 0;
    m_currShowView  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height)];
    [self.view insertSubview:m_currShowView belowSubview:m_MenuScrolViw];
    
    
    CGSize  buttonsize = CGSizeMake(64,50);//按钮的大小
    

    //按钮
    for (int i=0; i<classNameArray.count; i++)
    {
        NSString*selectedImagePath = [NSString stringWithFormat:@"m0%d.png",i%5+1];
        NSString*unSelectedImagePath = [NSString stringWithFormat:@"m0%dD.png",i%5+1];
        UIButton *buttons = [[UIButton alloc] initWithFrame:CGRectMake(i*buttonsize.width, 0,
                                                                       buttonsize.width, buttonsize.height)];
        buttons.tag = KMainTabBarDefaultTag+i;
        buttons.backgroundColor = [UIColor clearColor];
        [buttons setBackgroundImage:[UIImage imageNamed:selectedImagePath] forState:UIControlStateNormal];
        [buttons setBackgroundImage:[UIImage imageNamed:unSelectedImagePath] forState:UIControlStateHighlighted];
        [buttons setBackgroundImage:[UIImage imageNamed:unSelectedImagePath] forState:UIControlStateSelected];
        [buttons addTarget:nil
                    action:@selector(changeViewControllers:)
          forControlEvents:UIControlEventTouchUpInside];
        [m_MenuScrolViw addSubview:buttons];
        
        if (i == m_selectedIndex)
        {
            [buttons setBackgroundImage:[UIImage imageNamed:@"m01D.png"] forState:UIControlStateNormal];
        }
    }
    m_MenuScrolViw.contentSize = CGSizeMake(buttonsize.width*MENUCOUNT, 50);
    

    
    NSMutableArray *arrays = [[NSMutableArray alloc] init];

    for (int i= 0;i<classNameArray.count ; i++)
    {
        Class tempClass=NSClassFromString(classNameArray[i]);
        id object=[[tempClass alloc] init];
        if ([[object class] isSubclassOfClass:[UIViewController class]])
        {
            UIViewController*viewController=object;
            viewController.view.backgroundColor = [self setRandowColor];
            UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:viewController];
            navigation.navigationBarHidden = YES;
            [arrays addObject:navigation];
            if (i==m_selectedIndex)
            {
                [m_currShowView addSubview:navigation.view];
            }
        }
    }
    self.lxViewControllers = arrays;
    
}

-(void)changeViewControllers:(UIButton*)sender
{
    int nowIndex = sender.tag-KMainTabBarDefaultTag;
    if (self.m_selectedIndex != nowIndex)
	{
        NSString*selectedImagePath = [NSString stringWithFormat:@"m0%dD.png",nowIndex%5+1];
        NSString*unSelectedImagePath = [NSString stringWithFormat:@"m0%d.png",self.m_selectedIndex%5+1];

        //去选中
        UIButton* buttons = (UIButton*)[m_MenuScrolViw viewWithTag:self.m_selectedIndex+KMainTabBarDefaultTag];
        [buttons setBackgroundImage:[UIImage imageNamed:unSelectedImagePath] forState:UIControlStateNormal];
        //高亮
        [sender setBackgroundImage:[UIImage imageNamed:selectedImagePath] forState:UIControlStateNormal];
        
        self.m_selectedIndex = nowIndex;
        
        
        UINavigationController *nav = self.lxViewControllers[self.m_selectedIndex];
        for (UIView *obj in m_currShowView.subviews)
        {
            [obj removeFromSuperview];
        }
        [m_currShowView addSubview:nav.view];
	}
}

@end
