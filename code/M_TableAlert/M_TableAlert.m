//
//  M_tableAlert.m
//  M_tableAlert
//
//  Created by lesogoMacMini on 13-9-25.
//  Copyright (c) 2013年 lesogoMacMini. All rights reserved.
//

#import "M_TableAlert.h"
#import <QuartzCore/QuartzCore.h>

#define BoolDevice [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone//判断iPhone还是iPad

#define ShowViewWidth (BoolDevice?260:300)//整个弹出框宽
#define ShowViewHeight (60+TableViewHeight)//整个弹出框高

#define TitleViewWidth (BoolDevice?230:270)//标题宽
#define TitleViewHeight 40//标题高

#define TableViewWidth (BoolDevice?230:270)//tableView宽
#define TableViewHeight (maxRow*_rowHeight)//tableview高

#define ShowViewColor [UIColor colorWithRed:255/255 green:255/255 blue:255/255 alpha:1/1]//整个弹出框颜色

#define TitleViewColor [UIColor colorWithRed:255/255 green:122/255 blue:122/255 alpha:1/1]//tableview颜色
#define TableBorderColor [UIColor colorWithRed:0/255 green:220/255 blue:255/255 alpha:1/1]//tableview外框线颜色

#define TitleColor [UIColor colorWithRed:0/255 green:0/255 blue:0/255 alpha:1/1]//标题颜色

#define ViewWidth [[UIScreen mainScreen] bounds].size.width//设备宽
#define ViewHeight [[UIScreen mainScreen] bounds].size.height//设备高


@interface M_TableAlert ()

@end

@implementation M_TableAlert
@synthesize m_titleView;
@synthesize m_title;
@synthesize tableView = _tableView;
@synthesize maxRow;
@synthesize m_view;
@synthesize button;

#pragma mark -

-(void)SwitchBetweenLandscapeAndPortrait//横竖屏切换
{
    if ([[UIApplication sharedApplication] statusBarOrientation] != self.oldDeviceOrientation)
    {
        if ([[UIApplication sharedApplication] statusBarOrientation] == UIDeviceOrientationPortrait)
        {
            [self deviceOrientation_Portrait];
//            [self animate];
        }
        else if ([[UIApplication sharedApplication] statusBarOrientation] == UIDeviceOrientationLandscapeLeft)
        {
            [self deviceOrientation_Left];
//            [self animate];

        }
        else if ([[UIApplication sharedApplication] statusBarOrientation] == UIDeviceOrientationLandscapeRight)
        {
            [self deviceOrientation_Right];
//            [self animate];

        }
        else if ([[UIApplication sharedApplication] statusBarOrientation] == UIDeviceOrientationPortraitUpsideDown)
        {
            [self deviceOrientation_Down];
//            [self animate];
        }

        self.oldDeviceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    }
    
}

-(void)animate
{
    [UIView animateWithDuration:0 animations:^{
        [self setAlpha:0];}completion:^(BOOL finished){
            [UIView animateWithDuration:0.3 animations:^{
                [self setAlpha:1];} completion:^(BOOL finished){
                }];
        }];
}

-(void)deviceOrientation_Portrait
{   
    self.transform = CGAffineTransformIdentity;//还原到初始位置
    self.transform = CGAffineTransformRotate(self.transform, M_PI/180*0);//旋转角度

    self.frame = CGRectMake(0, 0, ViewWidth , ViewHeight);
    self.alertWindow.frame = self.frame;
    self.bounds = CGRectMake(0.0, 0.0, ViewWidth, ViewHeight);
    //转化位置
    [m_view setFrame:CGRectMake((self.frame.size.width-ShowViewWidth)/2,
                                (self.frame.size.height-ShowViewHeight)/2,
                                ShowViewWidth, ShowViewHeight)];
    
    [button setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    m_title.frame = CGRectMake(m_view.frame.size.width/2-TitleViewWidth/2,
                               0,
                               TitleViewWidth, TitleViewHeight);
    [_tableView setFrame:CGRectMake(m_view.frame.size.width/2-TableViewWidth/2,
                                    m_title.frame.origin.y+m_title.frame.size.height,
                                    TableViewWidth, TableViewHeight)];
}


-(void)deviceOrientation_Left
{
    self.transform = CGAffineTransformIdentity;
    self.transform = CGAffineTransformRotate(self.transform, M_PI/180*90);
    
    self.frame = CGRectMake(0, 0, ViewWidth, ViewHeight);
    self.alertWindow.frame = self.frame;
    self.bounds = CGRectMake(0.0, 0.0, ViewHeight, ViewWidth);

    
    [m_view setFrame:CGRectMake((self.frame.size.height-ShowViewWidth)/2,
                                (self.frame.size.width-ShowViewHeight)/2,
                                ShowViewWidth, ShowViewHeight)];
    
    [button setFrame:CGRectMake(0, 0, self.frame.size.height, self.frame.size.width)];
    m_title.frame = CGRectMake(m_view.frame.size.width/2-TitleViewWidth/2,
                               0,
                               TitleViewWidth, TitleViewHeight);
    [_tableView setFrame:CGRectMake(m_view.frame.size.width/2-TableViewWidth/2,
                                    m_title.frame.origin.y+m_title.frame.size.height,
                                    TableViewWidth, TableViewHeight)];
}

-(void)deviceOrientation_Right
{
    self.transform = CGAffineTransformIdentity;
    self.transform = CGAffineTransformRotate(self.transform, -M_PI/180*90);

    self.frame = CGRectMake(0, 0, ViewWidth, ViewHeight);
    self.alertWindow.frame = self.frame;
    
    self.bounds = CGRectMake(0.0, 0.0, ViewHeight, ViewWidth);
    
    [m_view setFrame:CGRectMake((self.frame.size.height-ShowViewWidth)/2,
                                (self.frame.size.width-ShowViewHeight)/2,
                                ShowViewWidth, ShowViewHeight)];
    
    [button setFrame:CGRectMake(0, 0, self.frame.size.height, self.frame.size.width)];
    m_title.frame = CGRectMake(m_view.frame.size.width/2-TitleViewWidth/2,
                               0,
                               TitleViewWidth, TitleViewHeight);
    [_tableView setFrame:CGRectMake(m_view.frame.size.width/2-TableViewWidth/2,
                                    m_title.frame.origin.y+m_title.frame.size.height,
                                    TableViewWidth, TableViewHeight)];

}

-(void)deviceOrientation_Down
{
    self.transform = CGAffineTransformIdentity;
    self.transform = CGAffineTransformRotate(self.transform, M_PI/180*180);

    self.frame = CGRectMake(0, 0, ViewWidth , ViewHeight);
    self.alertWindow.frame = self.frame;
    
    self.bounds = CGRectMake(0.0, 0.0, ViewWidth, ViewHeight);
    
    [m_view setFrame:CGRectMake((self.frame.size.width-ShowViewWidth)/2,
                                (self.frame.size.height-ShowViewHeight)/2,
                                ShowViewWidth, ShowViewHeight)];
    
    [button setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    m_title.frame = CGRectMake(m_view.frame.size.width/2-TitleViewWidth/2,
                               0,
                               TitleViewWidth, TitleViewHeight);
    [_tableView setFrame:CGRectMake(m_view.frame.size.width/2-TableViewWidth/2,
                                    m_title.frame.origin.y+m_title.frame.size.height,
                                    TableViewWidth, TableViewHeight)];
}

-(void)deviceOrientationDidChange:(NSNotification*)notification//通知旋转界面
{
    [self SwitchBetweenLandscapeAndPortrait];
}

-(void)viewLoad//加载界面
{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
	self.alertWindow = [[UIWindow alloc] initWithFrame:screenBounds];
	self.alertWindow.windowLevel = UIWindowLevelAlert;
	self.previousKeyWindow = [[UIApplication sharedApplication] keyWindow];
	[self.alertWindow makeKeyAndVisible];
    self.frame = self.alertWindow.bounds;
    [self.alertWindow addSubview:self];
    //以上进入加载window
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(deviceOrientationDidChange:)
     name:UIDeviceOrientationDidChangeNotification
     object:nil];
    
    if (!maxRow)
    {
        maxRow = 5;
    }
    _rowHeight = BoolDevice?44:60;
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3]];
    [button addTarget:self action:@selector(removeView) forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
    [self addSubview:button];
    
    m_view = [[UIView alloc]initWithFrame:CGRectZero];
    m_view.autoresizesSubviews = YES;
    m_view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    m_view.backgroundColor = ShowViewColor;
    m_view.layer.cornerRadius = 5;
    m_view.layer.masksToBounds = YES;
    
    [m_view setFrame:CGRectMake((self.frame.size.width-ShowViewWidth)/2,
                                (self.frame.size.height-ShowViewHeight)/2,
                                ShowViewWidth, ShowViewHeight)];
    [self addSubview:m_view];
    
    m_title = [[UILabel alloc]initWithFrame:CGRectZero];
    if (!m_title.text.length)
    {
        m_title.text = @"请选择";
    }
    m_title.autoresizesSubviews = YES;
    [m_title setTextAlignment:UITextAlignmentCenter];
    [m_title setTextColor:TitleColor];
    m_title.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [m_title setBackgroundColor:[UIColor clearColor]];
    
    m_title.frame = CGRectMake(m_view.frame.size.width/2-TitleViewWidth/2,
                               0,
                               TitleViewWidth, TitleViewHeight);
    
    [m_view addSubview:m_title];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    [_tableView setDataSource:self];
    [_tableView setDelegate:self];
    _tableView.autoresizesSubviews = YES;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [_tableView setBackgroundColor:[UIColor clearColor]];
    [_tableView setRowHeight:_rowHeight];
    [_tableView setSeparatorColor:[UIColor lightGrayColor]];
    [_tableView.layer setCornerRadius:3];
    _tableView.layer.masksToBounds = YES;
    _tableView.layer.borderWidth = 1;
    _tableView.layer.borderColor = [TableBorderColor CGColor];
    
    [_tableView setFrame:CGRectMake(m_view.frame.size.width/2-TableViewWidth/2,
                                    m_title.frame.origin.y+m_title.frame.size.height,
                                    TableViewWidth, TableViewHeight)];
    
    [m_view addSubview:_tableView];
    
    [self SwitchBetweenLandscapeAndPortrait];
    
   	[_tableView reloadData];
    
    CGAffineTransform newTransform =  CGAffineTransformScale(m_view.transform, 1.1, 1.1);
    [m_view setTransform:newTransform];
    [m_view setAlpha:0];

    [UIView animateWithDuration:0.3 animations:^{
        CGAffineTransform newTransform =  CGAffineTransformScale(m_view.transform, 0.91, 0.91);
        [m_view setTransform:newTransform];
        [m_view setAlpha:1];
    }completion:^(BOOL finished){
        
    }];
    
}

- (void)show//主要进入
{
     [self viewLoad];
    
}


- (void)title:(NSString *)aTitle//设置标题
{
    self.m_title.text = aTitle;
}

- (void)removeView//退出
{
    
    [UIView animateWithDuration:0.3 animations:^{
        CGAffineTransform newTransform =  CGAffineTransformScale(m_view.transform, 0.9, 0.9);
        [m_view setTransform:newTransform];
        [m_view setAlpha:0];
    }completion:^(BOOL finished){
        
        [[NSNotificationCenter defaultCenter] removeObserver:self];
        [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
        
        [self.superview removeFromSuperview];
        [self removeFromSuperview];
        [self.previousKeyWindow makeKeyWindow];
        self.alertWindow = nil;
        self.previousKeyWindow = nil;    
    }];
    
}

#pragma mark - 代理调用
- (id<UITableViewDelegate>)tableViewDelegate
{
	return _tableView.delegate;
}

- (void)setTableViewDelegate:(id<UITableViewDelegate>)tableViewDelegate
{
	[_tableView setDelegate:tableViewDelegate];
}

- (id<UITableViewDataSource>)tableViewDataSource
{
	return _tableView.dataSource;
}

- (void)setTableViewDataSource:(id<UITableViewDataSource>)tableViewDataSource
{
	[_tableView setDataSource:tableViewDataSource];
}


#pragma mark -
#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_delegate respondsToSelector:@selector(tableAlert:heightForRowAtIndexPath:)])
        return [_delegate tableAlert:self heightForRowAtIndexPath:indexPath];
    
    return _rowHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if ([_delegate respondsToSelector:@selector(tableAlert:didSelectRowAtIndexPath:)])
	{
		[_delegate tableAlert:self didSelectRowAtIndexPath:indexPath];
	}
    
    [self removeView];
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	if ([self tableView:tableView viewForHeaderInSection:section])
	{
		return 25;
	}
	return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	if ([_dataSource respondsToSelector:@selector(tableAlert:titleForHeaderInSection:)])
	{
		NSString *title = [_dataSource tableAlert:self titleForHeaderInSection:section];
		if (!title)
		{
			return nil;
		}
		
		return self.m_titleView;
	}
    
	return nil;
}

#pragma mark -
#pragma mark UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return [_dataSource tableAlert:self	cellForRowAtIndexPath:indexPath];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
	return [_dataSource tableAlert:self numberOfRowsInSection:section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	if ([_dataSource respondsToSelector:@selector(numberOfSectionsInTableAlert:)])
		return [_dataSource numberOfSectionsInTableAlert:self];
    
	return 1;
}


@end
