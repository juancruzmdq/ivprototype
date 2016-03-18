//
//  DrawerViewController.h
//  ivprototype
//
//  Created by Juan Cruz Ghigliani on 16/3/16.
//  Copyright (c) 2016 Juan Cruz Ghigliani. All rights reserved.
//

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Imports

#import <UIKit/UIKit.h>

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Types

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Defines & Constants

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Macros

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Interface
/**
 *  View controller that contains two subviews controllers, one for the center view, and another for the left view in the back. The central view slide to the make visible the other one
 */
@interface DrawerViewController : UIViewController


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Properties
@property(nonatomic,assign) NSInteger slideDistance;
////////////////////////////////////////////////////////////////////////////////
#pragma mark - Outlets

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Class Methods
/**
 *  Creates instance of DrawerViewController with a central and a left view
 *
 *  @param centerViewController   Main view to display
 *  @param leftMenuViewController View in the left/back
 *
 *  @return DrawerViewController
 */
+ (DrawerViewController *)drawerWithCenterViewController:(id)centerViewController
                                  leftMenuViewController:(id)leftMenuViewController;

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Instance Methods
/**
 *  Moves the main view to show/hide the left view in the back
 */
- (void)toggleDrawer;

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Actions


@end
