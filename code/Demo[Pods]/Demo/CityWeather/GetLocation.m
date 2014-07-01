//
//  GetLocation.m
//  TestTimer
//  自动定位
//  Created by 四叶草 on 13-7-4.
//  Copyright (c) 2013年 Clover@lwr. All rights reserved.
//

#import "GetLocation.h"
#define ML_COUNTRY @"Country"
#define ML_STATE @"State"
#define ML_CITY @"City"
#define ML_SUBLOCALITY @"SubLocality"
#define ML_NAME @"Name"

@implementation GetLocation

@synthesize delegate;

- (id)initWithDelegate:(id)aDelegate;
{
    self = [super init];
    self.delegate = aDelegate ;
    
    return self;
}

#pragma mark 启动自动定位
- (void)startUpdateLocation
{
    isSuccess = NO;
    locationManager = [[CLLocationManager alloc] init];
    if ([CLLocationManager locationServicesEnabled])
	{
		locationManager.delegate = self;
		locationManager.distanceFilter = 200;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
		[locationManager startUpdatingLocation];
    }
	else
	{
        [delegate getNoLocation];
        //尚未开启定位服务
    }
}
- (void)closeUpdateLocation
{
    [locationManager stopUpdatingLocation];
    locationManager = nil;
}

#pragma mark --
#pragma mark CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation
{
    CLGeocoder * geoCoder = [[CLGeocoder alloc] init];

    [geoCoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error)
     {
         NSDictionary*findDic = nil;
         for (CLPlacemark * placemark in placemarks)
         {
             
             if (findDic)
             {
                 locationManager = nil;
                 return ;
             }
             
             NSMutableString*provinceName = nil;
             NSMutableString*cityName = nil;
             NSMutableString*SubLocality  = nil;
             
             if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
             {
                 // iOS 6 code
                 if ([[placemark addressDictionary] objectForKey:ML_STATE]!=nil)
                 {
                     provinceName = [[NSMutableString alloc] initWithString:[[placemark addressDictionary] objectForKey:ML_STATE]];
                     [provinceName setString: [provinceName stringByReplacingOccurrencesOfString:@"省" withString:@""]];
                     [provinceName setString: [provinceName stringByReplacingOccurrencesOfString:@"市" withString:@""]];
                     [provinceName setString: [provinceName stringByReplacingOccurrencesOfString:@"宁夏回族自治区" withString:@"宁夏"]];
                     [provinceName setString: [provinceName stringByReplacingOccurrencesOfString:@"新疆维吾尔自治区" withString:@"新疆"]];
                     [provinceName setString: [provinceName stringByReplacingOccurrencesOfString:@"内蒙古自治区" withString:@"内蒙古"]];
                     [provinceName setString: [provinceName stringByReplacingOccurrencesOfString:@"广西壮族自治区" withString:@"广西"]];
                 }
                 else
                 {
                     provinceName = [[NSMutableString alloc] initWithString:[[placemark addressDictionary] objectForKey:ML_CITY]];
                     if (provinceName.length>2) {
                         [provinceName setString: [provinceName stringByReplacingOccurrencesOfString:@"市" withString:@""]];
                         [provinceName setString: [provinceName stringByReplacingOccurrencesOfString:@"自治州" withString:@""]];
                     }
                     
                 }
                 if ([[placemark addressDictionary] objectForKey:ML_CITY]!=nil)
                 {
                     cityName = [[NSMutableString alloc] initWithString:[[placemark addressDictionary] objectForKey:ML_CITY]];
                 }
                 else
                 {
                     cityName = [[NSMutableString alloc] initWithString:[[placemark addressDictionary] objectForKey:ML_STATE]];
                 }
                 if (cityName.length>2) {
                     [cityName setString: [cityName stringByReplacingOccurrencesOfString:@"市" withString:@""]];
                     [cityName setString:[cityName stringByReplacingOccurrencesOfString:@"自治州" withString:@""]];
                 }
                 
                 if ([[placemark addressDictionary] objectForKey:ML_SUBLOCALITY]!=nil)
                 {
                     SubLocality = [[NSMutableString alloc] initWithString:[[placemark addressDictionary] objectForKey:ML_SUBLOCALITY]];
                     if (SubLocality.length>2) {
                         [SubLocality setString:[SubLocality stringByReplacingOccurrencesOfString:@"区" withString:@""]];
                         [SubLocality setString:[SubLocality stringByReplacingOccurrencesOfString:@"县" withString:@""]];
                         [SubLocality setString:[SubLocality stringByReplacingOccurrencesOfString:@"市" withString:@""]];
                     }
                 }
             }
             else
             {
                 // iOS 4.x 5.x code
                 if ([[placemark addressDictionary] objectForKey:ML_STATE]!=nil)
                 {
                     provinceName = [[NSMutableString alloc] initWithString:[[placemark addressDictionary] objectForKey:ML_STATE]];
                     
                     
                 }
                 else
                 {
                     provinceName = [[NSMutableString alloc] initWithString:[[placemark addressDictionary] objectForKey:ML_CITY]];
                 }
                 if (provinceName.length) {
                     [provinceName setString: [provinceName stringByReplacingOccurrencesOfString:@"省" withString:@""]];
                     [provinceName setString: [provinceName stringByReplacingOccurrencesOfString:@"市" withString:@""]];
                 }
                 
                 [provinceName setString: [provinceName stringByReplacingOccurrencesOfString:@"宁夏回族自治区" withString:@"宁夏"]];
                 [provinceName setString: [provinceName stringByReplacingOccurrencesOfString:@"新疆维吾尔自治区" withString:@"新疆"]];
                 [provinceName setString: [provinceName stringByReplacingOccurrencesOfString:@"内蒙古自治区" withString:@"内蒙古"]];
                 [provinceName setString: [provinceName stringByReplacingOccurrencesOfString:@"广西壮族自治区" withString:@"广西"]];
                 
                 
                 if ([[placemark addressDictionary] objectForKey:ML_CITY]!=nil)
                 {
                     cityName = [[NSMutableString alloc] initWithString:[[placemark addressDictionary] objectForKey:ML_CITY]];
                 }
                 if (cityName.length>2) {
                     [cityName setString: [cityName stringByReplacingOccurrencesOfString:@"市" withString:@""]];
                     [cityName setString: [cityName stringByReplacingOccurrencesOfString:@"自治州" withString:@""]];
                 }
                 
                 
                 
                 if ([[placemark addressDictionary] objectForKey:ML_SUBLOCALITY]!=nil)
                 {
                     SubLocality = [[NSMutableString alloc] initWithString:[[placemark addressDictionary] objectForKey:ML_SUBLOCALITY]];
                     if (SubLocality.length>2) {
                         [SubLocality setString:[SubLocality stringByReplacingOccurrencesOfString:@"区" withString:@""]];
                         [SubLocality setString:[SubLocality stringByReplacingOccurrencesOfString:@"县" withString:@""]];
                         [SubLocality setString:[SubLocality stringByReplacingOccurrencesOfString:@"市" withString:@""]];
                     }
                     
                 }
             }

             NSString*whereStr1 = [NSString stringWithFormat:@"target_name LIKE '%@%@%@' ",@"%",SubLocality,@"%"];
             NSString*whereStr2 = [NSString stringWithFormat:@"city_name LIKE '%@%@%@' ",@"%",cityName,@"%"];
             
             LKDBHelper* globalHelper = [LKDBHelper getUsingLKDBHelper];
             NSArray*arrayTemp =  [globalHelper search:[LSCityModel class] where:whereStr1 orderBy:nil offset:0 count:3000];
             if ([arrayTemp count]==0)
             {
                 arrayTemp =  [globalHelper search:[LSCityModel class] where:whereStr2 orderBy:nil offset:0 count:3000];
             }
             
             if ([arrayTemp count]==0)
             {
                 [delegate getNoLocation];
             }
             else
             {
                 [delegate getLocation:self reCityInfo:[arrayTemp objectAtIndex:0]];
             }
         }
     }];
    
    [self closeUpdateLocation];
}

- (void)locationManager:(CLLocationManager *)manager
	   didFailWithError:(NSError *)error
{
	//(@"获取当前经纬度信息失败");
    [delegate getNoLocation];
    
}

@end
