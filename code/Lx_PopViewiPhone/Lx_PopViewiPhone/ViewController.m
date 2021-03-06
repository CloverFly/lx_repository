//
//  ViewController.m
//  Lx_PopViewiPhone
//
//  Created by Clover on 13-11-25.
//  Copyright (c) 2013年 Clover. All rights reserved.
//
//  https://github.com/CloverFly/lx_repository/tree/master/code/Lx_PopViewiPhone

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
    BaseTableViewController *baseController = [[BaseTableViewController alloc] initWithStyle:UITableViewStylePlain];
    baseController.delegate = self;
    
    LXPopoverController *popover = [[LXPopoverController alloc] initWithViewController:baseController];
    baseController.lx_popViewController = popover;
    
    
    NSDictionary*fileDic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"]];
    
    [baseController setTableData:fileDic];
    //popover.arrowDirection = FPPopoverArrowDirectionAny;
    popover.tint = LXPopoverDefaultTint;
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        popover.contentSize = CGSizeMake(300, 500);
    }
    popover.arrowDirection = LXPopoverArrowDirectionAny;
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

-(void)baseTableViewController:(BaseTableViewController *)baseTableViewController didDismissPopover:(LXPopoverController *)lxPopViewController didSelectedIndexPath:(NSIndexPath *)aIndexPath reSelectedDictory:(NSDictionary *)aSelectedDictory
{
    NSLog(@"%d:%@",[aIndexPath row],aSelectedDictory);
    
    if (lxPopViewController!=nil)
    {
        [lxPopViewController dismissPopoverAnimated:YES];
    }
}
@end
