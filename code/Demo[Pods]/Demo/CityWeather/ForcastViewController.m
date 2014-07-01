//
//  ForcastViewController.m
//  CityWeatherModel
//
//  Created by Clover on 14-5-30.
//  Copyright (c) 2014年 ---李万仁---. All rights reserved.
//

#import "ForcastViewController.h"
#import "CityMangeViewController.h"
#import "OneCityForcastView.h"
@interface ForcastViewController ()

@end

@implementation ForcastViewController

@synthesize m_pageControl,m_ScrollView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"全国天气";

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                               initWithTitle:@"城市管理" style:UIBarButtonItemStylePlain target:self
                                               action:@selector(cityManageBtPressed:)] ;

    // Do any additional setup after loading the view from its nib.
}
-(IBAction)cityManageBtPressed:(UIButton*)sender
{
    CityMangeViewController*next=[[CityMangeViewController alloc] init];
    [[LsAppDelegate getTopNavController] pushViewController:next animated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    LKDBHelper* globalHelper = [LKDBHelper getUsingLKDBHelper];
    m_userCityArray =  [globalHelper search:[LsWeatherForcastModel class] where:nil orderBy:nil offset:0 count:15];
    m_pageControl.numberOfPages = [m_userCityArray count];
    [self.m_ScrollView setContentSize:CGSizeMake(m_pageControl.numberOfPages*320, self.m_ScrollView.frame.size.height)];
    for (UIView*tempView in [self.m_ScrollView subviews])
    {
        if ([tempView isKindOfClass:[OneCityForcastView class]])
        {
            [tempView removeFromSuperview];
        }
    }
    NSInteger tempIndex = 0;
    for (LsWeatherForcastModel*model in m_userCityArray)
    {
        OneCityForcastView*oneView = [[OneCityForcastView alloc] init];
        oneView.frame = CGRectMake(320.0*tempIndex, 0, self.m_ScrollView.frame.size.width, self.m_ScrollView.frame.size.height);
        oneView.m_cityNameLabel.text = [NSString stringWithFormat:@"%d:%@",tempIndex,model.city_name];
   
        NSLog(@"%@=%f",model.city_name,320.0*tempIndex);
        [self.m_ScrollView addSubview:oneView];
        tempIndex+=1;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
