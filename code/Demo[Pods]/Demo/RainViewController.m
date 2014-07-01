//
//  RainViewController.m
//  Demo
//
//  Created by CloverFly on 14-6-12.
//  Copyright (c) 2014年 CloverStudio. All rights reserved.
//

#import "RainViewController.h"

@interface RainViewController ()

@end

@implementation RainViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)backClicked:(UIButton*)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
