//
//  NSString+LxString.h
//  Lx_Category
//
//  Created by Clover on 13-11-27.
//  Copyright (c) 2013年 Clover. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
@interface NSString (LxString)

/**
 *  调用NSString的内部方法获取驼峰字符串
 *
 *  @return 字符串
 */
-(NSString*) camelCaseString;
-(NSData*) hexToBytes ;
- (NSString *)lowercaseFirstCharacter;
- (NSString *)uppercaseFirstCharacter;
- (BOOL)isEmpty;
- (NSString *)trim;
- (NSString *)trimTheExtraSpaces;
- (NSString *)escapeHTML;
- (NSString *)stringByDecodingXMLEntities;
- (NSString *)md5;
- (NSString *)md5ForUTF16;
- (CGFloat)fontSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;


@end
