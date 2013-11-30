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
@synthesize m_Wind,m_DayWeatherContion,m_NightWeatherContion;

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
        m_tempCL.text = [NSString stringWithFormat:@"%.0f℃/%.1f℉",
                         [[aDic objectForKey:KF_TEMPC(@"CL")] floatValue],
                         [[aDic objectForKey:KF_TEMPC(@"FL")] floatValue]];
        m_tempCH.text = [NSString stringWithFormat:@"%.0f℃/%.1f℉",
                         [[aDic objectForKey:KF_TEMPC(@"CH")] floatValue],
                         [[aDic objectForKey:KF_TEMPC(@"FH")] floatValue]];
        m_Index.text =  [NSString stringWithFormat:@"%@:%@",[aDic objectForKey:KF_INDEX],[aDic objectForKey:KF_INDEXD]];
        m_Wind.text  = [NSString stringWithFormat:@"%@,%@",[aDic objectForKey:KF_WIND(@"")],[aDic objectForKey:KF_FL(@"")]];
        
        m_DayWeatherContion.text  = [aDic objectForKey:KF_IMAGE_TITLE(@"_Day")];
        m_NightWeatherContion.text  = [aDic objectForKey:KF_IMAGE_TITLE(@"_Night")];
    }
}

-(void)layoutSubviews
{
    [m_FrocastBackgroundView setLayerRadius:0.0 borderWidth:1.0 borderColor:UICOLOR(31,86,14)];
    [m_dayBackgroundView setLayerRadius:0.0 borderWidth:1.0 borderColor:UICOLOR(31,86,14)];
    [m_nightBackgroundView setLayerRadius:0.0 borderWidth:1.0 borderColor:UICOLOR(31,86,14)];
    [m_Wind setLayerRadius:0.0 borderWidth:1.0 borderColor:UICOLOR(31,86,14)];
//    [m_nightIconImageView setLayerRadius:0.0 borderWidth:1.0 borderColor:UICOLOR(31,86,14)];

    
}
@end
