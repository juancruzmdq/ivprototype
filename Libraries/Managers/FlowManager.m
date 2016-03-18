//
//  FlowManager.m
//
//  Created by Juan Cruz Ghigliani on 01/7/15.
//  Copyright (c) 2015 Juan Cruz Ghiglian. All rights reserved.
//

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Imports

#import "FlowManager.h"

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private Interface
@interface FlowManager ()

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Properties
@property (nonatomic, strong) NSMutableDictionary *flows;
@property (nonatomic, strong) NSMutableDictionary *blocksByFlow;
/*!
 *  @brief  Create an snapshot of the current state of the whindows. add it over the new ViewController and add the controller to the windows. Then hide the snapshot with a FadeIn transition
 *
 *  @param destination New Flow View controller
 */
-(void)swithTo:(UIViewController*)destination;
@end

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Implementation

@implementation FlowManager

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Class Methods

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Setup & Teardown

- (instancetype)init{
    self = [super init];
    if (self)
    {
        self.flows = [[NSMutableDictionary alloc]init];
        self.blocksByFlow = [NSMutableDictionary dictionary];
    }
    return self;
}

- (instancetype)initWithWindows:(UIWindow*)window
{
    self = [self init];
    if (self)
    {
        self.window = window;
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Properties Getter/Setter

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Superclass Overrides

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Public methods

- (void)setFlow:(id<NSCopying>)key withViewController:(UIViewController *)controller{
    [self.flows setObject:controller forKey:key];
}

- (void)setFlow:(id<NSCopying>)key withPostBlok:(FlowManagerPostBlock)postBlock{
    if (postBlock && key) {
        self.blocksByFlow[key] = [postBlock copy];
    }
}

- (void)removeViewControllerWithKey:(id<NSCopying>)key{
    [self.flows removeObjectForKey:key];
}

- (void)swithFlowToController:(id<NSCopying>)key{
    
    UIViewController *destination = [self.flows objectForKey:key];
    
    if (destination) {
        [self swithTo:destination];
    }

    FlowManagerPostBlock postBlock = [self.blocksByFlow objectForKey:key];
    if (postBlock) {
        postBlock();
    }
}

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private methods

-(void)swithTo:(UIViewController*)destination{
    UIView *snapShot = [self.window snapshotViewAfterScreenUpdates:YES];

    if ([destination isKindOfClass:[UINavigationController class]]) {
        [(UINavigationController *)destination popToRootViewControllerAnimated:NO];
    }
    
    [destination.view addSubview:snapShot];
    self.window.rootViewController = destination;

    [UIView animateWithDuration:.5
                          delay:0.5
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                        snapShot.layer.opacity = 0;
                     }
                     completion:^(BOOL finished){
                        [snapShot removeFromSuperview];
                     }];
}


@end
