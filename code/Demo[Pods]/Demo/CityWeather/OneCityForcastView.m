//
//  OneCityForcastView.m
//  CityWeatherModel
//
//  Created by Clover on 14-5-30.
//  Copyright (c) 2014年 ---李万仁---. All rights reserved.
//

#import "OneCityForcastView.h"

@implementation OneCityForcastView

@synthesize m_cityNameLabel;

- (id)init
{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"OneCityForcastView" owner:self options:nil] objectAtIndex:0];
    }
    return self;
}

-(void)refreshView
{
    
}
@end
