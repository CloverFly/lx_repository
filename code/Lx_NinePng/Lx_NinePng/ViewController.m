//
//  ViewController.m
//  Lx_NinePng
//
//  Created by Clover on 13-11-26.
//  Copyright (c) 2013年 Clover. All rights reserved.
//

#import "ViewController.h"
#import "NPNinePatchDemoView.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize m_NinePatchView;
@synthesize m_ImageView;

- (void)viewDidLoad
{
    [super viewDidLoad];

    TUNinePatch*aNinePatch = [TUNinePatch ninePatchNamed:@"g"];
	UIImage*image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.9.png",@"g"]];
	[self.m_NinePatchView updateToNinePatch:aNinePatch
								originalImage:image];
    
    [self.m_NinePatchView setNinePatchSize:self.m_NinePatchView.frame.size];

    self.m_NinePatchView.backgroundColor = [UIColor clearColor];
    
    //{top, left, bottom, right}

    m_ImageView.backgroundColor = [UIColor clearColor];
    
    
    UIImage *image3 = [[UIImage imageNamed:@"aaaa.png"] stretchableImageWithLeftCapWidth:10 topCapHeight:10];

    
    
    m_ImageView.image = image3;
    
    UIColor *circleColorPattern = [UIColor colorWithPatternImage:
                                   [UIImage imageNamed:@"circle.png"]];
    
    self.view.backgroundColor = circleColorPattern;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)updateImageView:(UIImageView *)imageView andLabel:(UILabel *)label forImage:(UIImage *)image {
	if (image) {
		if (imageView) {
			[imageView setImage:image];
		}
		if (label) {
			[label setText:[NSString stringWithFormat:@"<%.1f,%.1f>",[image size].width,[image size].height]];
		}
	} else {
		if (imageView) {
			[imageView setImage:nil];
		}
		if (label) {
			[label setText:@"n/a"];
		}
	}
}

@end
