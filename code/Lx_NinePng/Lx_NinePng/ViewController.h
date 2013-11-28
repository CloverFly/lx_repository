//
//  ViewController.h
//  Lx_NinePng
//
//  Created by Clover on 13-11-26.
//  Copyright (c) 2013年 Clover. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TUNinePatch.h"

@class NPNinePatchDemoView;


@interface ViewController : UIViewController

@property(nonatomic, retain) IBOutlet NPNinePatchDemoView *m_NinePatchView;
@property(nonatomic, retain) IBOutlet UIImageView *m_ImageView;

@end
