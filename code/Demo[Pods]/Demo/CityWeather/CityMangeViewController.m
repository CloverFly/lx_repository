//
//  CityMangeViewController.m
//  CityWeatherModel
//
//  Created by Clover on 14-5-30.
//  Copyright (c) 2014年 ---李万仁---. All rights reserved.
//

#import "CityMangeViewController.h"
#import "AddCityViewController.h"
#import "CityManageTableViewCell.h"
@interface CityMangeViewController ()
{
   
}

@end

@implementation CityMangeViewController
-(IBAction)backClicked:(UIButton*)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
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
    m_editing = YES;
    self.title = @"城市管理";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self
                                              action:@selector(addAction:)] ;
    // Do any additional setup after loading the view from its nib.
}
-(IBAction)addCity:(UIButton*)sender
{
    NSLog(@"%@",@"增加");
    [self.navigationController pushViewController:[[AddCityViewController alloc] init] animated:YES];
}

-(IBAction)editCity:(UIButton*)sender
{
    if (m_editing)
    {
        m_editing = NO;
	}
    else
    {
        m_editing = YES;
	}
    NSLog(@"%@",@"编辑");
    [m_tableView setEditing:m_editing animated:YES];
}
-(void)addAction:(UIButton*)sender
{
    if (m_editing)
    {
        m_editing = NO;
	}
    else
    {
        m_editing = YES;
	}
    [self.navigationController pushViewController:[[AddCityViewController alloc] init] animated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    LKDBHelper* globalHelper = [LKDBHelper getUsingLKDBHelper];
    m_userCityArray =  [globalHelper search:[LsWeatherForcastModel class] where:nil orderBy:nil offset:0 count:15];
    [m_tableView reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (m_userCityArray)
    {
        return [m_userCityArray count];
    }
    return 0;
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *GroupedTableIdentifier = @"CityManageTableViewCell";
    CityManageTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:GroupedTableIdentifier owner:self options:nil] objectAtIndex:0];

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    LsWeatherForcastModel*model = [m_userCityArray objectAtIndex:[indexPath row]];
    cell.m_cityNameLabel.text = model.city_name;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

// 设置删除按钮标题
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}
//点击删除后
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 从数据源中删除
    LKDBHelper* globalHelper = [LKDBHelper getUsingLKDBHelper];
    LsWeatherForcastModel*model = [m_userCityArray objectAtIndex:[indexPath row]];
    [globalHelper deleteToDB:model];
    // 从列表中删除
    m_userCityArray =  [globalHelper search:[LsWeatherForcastModel class] where:nil orderBy:nil offset:0 count:15];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    [m_tableView reloadData];

}


@end
