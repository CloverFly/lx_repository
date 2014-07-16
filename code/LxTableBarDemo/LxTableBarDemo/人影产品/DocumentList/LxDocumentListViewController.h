//
//  LxDocumentListViewController.h
//  LxTableBarDemo
//
//  Created by CloverFly on 14-7-16.
//  Copyright (c) 2014年 CloverStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LxDocumentListViewController : UIViewController
<UIPickerViewDataSource,UIPickerViewDelegate>


@property(nonatomic,strong)NSDictionary*m_infoDic;

@property(nonatomic,strong)IBOutlet UILabel*m_titleLabel;
@property(nonatomic,strong)IBOutlet UIView*m_popPickerView;
@property(nonatomic,strong)IBOutlet UIPickerView*m_selectedItemPicker;



@end
