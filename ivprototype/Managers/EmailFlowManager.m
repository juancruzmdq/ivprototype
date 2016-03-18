//
//  EmailFlowManager.m
//  ivprototype
//
//  Created by Juan Cruz Ghigliani on 15/3/16.
//  Copyright (c) 2016 Juan Cruz Ghigliani. All rights reserved.
//

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Imports

#import "EmailFlowManager.h"

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Defines
NSString * const EmailFlowManagerLogin = @"EmailFlowManagerLogin";
NSString * const EmailFlowManagerMain = @"EmailFlowManagerMain";


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Types

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Macros

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private Interface
@interface EmailFlowManager ()

@end

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Implementation

@implementation EmailFlowManager

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Class Methods

+ (EmailFlowManager*)sharedInstance
{
    static EmailFlowManager *sharedInstance = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });

    return sharedInstance;
}

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Setup & Teardown


- (id)init
{
    self = [super init];
    if (self)
    {
        [self initFlows];
    }
    return self;
}

- (void)dealloc
{
}


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Superclass Overrides

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Custom Accessors

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Public methods

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private methods

- (LoginViewController *)loginViewController{
    // Create Splash ViewController
    if (!_loginViewController) {
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
        _loginViewController = [storyboard instantiateInitialViewController];
    }
    return _loginViewController;
}

- (InboxViewController *)inboxViewController{
    // Create Splash ViewController
    if (!_inboxViewController) {
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        _inboxViewController = [storyboard instantiateInitialViewController];
    }
    return _inboxViewController;
}

- (DrawerViewController *)drawerViewController{
    // Create Splash ViewController
    if (!_drawerViewController) {
        _drawerViewController = [DrawerViewController drawerWithCenterViewController:self.inboxViewController
                                                              leftMenuViewController:self.menuViewController];
        _drawerViewController.slideDistance = 255;
    }
    return _drawerViewController;
}

- (MenuViewController *)menuViewController{
    // Create Splash ViewController
    if (!_menuViewController) {
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

        _menuViewController = [storyboard instantiateViewControllerWithIdentifier:@"MenuViewControllerId"];
    }
    return _menuViewController;
}



- (void) initFlows
{
    [self setFlow:EmailFlowManagerLogin withViewController:self.loginViewController];
    [self setFlow:EmailFlowManagerMain withViewController:self.drawerViewController];
}


@end
