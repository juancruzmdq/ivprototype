//
//  DrawerViewController.m
//  ivprototype
//
//  Created by Juan Cruz Ghigliani on 16/3/16.
//  Copyright (c) 2016 Juan Cruz Ghigliani. All rights reserved.
//

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Imports

#import "DrawerViewController.h"

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Types

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Defines & Constants

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Macros

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private Interface

@interface DrawerViewController ()

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private Properties
@property (nonatomic, strong) UIViewController *centerViewController;
@property (nonatomic, strong) UIViewController *leftMenuViewController;
@end


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Implementation

@implementation DrawerViewController

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Setup & Teardown

+ (DrawerViewController *)drawerWithCenterViewController:(id)centerViewController
                                  leftMenuViewController:(id)leftMenuViewController{
    
    // Create main container
    DrawerViewController *controller = [DrawerViewController new];
    
    // Link left controllers, and add as a subview
    controller.leftMenuViewController = leftMenuViewController;
    [controller addChildViewController:leftMenuViewController];

    // Link center controllers, and add as a subview
    controller.centerViewController = centerViewController;
    [controller addChildViewController:centerViewController];
    
    return controller;
}

- (void)commonInitDrawerViewController
{
    self.slideDistance = 200;
}

- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        [self commonInitDrawerViewController];
    }
    return self;
}

- (id)initWithCoder:(NSCoder*)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self commonInitDrawerViewController];
    }
    return self;
}

- (void)dealloc
{
}

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // your code here
    [self setupMenuContainerView];
}

- (void)viewDidUnload {
	// your code here
    [super viewDidUnload];
}

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Superclass Overrides

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Custom Accessors

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Public methods
- (void)toggleDrawer{
    
    CGRect frame = [self.centerViewController view].frame;

    // Assume that if the central view is aligned at left with the main container, should be shown
    if (frame.origin.x == 0) {
        frame.origin.x = self.slideDistance;
    }else{
        frame.origin.x = 0;
    }
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [self.centerViewController view].frame = frame;
                     } completion:nil];
}


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private methods
- (void)setupMenuContainerView {
    if(self.leftMenuViewController && !self.leftMenuViewController.view.superview) {
        [self.view addSubview:self.leftMenuViewController.view];
    }
    [self.view addSubview:self.centerViewController.view];
    
}

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Actions

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Delegate methods


@end
