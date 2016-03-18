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
 *  View controller that contains two subviews controllers, one of these controllers will be shown centered, and another the other one will be shown as background. The central view slides to right/left to the make visible the view in the back.
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
