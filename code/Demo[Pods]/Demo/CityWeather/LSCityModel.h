//
//  LSCityModel.h
//  TestFMDB
//
//  Created by Clover on 14-5-20.
//  Copyright (c) 2014年 ---李万仁---. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSCityModel : NSObject

@property(nonatomic) int target_code;
@property(copy,nonatomic) NSString* target_name;
@property(copy,nonatomic) NSString* target_pinyin;
@property(copy,nonatomic) NSString* target_py;
@property(copy,nonatomic) NSString* target_lat;
@property(copy,nonatomic) NSString* target_lng;
@property(nonatomic) int target_level;
@property(copy,nonatomic) NSString*  city_name;
@property(copy,nonatomic) NSString*  province_name;
@property(nonatomic) int province_code;
@property(copy,nonatomic) NSString*  province_py;
@end
