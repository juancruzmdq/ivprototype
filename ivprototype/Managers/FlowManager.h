//
//  FlowManager.h
//
//  Created by Juan Cruz Ghigliani on 01/7/15.
//  Copyright (c) 2015 Juan Cruz Ghiglian. All rights reserved.
//

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Imports

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Types
typedef void(^FlowManagerPostBlock)(void);

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Interface
/**
 *  This class contains a set of view controller's flows, and allow to change between them, changing the rootViewController in the app's window
 */
@interface FlowManager : NSObject

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Properties
@property(nonatomic,strong) UIWindow* window;


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Class Methods

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Instance Methods

/*!
 *  @brief  Create an instance of a FlowManager for an specific Windows
 *
 *  @param window Window where the flow is displayed
 *
 *  @return FlowManager instance
 */
- (instancetype)initWithWindows:(UIWindow*)window;

/*!
 *  @brief  Add a root View controller to the flows Collection
 *
 *  @param controller Instance of UIViewController
 *  @param key        key that identify the flow in the collection
 */
- (void)setFlow:(id<NSCopying>)key withViewController:(UIViewController *)controller;

/**
 *  Link a block to a flow, this block will be executed after swith to a specific flow.
 *
 *  @param postBlock instance of FlowManagerPostBlock
 *  @param key       Key that identify a flow
 */
- (void)setFlow:(id<NSCopying>)key withPostBlok:(FlowManagerPostBlock)postBlock;

/*!
 *  @brief  Remove a view controllers from the flows collection
 *
 *  @param key key that identify the flow in the collection
 */
- (void)removeViewControllerWithKey:(id<NSCopying>)key;


/*!
 *  @brief  Swith to a specific flow
 *
 *  @param key key that identify the flow in the collection
 */
- (void)swithFlowToController:(id<NSCopying>)key;

@end
