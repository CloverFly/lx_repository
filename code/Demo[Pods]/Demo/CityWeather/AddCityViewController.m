//
//  AddCityViewController.m
//  CityWeatherModel
//
//  Created by Clover on 14-5-30.
//  Copyright (c) 2014年 ---李万仁---. All rights reserved.
//

#import "AddCityViewController.h"

@interface AddCityViewController ()

@end

@implementation AddCityViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"城市添加";
    [self search:@""];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
#pragma mark Table View Data Source Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[m_targetDic allKeys] count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [[m_targetDic allKeys] objectAtIndex:section];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString*provinceName =[[m_targetDic allKeys] objectAtIndex:section];
    return [[m_targetDic objectForKey:provinceName] count];
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *GroupedTableIdentifier = @"GroupedTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             GroupedTableIdentifier];
    if (YES)
    {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:GroupedTableIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
        //设置内容
    UILabel *item = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 0.0, 300,30)];
    item.tag = 0x11;
    item.backgroundColor=[UIColor clearColor];
    item.textColor = [UIColor blackColor];
    item.textAlignment = NSTextAlignmentLeft;
    item.font=[UIFont systemFontOfSize:15];
    [cell addSubview:item];
    
    NSString*provinceName =[[m_targetDic allKeys] objectAtIndex:[indexPath section]];
    LSCityModel*model = [[m_targetDic objectForKey:provinceName] objectAtIndex:[indexPath row]];
 
    item.text = [NSString stringWithFormat:@"   %@",model.target_name];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LKDBHelper* globalHelper = [LKDBHelper getUsingLKDBHelper];
    NSArray*arrayTemp =  [globalHelper search:[LsWeatherForcastModel class] where:nil orderBy:nil offset:0 count:15];
    if ([arrayTemp count]>=9)
    {
        UIAlertView*alt = [[UIAlertView alloc] initWithTitle:@"提示" message:@"关注城市已达上限！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alt show];
        
        return;
    }
    
    NSString*provinceName =[[m_targetDic allKeys] objectAtIndex:[indexPath section]];
    LSCityModel*model = [[m_targetDic objectForKey:provinceName] objectAtIndex:[indexPath row]];

    LsWeatherForcastModel*ForcastModel = [[LsWeatherForcastModel alloc] init];
    ForcastModel.city_code = [NSString stringWithFormat:@"%d",model.target_code];
    ForcastModel.city_name = model.target_name;

    if (![globalHelper isExistsModel:ForcastModel])
    {
        [globalHelper insertToDB:ForcastModel];
        NSLog(@"%@添加成功",model.target_name);
    }
    else
    {
        NSLog(@"%@已经存在",model.target_name);
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    [self search:searchBar.text];
    [m_tableView reloadData];
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self search:searchText];
    [m_tableView reloadData];
}
- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    [searchBar resignFirstResponder];
    [m_tableView reloadData];
}
- (void)search:(NSString *)searchText
{
    if (m_targetDic==nil)
    {
        m_targetDic = [[NSMutableDictionary alloc] init];
    }
    [m_targetDic removeAllObjects];
    NSString*whereStr = [NSString stringWithFormat:@"target_name LIKE '%@%@%@' OR target_pinyin LIKE '%@%@%@' OR target_py LIKE '%@%@%@' OR city_name LIKE '%@%@%@'",
                         @"%",searchText,@"%",
                         @"%",searchText,@"%",
                         @"%",searchText,@"%",
                         @"%",searchText,@"%"];
    if (searchText.length==0)
    {
        whereStr = [NSString stringWithFormat:@"target_level = 1"];
        [m_targetDic setObject:[self queryByWhere:whereStr] forKey:@"省会/直辖市"];
        return;
    }

    for (LSCityModel*cityModel in [self queryByWhere:whereStr])
    {
        if ([m_targetDic objectForKey:cityModel.province_name]==nil)//不存在就创建并且增加
        {
            [m_targetDic setObject:[[NSMutableArray alloc] init] forKey:cityModel.province_name];
        }
        if ([cityModel.target_name isEqualToString:cityModel.city_name])
        {
            [[m_targetDic objectForKey:cityModel.province_name] insertObject:cityModel atIndex:0];
        }
        else
        {
            [[m_targetDic objectForKey:cityModel.province_name] addObject:cityModel];
        }
    }
}
-(NSArray*)queryByWhere:(NSString*)aWhereStr
{
    LKDBHelper* globalHelper = [LKDBHelper getUsingLKDBHelper];
    NSArray*arrayTemp =  [globalHelper search:[LSCityModel class] where:aWhereStr orderBy:nil offset:0 count:3000];
    return arrayTemp;
}
@end
