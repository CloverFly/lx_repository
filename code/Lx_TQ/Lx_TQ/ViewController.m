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
#import "SearchCoreManager.h"

@interface ViewController ()


@property(nonatomic,strong)IBOutlet UILabel*m_CityName;
@property(nonatomic,strong)IBOutlet UILabel*m_SK_PM;


@end

@implementation ViewController

@synthesize m_CityName ,m_SK_PM;

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.searchDisplayController.searchResultsTableView.backgroundColor=[UIColor colorWithRed:89/255.0 green:116/255.0 blue:152/255.0 alpha:1.0];
    self.searchDisplayController.searchResultsTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.searchDisplayController.searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
	self.searchDisplayController.searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
	self.searchDisplayController.searchBar.keyboardType = UIKeyboardTypeDefault;
	self.searchDisplayController.searchBar.backgroundColor=[UIColor clearColor];
	self.searchDisplayController.searchBar.translucent=YES;
	self.searchDisplayController.searchBar.placeholder=@"输入城市名/简拼检索城市";
	self.searchDisplayController.searchBar.delegate = self;
	self.searchDisplayController.searchBar.barStyle=UIBarStyleDefault;
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
             NSLog(@"%@:%@",key,[tempDic objectForKey:key]);
         }
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
    cell.backgroundColor = [UIColor colorWithRed:89/255.0 green:116/255.0 blue:152/255.0 alpha:1.0];
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

}
#pragma mark -
#pragma mark UISearchDisplayController Delegate Methods

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    self.searchDisplayController.searchResultsTableView.backgroundColor=[UIColor colorWithRed:89/255.0 green:116/255.0 blue:152/255.0 alpha:1.0];
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
