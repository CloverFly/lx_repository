//
//  ViewController.m
//  paoma
//
//  Created by xiang_ying on 13-10-28.
//  Copyright (c) 2013年 xiang_ying. All rights reserved.
//

#import "ViewController.h"
#import "PaoMaLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    PaoMaLabel *label = [[PaoMaLabel alloc] initWithFrame:CGRectMake(20, 80, 60, 21)];
    label.text = @"begin :1234oi aSBCJDSCH HEN HAO DE  ACASCDSCDS end!!";

    label.backgroundColor = [UIColor redColor];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:13];

    [self.view addSubview:label];

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
