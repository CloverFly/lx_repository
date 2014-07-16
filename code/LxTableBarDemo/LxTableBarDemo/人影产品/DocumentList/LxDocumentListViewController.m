//
//  LxDocumentListViewController.m
//  LxTableBarDemo
//
//  Created by CloverFly on 14-7-16.
//  Copyright (c) 2014年 CloverStudio. All rights reserved.
//

#import "LxDocumentListViewController.h"

@interface LxDocumentListViewController ()

@end

@implementation LxDocumentListViewController

@synthesize m_infoDic;

@synthesize m_titleLabel;
@synthesize m_popPickerView;
@synthesize m_selectedItemPicker;


/**
 *  返回上一级视图
 *
 *  @param sender 响应按钮
 */
-(IBAction)backBtPressed:(UIButton*)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 *  弹出选择项目选择器
 *
 *  @param sender 响应按钮
 */
-(IBAction)selectedItemBtPressed:(UIButton*)sender
{
    [UIView animateWithDuration:0.5 animations:^(void)
     {
         self.m_popPickerView.frame = CGRectMake(self.m_popPickerView.frame.origin.x, self.view.frame.size.height-self.m_popPickerView.frame.size.height, self.m_popPickerView.frame.size.width, self.m_popPickerView.frame.size.height);
     }completion:^(BOOL finished)
     {
         
     }];
}

/**
 *  隐藏选择项目选择器
 *
 *  @param sender 响应按钮
 */
-(IBAction)hideSelectedItemBtPressed:(UIButton*)sender
{
    [UIView animateWithDuration:0.5 animations:^(void)
     {
         self.m_popPickerView.frame = CGRectMake(self.m_popPickerView.frame.origin.x, self.view.frame.size.height, self.m_popPickerView.frame.size.width, self.m_popPickerView.frame.size.height);
     }completion:^(BOOL finished)
     {
         
     }];
}


-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
-(id)init
{
    NSString * className =NSStringFromClass(self.class);
    self = [super init];
    if (self)
    {
        NSString*nibName = [NSString stringWithFormat:@"%@%@",className,iPhone5?@"_ip5":@""];
        self = [super initWithNibName:nibName bundle:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = RY_BGCOLOR;
    m_titleLabel.text = self.m_infoDic[@"title"];
    if (ISIOS7)
    {
        [m_popPickerView setBackgroundColor:[UIColor colorWithRed:161.0/255.0 green:168.0/255.0 blue:199.0/255.0 alpha:1.0]];
        [m_popPickerView setBackgroundColor:[UIColor lightGrayColor]];
        [m_selectedItemPicker setBackgroundColor:[UIColor lightGrayColor]];
    }
    else
    {
       [m_popPickerView setBackgroundColor:[UIColor lightGrayColor]];
    }
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UIPickerView UIPickerViewDataSource
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (component)
    {
        case 0:
            return 5;
            break;
        case 1:
            return 10;
            break;
        case 2:
            return 15;
            break;
        default:
            break;
    }
    return 0;
}


#pragma mark UIPickerView UIPickerViewDelegate

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40;
}

// these methods return either a plain NSString, a NSAttributedString, or a view (e.g UILabel) to display the row for the component.
// for the view versions, we cache any hidden and thus unused views and pass them back for reuse.
// If you return back a different object, the old one will be released. the view will be centered in the row rect
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (component)
    {
        case 0:
            return [NSString stringWithFormat:@"A_%d",row];
            break;
        case 1:
            return [NSString stringWithFormat:@"B_%d",row];
            break;
        case 2:
            return [NSString stringWithFormat:@"C_%d",row];
            break;
        default:
            break;
    }
    return @"空白";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"%d=%d",row,component);
}
@end
