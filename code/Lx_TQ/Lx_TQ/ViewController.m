//
//  ViewController.m
//  Lx_TQ
//
//  Created by Clover on 13-11-19.
//  Copyright (c) 2013年 Clover. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "UIResponder+MotionRecognizers.h"


#import "ViewController.h"
#import "CloverFramework/ASIHTTPRequest.h"
#import "CloverFramework/JSON.h"
#import "SearchCoreManager.h"
#import "PaoMaLabel.h"

#import "ADayView.h"
#import "BDayView.h"

#import "UIView+Lx_UIView.h"
#import "NSDate+Lx_Date.h"

const int dayViewTag = 0x100;
@interface ViewController ()


@property(nonatomic,strong)IBOutlet UILabel*m_CityName;
@property(nonatomic,strong)IBOutlet PaoMaLabel*m_SK_PM;

@property(nonatomic,strong)IBOutlet UIView*m_ContentView;
@property(nonatomic,strong)IBOutlet UIView*m_OneDayView;

@end

@implementation ViewController

@synthesize m_CityName ,m_SK_PM;
@synthesize m_ContentView;
@synthesize m_OneDayView;

@synthesize m_ForcastScrollView;


- (void)viewDidLoad
{
    [super viewDidLoad];
    m_ForcastDictionary = [[NSMutableDictionary alloc] init];
    // Step 2 - Register for motion event:
	[self addMotionRecognizerWithAction:@selector(motionWasRecognized:)];

    self.searchDisplayController.searchBar.backgroundColor = UICOLOR(31,86,14);
    self.searchDisplayController.searchResultsTableView.backgroundColor=UICOLOR(31,86,14);
    self.searchDisplayController.searchResultsTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.searchDisplayController.searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
	self.searchDisplayController.searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
	self.searchDisplayController.searchBar.keyboardType = UIKeyboardTypeDefault;
	self.searchDisplayController.searchBar.backgroundColor=[UIColor clearColor];
	self.searchDisplayController.searchBar.translucent=YES;
	self.searchDisplayController.searchBar.placeholder=@"输入城市名/简拼检索城市";
	self.searchDisplayController.searchBar.delegate = self;
	self.searchDisplayController.searchBar.barStyle=UIBarStyleDefault;
    
    self.m_SK_PM = [[PaoMaLabel alloc] initWithFrame:CGRectMake(0, 44, 306, 30)];
    self.m_SK_PM.backgroundColor = UICOLOR(31,86,14);
    self.m_SK_PM.textColor = [UIColor whiteColor];
    self.m_SK_PM.font = [UIFont boldSystemFontOfSize:22];

    self.m_SK_PM.contentMode = UITextAlignmentCenter;
    [self.m_ContentView addSubview:self.m_SK_PM];
    
    //[m_ContentView setLayerRadius:0.0 borderWidth:1.0 borderColor:UICOLOR(31,86,14)];
    
    for (int i = 0; i<6; i++)
    {
        if (i<2)
        {
            ADayView* m_aDayView = [[[NSBundle mainBundle] loadNibNamed:@"ADayView" owner:self options:nil] objectAtIndex:0];
            m_aDayView.tag = dayViewTag+i;
            m_aDayView.frame = CGRectMake(i*306, 0, 306, 356);
            [self.m_ForcastScrollView addSubview:m_aDayView];
        }
        else
        {
            BDayView* m_bDayView = [[[NSBundle mainBundle] loadNibNamed:@"BDayView" owner:self options:nil] objectAtIndex:0];
            m_bDayView.tag = dayViewTag+i;
            m_bDayView.frame = CGRectMake(i*306, 0, 306, 356);
            [self.m_ForcastScrollView addSubview:m_bDayView];
            
        }

    }
    self.m_ForcastScrollView.contentSize = CGSizeMake(self.m_ForcastScrollView.frame.size.width*6, self.m_ForcastScrollView.frame.size.height);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (void) viewDidDisappear:(BOOL)animated {
	// Step 3 - Unregister:
	[self removeMotionRecognizer];
	[super viewDidDisappear:animated];
}

- (void) motionWasRecognized:(NSNotification*)notif
{
    [self update_SKWeatherByCityId:@"101040100"];
    [self update_ForcastWeatherByCityId:@"101040100"];
}


-(IBAction)updaWeather:(UIButton*)sender
{
    [self update_SKWeatherByCityId:@"101040100"];
    [self update_ForcastWeatherByCityId:@"101040100"];
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
         NSDictionary*tempDic = [[[request responseString] JSONValue] objectForKey:@"weatherinfo"];
         for (NSString*key in [tempDic allKeys])
         {
             //NSLog(@"%@:%@",key,[tempDic objectForKey:key]);
         }
         m_CityName.text = [NSString stringWithFormat:@"%@【%@发布】",[tempDic objectForKey:@"city"],[tempDic objectForKey:@"time"]];

         
         m_SK_PM.text = [NSString stringWithFormat:@"【%@%@天气实况】气温,%@℃；湿度，%@；%@，%@，风速，%@m/s",
                         [tempDic objectForKey:@"city"],
                         [tempDic objectForKey:@"time"],
                         [tempDic objectForKey:@"temp"],
                         [tempDic objectForKey:@"SD"],
                         [tempDic objectForKey:@"WD"],
                         [tempDic objectForKey:@"WS"],
                         [tempDic objectForKey:@"WSE"]];

         
     }];
    [request startAsynchronous];
}

-(void)update_ForcastWeatherByCityId:(NSString*)aCityId
{
    NSURL *url = [NSURL URLWithString:API_WEATHER_FORCAST(aCityId)];
    NSLog(@"%@",url);
    __block ASIHTTPRequest*request = [ASIHTTPRequest requestWithURL:url];
    [request setFailedBlock:^{
        NSLog(@"request fail");
    }];
    [request setCompletionBlock:^
     {
         NSDictionary*tempDic = [[[request responseString] JSONValue] objectForKey:@"weatherinfo"];
         for (NSString*key in [tempDic allKeys])
         {
             //NSLog(@"%@:%@",key,[tempDic objectForKey:key]);
         }
         NSDate*dateY = [NSDate getDateWithDateString:[tempDic objectForKey:KF_DATE] formatString:kf]
         for (int i = 1;i<=6;i++)
         {
             NSString*indexSingle = [NSString stringWithFormat:@"%d",i];
             NSString*index = [NSString stringWithFormat:@"%d",2*(i-1)+1];
             NSString*index_2x = [NSString stringWithFormat:@"%d",2*(i-1)+2];
             NSMutableDictionary*oneDayDic = [[NSMutableDictionary alloc] init];
             
             [oneDayDic setObject:[] forKey:<#(id<NSCopying>)#>]
             [oneDayDic setObject:[tempDic objectForKey:KF_FL(indexSingle)] forKey:KF_FL(@"")];
             [oneDayDic setObject:[tempDic objectForKey:KF_WIND(indexSingle)] forKey:KF_WIND(@"")];
             [oneDayDic setObject:[tempDic objectForKey:KF_WEATHER(indexSingle)] forKey:KF_WEATHER(@"")];
             
             
             
             [oneDayDic setObject:[tempDic objectForKey:KF_IMAGE_TITLE(index)] forKey:KF_IMAGE_TITLE(@"_Day")];
             [oneDayDic setObject:[tempDic objectForKey:KF_IMAGE_TITLE(index_2x)] forKey:KF_IMAGE_TITLE(@"_Night")];
             
             [oneDayDic setObject:[tempDic objectForKey:KF_IMAGE(index)] forKey:KF_IMAGE(@"_Day")];
             [oneDayDic setObject:[tempDic objectForKey:KF_IMAGE(index_2x)] forKey:KF_IMAGE(@"_Night")];
             /*摄氏度*/
             NSMutableString *tempC = [[NSMutableString alloc] initWithString:[tempDic objectForKey:KF_TEMPC(indexSingle)]];
             [tempC replaceOccurrencesOfString:@"℃" withString:@"" options:NSLiteralSearch range:NSMakeRange(0, [tempC length])];
             NSArray*tempCArr = [tempC componentsSeparatedByString:@"~"];
             if ([tempCArr count]==2)
             {
                 [oneDayDic setObject:[tempCArr objectAtIndex:1] forKey:KF_TEMPC(@"CL")];
                 [oneDayDic setObject:[tempCArr objectAtIndex:0] forKey:KF_TEMPC(@"CH")];
             }
             /*华氏度*/
             NSMutableString *tempF = [[NSMutableString alloc] initWithString:[tempDic objectForKey:KF_TEMPF(indexSingle)]];
             [tempF replaceOccurrencesOfString:@"℉" withString:@"" options:NSLiteralSearch range:NSMakeRange(0, [tempF length])];
             NSArray*tempFArr = [tempF componentsSeparatedByString:@"~"];
             if ([tempFArr count]==2)
             {
                 [oneDayDic setObject:[tempFArr objectAtIndex:1] forKey:KF_TEMPF(@"L")];
                 [oneDayDic setObject:[tempFArr objectAtIndex:0] forKey:KF_TEMPF(@"H")];
             }
             if (i==1)
             {
                 [oneDayDic setObject:[tempDic objectForKey:KF_INDEX] forKey:KF_INDEX];
                 [oneDayDic setObject:[tempDic objectForKey:KF_INDEXD] forKey:KF_INDEXD];
             }
             else if (i==2)
             {
                 [oneDayDic setObject:[tempDic objectForKey:KF_INDEX48] forKey:KF_INDEX];
                 [oneDayDic setObject:[tempDic objectForKey:KF_INDEX48D] forKey:KF_INDEXD];
             }
             
             [m_ForcastDictionary setObject:oneDayDic forKey:[NSString stringWithFormat:KF_FORCAST_DAY(i)]];
         }
         
         
         ADayView*day1View = (ADayView*)[m_ForcastScrollView viewWithTag:dayViewTag+0];
         [day1View refreshView:[m_ForcastDictionary objectForKey:KF_FORCAST_DAY(1)]];

         ADayView*day2View = (ADayView*)[m_ForcastScrollView viewWithTag:dayViewTag+1];
         [day2View refreshView:[m_ForcastDictionary objectForKey:KF_FORCAST_DAY(2)]];

         
     }];
    [request startAsynchronous];
}


#pragma mark -
#pragma mark Table View Data Source Methods
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return [[self.m_SelectedCityDic allKeys] count];
//}
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    NSString *key = [[self.m_SelectedCityDic allKeys] objectAtIndex:section];
//    return key;
//}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //GroupedTableIdentifier
    static NSString *GroupedTableIdentifier = @"TableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             GroupedTableIdentifier];
    if (YES) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:GroupedTableIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = UICOLOR(31,86,14);
    //设置内容
    UILabel *item = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 8.0, 300, 25)];
    item.tag = 0x11;
    item.backgroundColor=[UIColor clearColor];
    item.textColor = [UIColor whiteColor];
    item.textAlignment = UITextAlignmentLeft;
    item.font=[UIFont boldSystemFontOfSize:20];
    [cell addSubview:item];

    item.text = @"ss";

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    
    NSLog(@"==%@",m_ForcastDictionary);

}
#pragma mark -
#pragma mark UISearchDisplayController Delegate Methods

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    
//    self.searchDisplayController.searchResultsTableView.backgroundColor=UICOLOR(31,86,14);
    self.searchDisplayController.searchResultsTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self SearchDataBySearchChar:searchString setButtonindex:self.searchDisplayController.searchBar.selectedScopeButtonIndex];
    return YES;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    NSString*aSearchChar=self.searchDisplayController.searchBar.text;
     
    [self SearchDataBySearchChar:aSearchChar setButtonindex:searchOption];
    return YES;
}

-(void)SearchDataBySearchChar:(NSString*)aSearchChar setButtonindex:(NSInteger)aButtonIndex
{

}
@end
