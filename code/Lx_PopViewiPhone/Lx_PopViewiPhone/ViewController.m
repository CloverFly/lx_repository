//
//  ViewController.m
//  Lx_PopViewiPhone
//
//  Created by Clover on 13-11-25.
//  Copyright (c) 2013年 Clover. All rights reserved.
//
//  https://github.com/CloverFly/lx_repository/Lx_PopViewiPhone

#import "ViewController.h"
#import "BaseTableViewController.h"
#import "LXPopoverController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)popover:(id)sender
{
    //the controller we want to present as a popover
    BaseTableViewController *controller = [[BaseTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    LXPopoverController *popover = [[LXPopoverController alloc] initWithViewController:controller];

    //popover.arrowDirection = FPPopoverArrowDirectionAny;
    popover.tint = LXPopoverDefaultTint;
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        popover.contentSize = CGSizeMake(300, 500);
    }
    popover.arrowDirection = LXPopoverArrowDirectionAny;
    
    //sender is the UIButton view
    [popover presentPopoverFromView:sender];
}


- (void)presentedNewPopoverController:(LXPopoverController *)newPopoverController
          shouldDismissVisiblePopover:(LXPopoverController*)visiblePopoverController
{
    [visiblePopoverController dismissPopoverAnimated:YES];
}

-(IBAction)Center:(id)sender
{
    [self popover:sender];
}



@end
