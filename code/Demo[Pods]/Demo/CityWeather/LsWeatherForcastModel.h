//
//  LsWeatherForcastModel.h
//  TestFMDB
//
//  Created by Clover on 14-5-20.
//  Copyright (c) 2014年 ---李万仁---. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LsWeatherForcastModel : NSObject
@property(copy,nonatomic) NSString* city_code;
@property(copy,nonatomic) NSString* city_name;
@property(copy,nonatomic) NSString* updateTime;
@property(copy,nonatomic) NSString* forcastContent;
@property(copy,nonatomic) NSString* isLocation;
@end
