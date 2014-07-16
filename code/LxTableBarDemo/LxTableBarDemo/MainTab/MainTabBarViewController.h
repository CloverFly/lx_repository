//
//  MainTabBarViewController.h
//  scMobileWeather
//
//  Created by lesogo on 14-2-20.
//  Copyright (c) 2014年 Lesogo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MainTabBarViewController : UIViewController
{
    IBOutlet UIScrollView*m_MenuScrolViw;
}
@property(nonatomic)int m_selectedIndex;
@property (nonatomic,strong) UIView *m_currShowView;
@property (nonatomic,strong) NSArray *lxViewControllers;


@end
