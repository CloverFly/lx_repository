//
//  BDayView.h
//  Lx_TQ
//
//  Created by Clover on 13-11-29.
//  Copyright (c) 2013年 Clover. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BDayView : UIView
@property(nonatomic,strong)IBOutlet UIView*m_FrocastBackgroundView;
@property(nonatomic,strong)IBOutlet UIView*m_dayBackgroundView;
@property(nonatomic,strong)IBOutlet UIView*m_nightBackgroundView;

@property(nonatomic,strong)IBOutlet UIImageView*m_dayIconImageView;
@property(nonatomic,strong)IBOutlet UIImageView*m_nightIconImageView;
@end
