//
//  NSDate+Lx_Date.m
//  Lx_TQ
//
//  Created by Clover on 13-11-30.
//  Copyright (c) 2013年 Clover. All rights reserved.
//

#import "NSDate+Lx_Date.h"


@implementation NSDate (Lx_Date)

+(NSDate *)getDateWithDateString:(NSString *)strDate formatString:(NSString*)strFormat
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone =  [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    [formatter setTimeZone:timeZone];
    [formatter setDateFormat : strFormat];
    NSDate *dateTime = [formatter dateFromString:strDate];
    return dateTime;
}
-(NSDate*)addDays:(NSInteger)aDays
{
    NSDate *dateTime = [self dateByAddingTimeInterval:aDays*24*60*60];
    return dateTime;
}
-(NSArray*)ZodiacArray
{
    NSArray *chineseZodiacs = [NSArray arrayWithObjects:
                             @"鼠", @"牛", @"虎", @"兔",@"龙",@"蛇",@"马",@"羊",@"猴",@"鸡",@"狗",@"猪", nil];
    return chineseZodiacs;
}
-(NSArray*)YearArray
{
    NSArray *chineseYears = [NSArray arrayWithObjects:
                             @"甲子", @"乙丑", @"丙寅", @"丁卯",  @"戊辰",  @"己巳",  @"庚午",  @"辛未",  @"壬申",  @"癸酉",
                             @"甲戌",   @"乙亥",  @"丙子",  @"丁丑", @"戊寅",   @"己卯",  @"庚辰",  @"辛己",  @"壬午",  @"癸未",
                             @"甲申",   @"乙酉",  @"丙戌",  @"丁亥",  @"戊子",  @"己丑",  @"庚寅",  @"辛卯",  @"壬辰",  @"癸巳",
                             @"甲午",   @"乙未",  @"丙申",  @"丁酉",  @"戊戌",  @"己亥",  @"庚子",  @"辛丑",  @"壬寅",  @"癸丑",
                             @"甲辰",   @"乙巳",  @"丙午",  @"丁未",  @"戊申",  @"己酉",  @"庚戌",  @"辛亥",  @"壬子",  @"癸丑",
                             @"甲寅",   @"乙卯",  @"丙辰",  @"丁巳",  @"戊午",  @"己未",  @"庚申",  @"辛酉",  @"壬戌",  @"癸亥", nil];
    return chineseYears;
}
-(NSArray*)MonthArrayByType:(MONTHTYPE)aMonthType
{
    NSArray *chineseMonths=nil;
    switch (aMonthType)
    {
        case EN_MONTHSHORT:
            chineseMonths = [NSArray arrayWithObjects:
                             @"Jan", @"Feb", @"Mar", @"Apr", @"May", @"June", @"July", @"Aug",
                             @"Sep", @"Oct", @"Nov", @"Dec", nil];
            break;
        case EN_MONTH:
            chineseMonths = [NSArray arrayWithObjects:
                             @"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August",
                             @"September", @"October", @"November", @"December", nil];
            break;
        case CN_MONTHSHORT:
            chineseMonths = [NSArray arrayWithObjects:
                             @"正", @"二", @"三", @"四", @"五", @"六", @"七", @"八",
                             @"九", @"十", @"冬", @"腊", nil];
            break;
        case CN_MONTH:
            chineseMonths = [NSArray arrayWithObjects:
                             @"正月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月",
                             @"九月", @"十月", @"冬月", @"腊月", nil];
            break;
        case CN_MONTHGONGLI:
            chineseMonths = [NSArray arrayWithObjects:
                             @"一月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月",
                             @"九月", @"十月", @"十一月", @"十二月", nil];
            break;
        case CN_MONTHNUM:
            chineseMonths = [NSArray arrayWithObjects:
                             @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8",
                             @"9", @"10", @"11", @"12", nil];
            break;
            
            
        default:
            chineseMonths = [NSArray arrayWithObjects:
                             @"正月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月",
                             @"九月", @"十月", @"冬月", @"腊月", nil];
            break;
    }
    return chineseMonths;
}
-(NSArray*)DayArray
{
    NSArray *chineseDays=[NSArray arrayWithObjects:
                          @"初一", @"初二", @"初三", @"初四", @"初五", @"初六", @"初七", @"初八", @"初九", @"初十",
                          @"十一", @"十二", @"十三", @"十四", @"十五", @"十六", @"十七", @"十八", @"十九", @"二十",
                          @"廿一", @"廿二", @"廿三", @"廿四", @"廿五", @"廿六", @"廿七", @"廿八", @"廿九", @"三十",  nil];
    return chineseDays;
}
-(NSArray*)WeekArrayByType:(WEEKTYPE)aWeekType
{
    NSArray *weeks = nil;
    switch (aWeekType)
    {
        case EN_WEEKSHORT:
            weeks=[NSArray arrayWithObjects:
                   @"Sunday", @"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday",  nil];
            break;
        case EN_WEEK:
            weeks=[NSArray arrayWithObjects:
                   @"Sun", @"Mon", @"Tues", @"Wed", @"Thur", @"Fri", @"Sat",  nil];
            break;
        case CN_WEEKSHORT:
            weeks=[NSArray arrayWithObjects:
                   @"日",@"一", @"二", @"三", @"四", @"五", @"六", nil];
            break;
        case CN_WEEK_ZHOU:
            weeks=[NSArray arrayWithObjects:
                   @"周日",@"周一", @"周二", @"周三", @"周四", @"周五", @"周六",  nil];
            break;
        case CN_WEEK:
            weeks=[NSArray arrayWithObjects:
                   @"星期日",@"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
            break;
        case CN_WEEKNUM:
            weeks=[NSArray arrayWithObjects:
                   @"1",@"2", @"3", @"4", @"5", @"6", @"7", nil];
            break;
        default:
            weeks=[NSArray arrayWithObjects:
                   @"星期日",@"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
            break;
    }
    return weeks;
}

-(NSString*)getChineseCalendarWithDate
{
    NSCalendar *localeCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSChineseCalendar];
    
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    
    NSDateComponents *localeComp = [localeCalendar components:unitFlags fromDate:self];
    
    NSLog(@"%d_%d_%d  %@",localeComp.year,localeComp.month,localeComp.day, localeComp.date);
    
    NSString *y_str = [[self YearArray] objectAtIndex:localeComp.year-1];
    NSString *m_str = [[self MonthArrayByType:CN_MONTH] objectAtIndex:localeComp.month-1];
    NSString *d_str = [[self DayArray] objectAtIndex:localeComp.day-1];
    
    NSString *chineseCal_str =[NSString stringWithFormat: @"%@_%@_%@",y_str,m_str,d_str];

    return chineseCal_str;  
}
-(NSString*)getChineseZodiac
{
    NSCalendar *localeCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSChineseCalendar];
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSDateComponents *localeComp = [localeCalendar components:unitFlags fromDate:self];
    NSString *zodiac_str = [[self ZodiacArray] objectAtIndex:(localeComp.year-1)%12];
    return zodiac_str;
}
-(NSString*)getChineseYear
{
    NSCalendar *localeCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSChineseCalendar];
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSDateComponents *localeComp = [localeCalendar components:unitFlags fromDate:self];
    NSString *y_str = [[self YearArray] objectAtIndex:localeComp.year-1];
    return y_str;
}
-(NSString*)getChineseMonthByType:(MONTHTYPE)aMonthType
{
    NSCalendar *localeCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSChineseCalendar];
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSDateComponents *localeComp = [localeCalendar components:unitFlags fromDate:self];
    NSString *m_str = [[self MonthArrayByType:aMonthType] objectAtIndex:localeComp.month-1];
    return m_str;
}
-(NSString*)getChineseDay
{
    NSCalendar *localeCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSChineseCalendar];
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSDateComponents *localeComp = [localeCalendar components:unitFlags fromDate:self];
    NSString *d_str = [[self DayArray] objectAtIndex:localeComp.day-1];
    return d_str;
}
-(NSString*)getWeekDayByType:(WEEKTYPE)aWeekType
{
    NSCalendar *localeCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSChineseCalendar];
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit | kCFCalendarUnitWeekday;
    NSDateComponents *localeComp = [localeCalendar components:unitFlags fromDate:self];
    NSString *week_str = [[self WeekArrayByType:aWeekType] objectAtIndex:localeComp.weekday-1];
    return week_str;
}
@end
