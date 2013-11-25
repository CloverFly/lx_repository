//
//  LXPopoverController.h
//
//  Created by Clover on 13-11-25.
//  Copyright (c) 2013年 Clover. All rights reserved.
//
//  https://github.com/CloverFly/lx_repository/tree/master/code/Lx_PopViewiPhone

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "LXPopoverView.h"
#import "LXTouchView.h"

@class LXPopoverController;
@protocol LXPopoverControllerDelegate <NSObject>

@optional
- (void)popoverControllerDidDismissPopover:(LXPopoverController *)popoverController;
- (void)presentedNewPopoverController:(LXPopoverController *)newPopoverController 
          shouldDismissVisiblePopover:(LXPopoverController*)visiblePopoverController;
@end

@interface LXPopoverController : UIViewController
{
    LXTouchView *_touchView;
    LXPopoverView *_contentView;
    UIViewController *_viewController;
    UIWindow *_window;
    UIView *_parentView;
    UIView *_fromView;
    UIDeviceOrientation _deviceOrientation;
}
@property(nonatomic,assign) id<LXPopoverControllerDelegate> delegate;
/** @brief LXPopoverArrowDirectionAny, LXPopoverArrowDirectionVertical or LXPopoverArrowDirectionHorizontal for automatic arrow direction.
 **/
@property(nonatomic,assign) LXPopoverArrowDirection arrowDirection;

@property(nonatomic,assign) CGSize contentSize;
@property(nonatomic,assign) CGPoint origin;

/** @brief The tint of the popover. **/
@property(nonatomic,assign) LXPopoverTint tint;

/** @brief Initialize the popover with the content view controller
 **/
-(id)initWithViewController:(UIViewController*)viewController;

/** @brief Presenting the popover from a specified view **/
-(void)presentPopoverFromView:(UIView*)fromView;

/** @brief Presenting the popover from a specified point **/
-(void)presentPopoverFromPoint:(CGPoint)fromPoint;


/** @brief Dismiss the popover **/
-(void)dismissPopoverAnimated:(BOOL)animated;





@end
