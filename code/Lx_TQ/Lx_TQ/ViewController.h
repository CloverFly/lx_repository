//
//  ViewController.h
//  Lx_TQ
//
//  Created by Clover on 13-11-19.
//  Copyright (c) 2013年 Clover. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource,UISearchDisplayDelegate, UISearchBarDelegate>
{
    __block NSMutableDictionary*m_ForcastDictionary;
}

-(IBAction)updaWeather:(UIButton*)sender;

@property(nonatomic,strong)IBOutlet UIScrollView*m_ForcastScrollView;


@end
