//
//  SKJC_ViewController.m
//  Demo
//
//  Created by CloverFly on 14-6-12.
//  Copyright (c) 2014年 CloverStudio. All rights reserved.
//

#import "SKJC_ViewController.h"
#import "RainViewController.h"
#define SKJCITEMS 6
#define SKJCITEMSTAG 0x210
#define ICONSIZE    75

@interface SKJC_ViewController ()

@end

@implementation SKJC_ViewController

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
    
    [self loadTitleView];
    
    float dis = (self.view.bounds.size.width-ICONSIZE*3)/4.0;
    NSArray*titleArray= [NSArray arrayWithObjects:
                         @"温度",
                         @"降水",
                         @"湿度",
                         @"风",
                         @"卫星云图",
                         @"雷达回波",nil];
    for (int i = 0; i<SKJCITEMS; i++)
    {
        UIButton*itemBt = [[UIButton alloc] initWithFrame:CGRectMake(dis*(i%3 +1) +ICONSIZE*(i%3),80+(dis+ICONSIZE+30)*(i/3),ICONSIZE,ICONSIZE)];
        UIColor*color = [Tools randomColor];
        itemBt.backgroundColor = color;
        [itemBt setTitle:[NSString stringWithFormat:@"%d",i] forState:0];
        itemBt.tag = SKJCITEMSTAG+i;
        [itemBt addTarget:self action:@selector(itemOnclicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:itemBt];
        
        UILabel*itemTitle = [[UILabel alloc] initWithFrame:CGRectMake(itemBt.frame.origin.x,itemBt.frame.origin.y + ICONSIZE +5 ,ICONSIZE,20)];
        itemTitle.font = [UIFont systemFontOfSize:14];
        itemTitle.textAlignment = NSTextAlignmentCenter;
        itemTitle.textColor = [UIColor blueColor];
        itemTitle.text = [titleArray objectAtIndex:i];
        [self.view addSubview:itemTitle];
    }
    // Do any additional setup after loading the view.
}

-(void)loadTitleView
{
    UIView*titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
    titleView.backgroundColor = [Tools randomColor];
    UILabel*itemTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, titleView.frame.size.width, titleView.frame.size.height-20)];
    itemTitle.font = [UIFont boldSystemFontOfSize:22];
    itemTitle.textAlignment = NSTextAlignmentCenter;
    itemTitle.textColor = [UIColor blueColor];
    itemTitle.text = @"实况监测";
    [titleView addSubview:itemTitle];
    
    
    [self.view addSubview:titleView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)itemOnclicked:(UIButton*)sender
{
    NSLog(@"%d",sender.tag-SKJCITEMSTAG);
    RainViewController*next=[[RainViewController alloc] init];
    [[LsAppDelegate getTopNavController] pushViewController:next animated:YES];
    
}

@end
