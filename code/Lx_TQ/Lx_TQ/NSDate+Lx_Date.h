//
//  NSDate+Lx_Date.h
//  Lx_TQ
//
//  Created by Clover on 13-11-30.
//  Copyright (c) 2013年 Clover. All rights reserved.
//

#import <Foundation/Foundation.h>
#define Lx_DateFormat @"yyyy-MM-dd HH:mm:ss"
#define Lx_TimeFormat @"yyyy-MM-dd HH:mm:ss"

@interface NSDate (Lx_Date)
/*
 NSDate *date = [self getDateWithDateString:@"2012-12-21 15:14:35"
 formatString:@"yyyy-MM-dd HH:mm:ss"];
 */
+(NSDate *)getDateWithDateString:(NSString *)strDate formatString:(NSString*)strFormat;
-(NSString*)getChineseCalendarWithDate;
-(NSArray*)ZodiacArray;
-(NSArray*)YearArray;
-(NSArray*)MonthArray;
-(NSArray*)DayArray;

-(NSString*)getChineseZodiacWithDate;
-(NSString*)getChineseYearWithDate;
-(NSString*)getChineseMonthWithDate;
-(NSString*)getChineseDayWithDate;
@end
