//
//  LxWaterFallViewController.h
//  CloverWaterFall
//
//  Created by Clover on 14-7-5.
//  Copyright (c) 2014年 Clover. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LxWaterFallViewController : UIViewController
<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong)IBOutlet UICollectionView*m_CollectionView;

@end
