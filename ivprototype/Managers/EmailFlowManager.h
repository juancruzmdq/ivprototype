//
//  EmailFlowManager.h
//  ivprototype
//
//  Created by Juan Cruz Ghigliani on 15/3/16.
//  Copyright (c) 2016 Juan Cruz Ghigliani. All rights reserved.
//

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Imports

#import <Foundation/Foundation.h>
#import "FlowManager.h"
#import "LoginViewController.h"
#import "InboxViewController.h"
#import "DrawerViewController.h"
#import "MenuViewController.h"

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Defines
extern NSString * const EmailFlowManagerLogin;
extern NSString * const EmailFlowManagerMain;

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Types

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Macros

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Interface
/**
 *  This class manage the flows used in this prototype. The two defined flows are EmailFlowManagerLogin and EmailFlowManagerMain
 */
@interface EmailFlowManager : FlowManager

@property (strong, nonatomic) LoginViewController *loginViewController;
@property (strong, nonatomic) InboxViewController *inboxViewController;
@property (strong, nonatomic) DrawerViewController *drawerViewController;
@property (strong, nonatomic) MenuViewController *menuViewController;



////////////////////////////////////////////////////////////////////////////////
#pragma mark - Singleton methods

+ (EmailFlowManager*)sharedInstance;

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Class Methods

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Instance Methods


@end
