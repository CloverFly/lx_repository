//
//  LXTouchView.m
//
//  Created by Clover on 13-11-25.
//  Copyright (c) 2013年 Clover. All rights reserved.
//
//  https://github.com/CloverFly/lx_repository/tree/master/code/Lx_PopViewiPhone

#import "LXTouchView.h"

@implementation LXTouchView

-(void)dealloc
{
    [_outsideBlock release];
    [_insideBlock release];
    [super dealloc];
}

-(void)setTouchedOutsideBlock:(LXTouchedOutsideBlock)outsideBlock
{
    [_outsideBlock release];
    _outsideBlock = [outsideBlock copy];
}

-(void)setTouchedInsideBlock:(LXTouchedInsideBlock)insideBlock
{
    [_insideBlock release];
    _insideBlock = [insideBlock copy];    
}

-(UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *subview = [super hitTest:point withEvent:event];

    if(UIEventTypeTouches == event.type)
    {
        BOOL touchedInside = subview != self;
        if(!touchedInside)
        {
            for(UIView *s in self.subviews)
            {
                if(s == subview)
                {
                    //touched inside
                    touchedInside = YES;
                    break;
                }
            }            
        }
        
        if(touchedInside && _insideBlock)
        {
            _insideBlock();
        }
        else if(!touchedInside && _outsideBlock)
        {
            _outsideBlock();
        }
    }
    
    return subview;
}


@end
