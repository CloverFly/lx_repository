//
//  CityMangeViewController.h
//  CityWeatherModel
//
//  Created by Clover on 14-5-30.
//  Copyright (c) 2014年 ---李万仁---. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityMangeViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView*m_tableView;
    NSArray*m_userCityArray;
    BOOL m_editing;
}
@end
