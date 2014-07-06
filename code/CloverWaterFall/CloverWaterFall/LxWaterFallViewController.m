//
//  LxWaterFallViewController.m
//  CloverWaterFall
//
//  Created by Clover on 14-7-5.
//  Copyright (c) 2014年 Clover. All rights reserved.
//

#import "LxWaterFallViewController.h"
#import "LxWaterFallCell.h"
@interface LxWaterFallViewController ()

@end

@implementation LxWaterFallViewController

@synthesize m_CollectionView;

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
    [self.m_CollectionView registerClass:[LxWaterFallCell class] forCellWithReuseIdentifier:@"LxWaterFallCell"];
    self.title = @"瀑布流";
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(2, 5, 2, 5);
}
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(150, 100);
}
//每个section的item个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 44;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    LxWaterFallCell *cell = (LxWaterFallCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"LxWaterFallCell" forIndexPath:indexPath];
    
    //图片名称
    NSString *imageToLoad = [NSString stringWithFormat:@"%04d.jpg", indexPath.row];
    NSLog(@"%@",imageToLoad);
    //加载图片
    cell.m_cellImageView.image = [UIImage imageNamed:imageToLoad];
    //设置label文字
    cell.m_Label.text = [NSString stringWithFormat:@"{%ld,%ld}",(long)indexPath.row,(long)indexPath.section];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
