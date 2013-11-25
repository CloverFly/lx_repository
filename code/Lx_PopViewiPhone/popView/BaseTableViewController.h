//
//  BaseTableViewController.h
//  Lx_PopViewiPhone
//
//  Created by Clover on 13-11-25.
//  Copyright (c) 2013年 Clover. All rights reserved.
//
//  https://github.com/CloverFly/lx_repository/tree/master/code/Lx_PopViewiPhone

#import <UIKit/UIKit.h>
#import "LXPopoverController.h"
@class BaseTableViewController;

@protocol BaseTableViewControllerDelagate <NSObject>

@optional
- (void)baseTableViewController:(BaseTableViewController *)baseTableViewController  didDismissPopover:(LXPopoverController*)lxPopViewController didSelectedIndexPath:(NSIndexPath*)aIndexPath reSelectedDictory:(NSDictionary*)aselectedDictory;

@end


@interface BaseTableViewController : UITableViewController
@property(nonatomic,assign) id<BaseTableViewControllerDelagate> delegate;
@property(nonatomic,assign)LXPopoverController*lx_popViewController;
@property(nonatomic,strong)NSDictionary*m_TableDataDic;
@end


