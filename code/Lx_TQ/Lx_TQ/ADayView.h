//
//  ADayView.h
//  Lx_TQ
//
//  Created by Clover on 13-11-29.
//  Copyright (c) 2013年 Clover. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADayView : UIView
@property(nonatomic,strong)IBOutlet UIView*m_FrocastBackgroundView;
@property(nonatomic,strong)IBOutlet UIView*m_dayBackgroundView;
@property(nonatomic,strong)IBOutlet UIView*m_nightBackgroundView;

@property(nonatomic,strong)IBOutlet UIImageView*m_dayIconImageView;
@property(nonatomic,strong)IBOutlet UIImageView*m_nightIconImageView;

@property(nonatomic,strong)IBOutlet UILabel*m_tempCL;
@property(nonatomic,strong)IBOutlet UILabel*m_tempCH;

@property(nonatomic,strong)IBOutlet UITextView*m_Index;

@property(nonatomic,strong)NSDictionary*m_forcastDic;


-(void)refreshView:(NSDictionary*)aDic;
@end
