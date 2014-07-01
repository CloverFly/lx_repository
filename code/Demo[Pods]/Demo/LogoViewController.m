//
//  LogoViewController.m
//  Demo
//
//  Created by CloverFly on 14-6-12.
//  Copyright (c) 2014年 CloverStudio. All rights reserved.
//

#import "LogoViewController.h"
#import "MainViewController.h"

#import "Lx_BasicLib/ASIHTTPRequest.h"

@interface LogoViewController ()

@end

@implementation LogoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    
    
    
    
    NSLog(@"%@",[JFFileManager mainBundleDirectory]);
    NSLog(@"%@",[JFFileManager cachesDirectory]);
    NSLog(@"%@",[JFFileManager documentsDirectory]);
    NSLog(@"%@",[JFFileManager temporaryDirectory]);
    
    NSLog(@"%@",[JFFileManager userFile]);
    
    
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)enterApp:(id)sender
{
    [self.navigationController pushViewController:[[MainViewController alloc] init] animated:YES];
}

-(IBAction)getData:(id)sender
{
    [SVProgressHUD showProgress:0 status:@"正在下载"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://125.67.61.120:10130//scdzqx/weather/queryWeatherAll?station=10000" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        
        NSLog(@"JSON: %@", responseObject);
        [SVProgressHUD showSuccessWithStatus:@"下载完成"];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
        NSLog(@"Error: %@", error);
         [SVProgressHUD showErrorWithStatus:@"下载失败"];
    }];
}

-(IBAction)postData:(id)sender
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"weather_code": @"0",@"fun": @"0"};
    [manager POST:@"http://125.67.61.120:10130/scdzqx/currenttimebymobile/currentTimeAll" parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        [formData appendPartWithFileURL:filePath name:@"image" error:nil];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}


-(IBAction)downLoadFile:(id)sender
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"http://mirror.esocc.com/apache/tomcat/tomcat-7/v7.0.54/bin/apache-tomcat-7.0.54.zip"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error)
    {
        NSLog(@"File downloaded to: %@", filePath);
    }];
    [downloadTask resume];
}

-(IBAction)ASIProcess:(id)sender
{
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:@"http://mirror.esocc.com/apache/tomcat/tomcat-7/v7.0.54/bin/apache-tomcat-7.0.54.zip"]];
    [request setShowAccurateProgress:YES];
    [request setDownloadProgressDelegate:m_ProgressView];
    
    request.delegate = self;
    [request startAsynchronous];
}
@end
