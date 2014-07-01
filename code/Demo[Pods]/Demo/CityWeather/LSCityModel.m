//
//  LSCityModel.m
//  TestFMDB
//
//  Created by Clover on 14-5-20.
//  Copyright (c) 2014年 ---李万仁---. All rights reserved.
//

#import "LSCityModel.h"

@implementation LSCityModel

@synthesize target_code;
@synthesize target_name;
@synthesize target_pinyin;
@synthesize target_py;
@synthesize target_lat;
@synthesize target_lng;
@synthesize target_level;
@synthesize city_name;
@synthesize province_name;
@synthesize province_code;
@synthesize province_py;
+(NSString *)getPrimaryKey
{
    return @"target_index";
}
+(NSString *)getTableName
{
    return @"lscity";
}
+(int)getTableVersion
{
    return 20140520;
}
@end
