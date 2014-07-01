//
//  GetLocation.h
//  TestTimer
//  自动定位
//  Created by 四叶草 on 13-7-4.
//  Copyright (c) 2013年 Clover@lwr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol GetLocationDelegate;

@interface GetLocation : NSObject
<CLLocationManagerDelegate>
{
    CLLocationManager	*locationManager; //获取用户经纬度
    BOOL isSuccess;
}
@property(nonatomic,assign) id<GetLocationDelegate> delegate;

- (void)startUpdateLocation;
- (void)closeUpdateLocation;
- (id)initWithDelegate:(id<GetLocationDelegate>)aDelegate;
@end 

@protocol GetLocationDelegate <NSObject>

-(void)getLocation:(GetLocation *)aGetLocation reCityInfo:(LSCityModel*)aCityModel;
-(void)getNoLocation;

@end