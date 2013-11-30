//
//  NSDate+Lx_Date.h
//  Lx_TQ
//
//  Created by Clover on 13-11-30.
//  Copyright (c) 2013年 Clover. All rights reserved.
//

#import <Foundation/Foundation.h>
#define Lx_DateFormat @"yyyy-MM-dd"
#define Lx_DateFormat_CN @"yyyy年MM月dd日"
#define Lx_TimeFormat @"yyyy-MM-dd HH:mm:ss"
typedef enum
{
    EN_MONTHSHORT,      //EX.FEB
    EN_MONTH,           //EX.February
    CN_MONTHSHORT,      //EX.二
    CN_MONTH ,          //EX.二月
    CN_MONTHGONGLI,     //EX.二月
    CN_MONTHNUM         //EX.2
}MONTHTYPE;
typedef enum
{
    EN_WEEKSHORT,       //EX.Fri
    EN_WEEK,            //EX.Friday
    CN_WEEKSHORT,       //EX.五
    CN_WEEK_ZHOU,       //EX.周五
    CN_WEEK ,           //EX.星期五
    CN_WEEKNUM          //EX.星期五
}WEEKTYPE;
@interface NSDate (Lx_Date)
/*
 NSDate *date = [self getDateWithDateString:@"2012-12-21 15:14:35"
 formatString:@"yyyy-MM-dd HH:mm:ss"];
 */
+(NSDate *)getDateWithDateString:(NSString *)strDate formatString:(NSString*)strFormat;
-(NSDate*)addDays:(NSInteger)aDays;



-(NSString*)getChineseCalendarWithDate;
-(NSArray*)ZodiacArray;
-(NSArray*)YearArray;
-(NSArray*)MonthArrayByType:(MONTHTYPE)aMonthType;
-(NSArray*)DayArray;
-(NSArray*)WeekArrayByType:(WEEKTYPE)aWeekType;



-(NSString*)getChineseZodiac;
-(NSString*)getChineseYear;
-(NSString*)getChineseMonthByType:(MONTHTYPE)aMonthType;
-(NSString*)getChineseDay;
-(NSString*)getWeekDayByType:(WEEKTYPE)aWeekType;
@end
