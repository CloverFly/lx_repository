//
//  ViewController.m
//  Lx_Category
//
//  Created by Clover on 13-11-27.
//  Copyright (c) 2013年 Clover. All rights reserved.
//

#import "ViewController.h"
#import "NSString+LxString.h"
#import "UIImage+Lx_Image.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize testImageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString*tempStr = @"My name is bill.";
    NSLog(@"%@",[tempStr camelCaseString]);
    
    
//	testImageView.image = [[UIImage getImageFromColor:[UIColor redColor]] resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1)];
    //{top, left, bottom, right}
    UIImage*aImage = [[UIImage getImageFromColor:[UIColor redColor]] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
    
    
    
    
    NSLog(@"%.0f=%.0f",aImage.size.width,aImage.size.height);
    testImageView.image =aImage;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_testFiled release];
    [super dealloc];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"%@",[[textField text] dataUsingEncoding:NSUTF8StringEncoding]);
    NSLog(@"%@",[[textField text] dataUsingEncoding:NSUTF16StringEncoding]);
    NSLog(@"%@",[[textField text] hexToBytes]);

    NSData *testData = [[textField text] dataUsingEncoding: NSUTF8StringEncoding];
    
    Byte *testByte = (Byte *)[testData bytes];
    for(int i=0;i<[testData length];i++)
        printf("testByte = %d\n",testByte[i]);
    
    
    return YES;
}
@end
