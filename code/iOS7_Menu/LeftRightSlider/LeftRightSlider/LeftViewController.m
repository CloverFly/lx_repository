//
//  LeftViewController.m
//  LeftRightSlider
//
//  Created by Zhao Yiqi on 13-11-27.
//  Copyright (c) 2013年 Zhao Yiqi. All rights reserved.
//

#import "SliderViewController.h"
#import "LAViewController.h"
#import "LBViewController.h"
#import "LCViewController.h"
#import "LDViewController.h"
#import "LEViewController.h"
#import "LFViewController.h"
@interface LeftViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation LeftViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID=@"cellID";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
   
    if(cell==nil){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.backgroundColor=[UIColor clearColor];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    switch(indexPath.row){
        case 0:
            cell.textLabel.text=@"LAViewController";
            break;
        case 1:
            cell.textLabel.text=@"LBViewController";
            break;
        case 2:
            cell.textLabel.text=@"LCViewController";
            break;
        case 3:
            cell.textLabel.text=@"LDViewController";
            break;
        case 4:
            cell.textLabel.text=@"LEViewController";
            break;
        case 5:
            cell.textLabel.text=@"LFViewController";
            break;

        default:
            break;
    }
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor =[UIColor whiteColor];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            [[SliderViewController sharedSliderController] showContentControllerWithModel:@"LAViewController"];
            break;
        case 1:
            [[SliderViewController sharedSliderController] showContentControllerWithModel:@"LBViewController"];
            break;
        case 2:
            [[SliderViewController sharedSliderController] showContentControllerWithModel:@"LCViewController"];
            break;
        case 3:
            [[SliderViewController sharedSliderController] showContentControllerWithModel:@"LDViewController"];
            break;
        case 4:
            [[SliderViewController sharedSliderController] showContentControllerWithModel:@"LEViewController"];
            break;
        case 5:
            [[SliderViewController sharedSliderController] showContentControllerWithModel:@"LFViewController"];
            break;
        default:
            break;
    }
}

@end
