//
//  CityManageTableViewCell.m
//  CityWeatherModel
//
//  Created by CloverFly on 14-6-10.
//  Copyright (c) 2014年 ---李万仁---. All rights reserved.
//

#import "CityManageTableViewCell.h"

@implementation CityManageTableViewCell

@synthesize m_cityNameLabel;

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)layoutSubviews
{
    NSLog(@"%f",self.frame.origin.x);
    
}
@end
