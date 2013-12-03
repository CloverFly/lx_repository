//
//  RightViewController.m
//  LeftRightSlider
//
//  Created by Zhao Yiqi on 13-11-27.
//  Copyright (c) 2013年 Zhao Yiqi. All rights reserved.
//

#import "RightViewController.h"
#import "AViewController.h"
#import "BViewController.h"
#import "CViewController.h"
#import "DViewController.h"
#import "EViewController.h"
#import "FViewController.h"
@interface RightViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation RightViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {

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
            cell.textLabel.text=@"AViewController";
            break;
        case 1:
            cell.textLabel.text=@"BViewController";
            break;
        case 2:
            cell.textLabel.text=@"CViewController";
            break;
        case 3:
            cell.textLabel.text=@"DViewController";
            break;
        case 4:
            cell.textLabel.text=@"EViewController";
            break;
        case 5:
            cell.textLabel.text=@"FViewController";
            break;
        default:
            break;
    }
    cell.textLabel.textColor =[UIColor whiteColor];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            [[SliderViewController sharedSliderController] showContentControllerWithModel:@"AViewController"];
            break;
        case 1:
            [[SliderViewController sharedSliderController] showContentControllerWithModel:@"BViewController"];
            break;
        case 2:
            [[SliderViewController sharedSliderController] showContentControllerWithModel:@"CViewController"];
            break;
        case 3:
            [[SliderViewController sharedSliderController] showContentControllerWithModel:@"DViewController"];
            break;
        case 4:
            [[SliderViewController sharedSliderController] showContentControllerWithModel:@"EViewController"];
            break;
        case 5:
            [[SliderViewController sharedSliderController] showContentControllerWithModel:@"FViewController"];
            break;
        default:
            break;
    }
}

@end
