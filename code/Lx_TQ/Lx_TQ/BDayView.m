//
//  BDayView.m
//  Lx_TQ
//
//  Created by Clover on 13-11-29.
//  Copyright (c) 2013年 Clover. All rights reserved.
//

#import "BDayView.h"
#import "UIView+Lx_UIView.h"
@implementation BDayView

@synthesize m_FrocastBackgroundView,m_dayBackgroundView,m_nightBackgroundView;

@synthesize m_dayIconImageView,m_nightIconImageView;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */


-(void)layoutSubviews
{
    [m_FrocastBackgroundView setLayerRadius:0.0 borderWidth:1.0 borderColor:UICOLOR(31,86,14)];
    [m_dayBackgroundView setLayerRadius:0.0 borderWidth:1.0 borderColor:UICOLOR(31,86,14)];
    [m_nightBackgroundView setLayerRadius:0.0 borderWidth:1.0 borderColor:UICOLOR(31,86,14)];
    [m_dayIconImageView setLayerRadius:0.0 borderWidth:1.0 borderColor:UICOLOR(31,86,14)];
    [m_nightIconImageView setLayerRadius:0.0 borderWidth:1.0 borderColor:UICOLOR(31,86,14)];
}

@end
