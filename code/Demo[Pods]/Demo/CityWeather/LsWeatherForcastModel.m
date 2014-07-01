//
//  LsWeatherForcastModel.m
//  TestFMDB
//
//  Created by Clover on 14-5-20.
//  Copyright (c) 2014年 ---李万仁---. All rights reserved.
//

#import "LsWeatherForcastModel.h"

@implementation LsWeatherForcastModel

@synthesize city_code;
@synthesize city_name;
@synthesize updateTime;
@synthesize forcastContent;
@synthesize isLocation;


+(NSString *)getPrimaryKey
{
    return @"city_code";
}
+(NSString *)getTableName
{
    return @"forcast";
}
+(int)getTableVersion
{
    return 20140520;
}
@end
