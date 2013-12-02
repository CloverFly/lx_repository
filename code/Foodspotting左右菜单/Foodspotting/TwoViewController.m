//
//  TwoViewController.m
//  Foodspotting
//
//  Created by jetson  on 12-8-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

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
    // Do any additional setup after loading the view from its nib.
	
	list = [[NSMutableArray alloc]init];
    [list addObject:@"aaaa"];
    [list addObject:@"bbbb"];
    [list addObject:@"cccc"];
    [list addObject:@"DDDD"];
    [list addObject:@"eeee"];
    [list addObject:@"ffff"];
    [list addObject:@"gggg"];
    [list addObject:@"hhhh"];
    [list addObject:@"iiii"];
    [list addObject:@"kkkk"];
    [list addObject:@"jjjj"];
    [list addObject:@"llll"];
    [list addObject:@"mmmm"];
    [list addObject:@"nnnn"];
    [list addObject:@"oooo"];
    [list addObject:@"pppp"];
    [list addObject:@"qqqq"];
    [list addObject:@"rrrr"];
	[list addObject:@"ssss"];
	[list addObject:@"tttt"];
	[list addObject:@"wwww"];
	[list addObject:@"xxxx"];
    [list addObject:@"yyyy"];
    [list addObject:@"zzzz"];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
	list = nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}




#define macro ===========tableView============



//选中Cell响应事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    //    //点击完毕，立即恢复颜色
    [tableView deselectRowAtIndexPath:indexPath animated:YES]; 
}

//改变行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
    
}
//返回TableView中有多少数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [list count];
    
}
//返回有多少个TableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//组装每一条的数据
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CustomCellIdentifier =@"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: CustomCellIdentifier];
    if (cell ==nil) {
		cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CustomCellIdentifier]autorelease];
    }
	cell.textLabel.text = [list objectAtIndex:indexPath.row];
    return cell;
    
}


@end
