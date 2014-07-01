//
//  AddCityViewController.h
//  CityWeatherModel
//
//  Created by Clover on 14-5-30.
//  Copyright (c) 2014年 ---李万仁---. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddCityViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate>
{
    IBOutlet UITableView*m_tableView;
    NSMutableDictionary*m_targetDic;
}
@end

