//
//  M_tableAlert.h
//  M_tableAlert
//
//  Created by lesogoMacMini on 13-9-25.
//  Copyright (c) 2013年 lesogoMacMini. All rights reserved.
//


#import <UIKit/UIKit.h>

@class M_TableAlert;

@protocol M_TableAlertDelegate <NSObject>
@optional

- (CGFloat)tableAlert:(M_TableAlert *)tableAlert heightForRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)tableAlert:(M_TableAlert *)tableAlert didSelectRowAtIndexPath:(NSIndexPath *)indexPath;


@end

@protocol M_TableAlertDataSource <NSObject>
@required

- (UITableViewCell *)tableAlert:(M_TableAlert *)tableAlert cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)tableAlert:(M_TableAlert *)tableAlert numberOfRowsInSection:(NSInteger)section;

@optional

- (NSInteger)numberOfSectionsInTableAlert:(M_TableAlert *)tableAlert; // default 1
- (NSString *)tableAlert:(M_TableAlert *)tableAlert titleForHeaderInSection:(NSInteger)section;

@end


@interface M_TableAlert : UIView
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)   UIWindow        *alertWindow;
@property (nonatomic, strong)   UIWindow        *previousKeyWindow;
@property (strong, nonatomic)   UIView          *m_titleView;
@property (strong, nonatomic)   UILabel         *m_title;
@property (nonatomic, strong)   UITableView     *tableView;
@property (nonatomic, strong)   UIView          *m_view;
@property (nonatomic, strong)   UIButton        *button;
@property (nonatomic, assign)   UIInterfaceOrientation oldDeviceOrientation;

@property (nonatomic, assign) id <M_TableAlertDelegate> delegate;
@property (nonatomic, assign) id <M_TableAlertDataSource> dataSource;

@property (nonatomic, assign) id <UITableViewDelegate> tableViewDelegate; // default self, (set other for more advanded use)
@property (nonatomic, assign) id <UITableViewDataSource> tableViewDataSource; // default self, (set other for more advanded use)
@property (nonatomic, assign) id <UIAlertViewDelegate> alertViewDelegate; // default self, (set other for more advanded use)
@property (nonatomic) CGFloat   rowHeight;     // default 44
@property (nonatomic) int       maxRow;        //default 5

- (void)show;
- (void)title:(NSString *)aTitle;
- (void)removeView;

@end
