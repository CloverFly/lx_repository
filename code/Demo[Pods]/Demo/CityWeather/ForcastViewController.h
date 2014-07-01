//
//  ForcastViewController.h
//  CityWeatherModel
//
//  Created by Clover on 14-5-30.
//  Copyright (c) 2014年 ---李万仁---. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForcastViewController : UIViewController
{
    NSArray*m_userCityArray;
}

@property(nonatomic,strong)IBOutlet UIScrollView*m_ScrollView;
@property(nonatomic,strong)IBOutlet UIPageControl*m_pageControl;


@end
