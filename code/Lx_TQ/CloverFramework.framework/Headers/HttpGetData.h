//
//  HttpGetData.h
//  CloverFramework
//
//  Created by Clover on 13-8-30.
//  Copyright (c) 2013年 Clover. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"

@protocol HttpGetDataDelegate;


@interface HttpGetData : NSObject
{
    ASIHTTPRequest*m_httpRequest;
}
@property(nonatomic,assign) id delegate;
- (id)initWithUseInfo:(NSDictionary*)aUseInfo;
-(void)getHttpRequestWithUseInfo:(NSDictionary*)aUseInfo;
-(void)closeConnect;

@end


@protocol HttpGetDataDelegate <NSObject>

@required
-(void)requestInfo:(HttpGetData *)httpRequest reUserInfo:(NSDictionary*)aUserInfo reMsgData:(NSData*)aData;
@optional

@end