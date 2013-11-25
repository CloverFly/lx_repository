//
//  LXPopoverView.h
//
//  Created by Clover on 13-11-25.
//  Copyright (c) 2013年 Clover. All rights reserved.
//
//  https://github.com/CloverFly/lx_repository/tree/master/code/Lx_PopViewiPhone


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef enum {
    LXPopoverArrowDirectionUp = 1UL << 0,
    LXPopoverArrowDirectionDown = 1UL << 1,
    LXPopoverArrowDirectionLeft = 1UL << 2,
    LXPopoverArrowDirectionRight = 1UL << 3,

    LXPopoverArrowDirectionVertical = LXPopoverArrowDirectionUp | LXPopoverArrowDirectionDown,
    LXPopoverArrowDirectionHorizontal = LXPopoverArrowDirectionLeft | LXPopoverArrowDirectionRight,
    
    LXPopoverArrowDirectionAny = LXPopoverArrowDirectionUp | LXPopoverArrowDirectionDown | 
    LXPopoverArrowDirectionLeft | LXPopoverArrowDirectionRight
    
} LXPopoverArrowDirection;


#define LXPopoverArrowDirectionIsVertical(direction)    ((direction) == LXPopoverArrowDirectionVertical || (direction) == LXPopoverArrowDirectionUp || (direction) == LXPopoverArrowDirectionDown)

#define LXPopoverArrowDirectionIsHorizontal(direction)    ((direction) == LXPopoverArrowDirectionHorizontal || (direction) == LXPopoverArrowDirectionLeft || (direction) == LXPopoverArrowDirectionRight)


typedef enum {
    LXPopoverBlackTint = 1UL << 0, // default
    LXPopoverLightGrayTint = 1UL << 1,
    LXPopoverGreenTint = 1UL << 2,
    LXPopoverRedTint = 1UL << 3,
    LXPopoverDefaultTint = LXPopoverBlackTint
} LXPopoverTint;

@interface LXPopoverView : UIView
{
    //default LXPopoverArrowDirectionUp
    LXPopoverArrowDirection _arrowDirection;
    UIView *_contentView;
    UILabel *_titleLabel;
}
@property(nonatomic,retain) NSString *title;
@property(nonatomic,assign) CGPoint relativeOrigin;
@property(nonatomic,assign) LXPopoverTint tint;

-(void)setArrowDirection:(LXPopoverArrowDirection)arrowDirection;
-(LXPopoverArrowDirection)arrowDirection;

-(void)addContentView:(UIView*)contentView;

@end
