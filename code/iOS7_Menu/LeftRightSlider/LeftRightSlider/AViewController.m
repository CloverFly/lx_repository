//
//  AViewController.m
//  LeftRightSlider
//
//  Created by Clover on 13-12-3.
//  Copyright (c) 2013年 heroims. All rights reserved.
//

#import "AViewController.h"

@interface AViewController ()

@end

@implementation AViewController

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

-(IBAction)leftItemClick:(UIButton*)sender
{
    [[SliderViewController sharedSliderController] leftItemClick];
}
-(IBAction)rightItemClick:(UIButton*)sender
{
    [[SliderViewController sharedSliderController] rightItemClick];
}
@end
