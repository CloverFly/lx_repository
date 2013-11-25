//
//  BaseTableViewController.m
//  Lx_PopViewiPhone
//
//  Created by Clover on 13-11-25.
//  Copyright (c) 2013年 Clover. All rights reserved.
//
//  https://github.com/CloverFly/lx_repository/tree/master/code/Lx_PopViewiPhone

#import "BaseTableViewController.h"

#define K_LX_TADAS @"datas"
#define K_LX_ID @"id"
#define K_LX_TITLE @"title"
#define K_LX_URL @"url"
#define K_LX_SUBTITLE @"subtitle"
#define K_LX_DESCRIBLE @"describle"
#define K_LX_IMAGEURL @"imageurl"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController
@synthesize delegate;
@synthesize lx_popViewController;
@synthesize m_TableDataDic;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Popover Title";
}

/**
 *  setTableData
 *
 *  @param aTableDataDic data
 */
-(void)setTableData:(NSDictionary*)aTableDataDic
{
    m_TableDataDic = aTableDataDic;
    [self.tableView reloadData];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (m_TableDataDic&&[[m_TableDataDic objectForKey:K_LX_TADAS] count]>0)
    {
        return [[m_TableDataDic objectForKey:K_LX_TADAS] count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    NSDictionary*oneDic = [[m_TableDataDic objectForKey:K_LX_TADAS] objectAtIndex:[indexPath row]];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [oneDic objectForKey:K_LX_TITLE];
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary*oneDic = [[m_TableDataDic objectForKey:K_LX_TADAS] objectAtIndex:[indexPath row]];
    if ([self.delegate respondsToSelector:@selector(baseTableViewController:didDismissPopover: didSelectedIndexPath: reSelectedDictory:)])
    {
        [self.delegate baseTableViewController:self didDismissPopover:self.lx_popViewController didSelectedIndexPath:indexPath reSelectedDictory:oneDic];
    }
}

@end
