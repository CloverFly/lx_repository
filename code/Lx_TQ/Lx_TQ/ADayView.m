//
//  ADayView.m
//  Lx_TQ
//
//  Created by Clover on 13-11-29.
//  Copyright (c) 2013年 Clover. All rights reserved.
//

#import "ADayView.h"
#import "UIView+Lx_UIView.h"
@implementation ADayView
@synthesize m_FrocastBackgroundView,m_dayBackgroundView,m_nightBackgroundView;

@synthesize m_tempCL,m_tempCH,m_Index;

@synthesize m_dayIconImageView,m_nightIconImageView;

@synthesize m_forcastDic;


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
-(void)refreshView:(NSDictionary*)aDic
{
    NSLog(@"%@",aDic);
    if (aDic!=nil)
    {
        m_tempCL.text = [NSString stringWithFormat:@"%.0f℃",[[aDic objectForKey:KF_TEMPC(@"CL")] floatValue]];
        m_tempCH.text = [NSString stringWithFormat:@"%.0f℃",[[aDic objectForKey:KF_TEMPC(@"CH")] floatValue]];
        m_Index.text =  [NSString stringWithFormat:@"%@:%@",[aDic objectForKey:KF_INDEX],[aDic objectForKey:KF_INDEXD]];
    }
}

-(void)layoutSubviews
{
    [m_FrocastBackgroundView setLayerRadius:0.0 borderWidth:1.0 borderColor:UICOLOR(31,86,14)];
    [m_dayBackgroundView setLayerRadius:0.0 borderWidth:1.0 borderColor:UICOLOR(31,86,14)];
    [m_nightBackgroundView setLayerRadius:0.0 borderWidth:1.0 borderColor:UICOLOR(31,86,14)];
    [m_dayIconImageView setLayerRadius:0.0 borderWidth:1.0 borderColor:UICOLOR(31,86,14)];
    [m_nightIconImageView setLayerRadius:0.0 borderWidth:1.0 borderColor:UICOLOR(31,86,14)];

    
}
@end
