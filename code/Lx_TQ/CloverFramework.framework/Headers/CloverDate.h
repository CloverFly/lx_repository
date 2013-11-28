//
//  CloverDate.h
//  CloverFramework
//
//  Created by Clover on 13-8-29.
//  Copyright (c) 2013年 Clover. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 sqlite中存放的NSDate的时候，存放的是一个小数点后 6位的 浮点数字，表示的是 NSTimeInterval（以秒计算）
 
 coredata存储NSDate时，在内部是存储了字参考时间以来的NSTimeInterval（以秒计算），而这个参考时间根据apple dateandtimes doc, NSDate computes time as seconds relative to an absolute reference time: the first instant of January 1, 2001 GMT，其实参考日期是2001.1.1，而非1970年1月1日，因此有些语言在直接读取coredata NSDate属性的sqlite Timestamp字段并转换成日期后，与原来存储的日期不一样了。
 */
@interface CloverDate : NSObject
/**
 该方法可扩展为获取n月之后 或 n月之前的NSDate对象
 获取n年之后 或 n年之前的NSDate对象
 **/
+ (NSDate *) getPriousDateFromDate:(NSDate *)date withDay:(int)day;

/**
 把字符串转换成NSDate
 */
+(NSDate *)NSStringDateToNSDate:(NSString *)string;


/**
 获取 北京时区的时间
 缺省获得的时间是 +000 时区的。和北京时间 相差8个小时。
 可以通过如下代码获得 北京时区的时间
 */
+(NSDate *) localeDateTime;

/**
 把当前的时间 转换成 字符串
 */
+(NSString *) localDateTimeString;

/**
 用指定格式格式化当前时间
 */
+(NSString *) localDateTimeStringWithFormat:(NSString*)dateFormatStr;

@end
