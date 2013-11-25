//
//  BaseTableViewController.m
//  Lx_PopViewiPhone
//
//  Created by Clover on 13-11-25.
//  Copyright (c) 2013年 Clover. All rights reserved.
//
//  https://github.com/CloverFly/lx_repository/tree/master/code/Lx_PopViewiPhone

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Popover Title";
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"cell %d",indexPath.row];
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

@end
