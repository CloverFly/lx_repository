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

-(IBAction)updaWeather:(UIButton*)sender;



@end
