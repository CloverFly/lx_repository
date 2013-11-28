//
//  ViewController.m
//  Lx_TQ
//
//  Created by Clover on 13-11-19.
//  Copyright (c) 2013年 Clover. All rights reserved.
//

#import "ViewController.h"
#import "CloverFramework/ASIHTTPRequest.h"
#import "CloverFramework/JSON.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


-(IBAction)updaWeather:(UIButton*)sender
{
    [self update_SKWeatherByCityId:@"101010100"];
    [self update_ForcastWeatherByCityId:@"101010100"];
}

-(void)update_SKWeatherByCityId:(NSString*)aCityId
{
    NSURL *url = [NSURL URLWithString:API_WEATHER_REALTIME(aCityId)];
    NSLog(@"%@",url);
    __block ASIHTTPRequest*request = [ASIHTTPRequest requestWithURL:url];
    [request setFailedBlock:^{
        NSLog(@"request fail");
    }];
    [request setCompletionBlock:^
     {
         NSLog(@"%@",[[request responseString] JSONValue]);
         
     }];
    [request startAsynchronous];
}

-(void)update_ForcastWeatherByCityId:(NSString*)aCityId
{
    NSURL *url = [NSURL URLWithString:API_WEATHER_FORCAST(@"101010100")];
    NSLog(@"%@",url);
    __block ASIHTTPRequest*request = [ASIHTTPRequest requestWithURL:url];
    [request setFailedBlock:^{
        NSLog(@"request fail");
    }];
    [request setCompletionBlock:^
     {
         NSLog(@"%@",[[request responseString] JSONValue]);
         
     }];
    [request startAsynchronous];
}
@end
