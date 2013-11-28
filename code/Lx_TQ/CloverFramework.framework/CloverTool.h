//
//  CloverTool.h
//  CloverFramework
//
//  Created by Clover on 13-8-29.
//  Copyright (c) 2013年 Clover. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/**
 高频使用的宏定义
 */
#define RGBS(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
#define KDocFilePath(fileName) [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%@",fileName]]


@interface CloverTool : NSObject

#pragma mark --
#pragma mark    其他
/**
 获取mac地址
 返回:设备mac地址
 */
-(NSString *) getMacAddress;

/**
 获取mac地址
 返回:设备mac地址
 */
-(NSString *) md5ByStr: (NSString *) targetStr ;

#pragma mark    文件管理
/**
 文件操作 保存NSDictionary对象到沙盒documents目录
 传入
    aDictionary:NSDictionary类型对象
    aFileName：文件名【无需添加plist】
 */
-(void)saveDictionaryToFile:(NSDictionary*)aDictionary withFilename:(NSString*)aFileName;

/**
 文件操作 沙盒documents目录读取NSDictionary对象
 传入
     aFileName：文件名【无需添加plist】
 */
-(NSDictionary*)readDictionaryToFile:(NSString*)aFileName;

/**
 文件操作:判断文件是否存在
 传入
    文件名【文件全路径】
 */
-(BOOL)isFileExistAtPath:(NSString*)fileFullPath;

/**
 *创建文件夹
 */
-(void)CreateFolder:(NSString*)aFolderName;

/**
 *删除指定文件
 */
-(void)deleteFile:(NSString*)aFilePath;

/**
 *根据扩展名筛选指定目录下的文件
 */
-(NSArray*)selectFileType:(NSString*)fileType setPath:(NSString*)aFolderPath;

/**
 拷贝文件
 */
+(void)copyFileFrom:(NSString*)srcPath to:(NSString*)aTargetPath useFileName:(NSString*)aFileName;


@end
