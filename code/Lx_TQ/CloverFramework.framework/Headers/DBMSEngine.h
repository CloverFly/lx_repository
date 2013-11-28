/*
 *
 *类名称:DBMSEngine
 *类功能:数据的存储类，对数据库进行了封装
 *      能进行 增－删－改－查
 */


#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import <CoreLocation/CoreLocation.h>
#import "csqxOoj.h"



#define K_CSQX_TABLENAME    @"cs"

#define K_id                @"id"
#define K_name              @"name"
#define K_forcast           @"forcast"
#define K_rain_24           @"rain_24"
#define K_temp_24           @"temp_24"
#define K_humidity_24       @"humidity_24"
#define K_press_24          @"press_24"
#define K_forcast_jxh       @"forcast_jxh"

@class CityWeatherInfo;

@interface DBMSEngine : NSObject 
{
    sqlite3 *database;	//数据库
	NSString *path;		//数据库路径
	BOOL	isDataBaseExit;//数据库是否创建成功

}


/*
    数据库文件存在于沙盒文档目录
    获得数据库文件的路径
*/
-(NSString*)DBPath;

/*
    打开数据库
 */
-(void)openDataBase;

/*
    插入行
    对象方式
 */
-(BOOL)insertCityWeatherInfo_ByBind:(csqxOoj*)acsqxOoj;

/*
    查询指定id行
    返回:对象
    传入:id
 */
-(csqxOoj*)queryCityWeatherInfoByCityId:(NSString*)iId;

/*
    查询指定字段数据
    返回:NSString
    传入:id
 */
-(NSString*)queryInfoColName:(NSString*)iColName byId:(NSString*)aId;

/*
    更新指定字段数据
    传入:id
 */
-(BOOL)UpdateById:(NSString*)aId setColName:(NSString*)aColName setNewContent:(NSString*)aNewContent;

@end
