//
//  LXTouchView.h
//
//  Created by Clover on 13-11-25.
//  Copyright (c) 2013年 Clover. All rights reserved.
//
//  https://github.com/CloverFly/lx_repository/tree/master/code/Lx_PopViewiPhone

#import <UIKit/UIKit.h>

typedef void (^LXTouchedOutsideBlock)();
typedef void (^LXTouchedInsideBlock)();

@interface LXTouchView : UIView
{
    LXTouchedOutsideBlock _outsideBlock;
    LXTouchedInsideBlock  _insideBlock;
}

-(void)setTouchedOutsideBlock:(LXTouchedOutsideBlock)outsideBlock;

-(void)setTouchedInsideBlock:(LXTouchedInsideBlock)insideBlock;

@end
