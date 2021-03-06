//
//  EmailService.h
//  ivprototype
//
//  Created by Juan Cruz Ghigliani on 14/3/16.
//  Copyright (c) 2016 Juan Cruz Ghigliani. All rights reserved.
//

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Imports

#import <Foundation/Foundation.h>
#import "RemoteService.h"
#import "Inbox.h"

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Types

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Defines & Constants

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Macros

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Interface
/**
 *  This class is a proxy for the remote service that contains the mail's info of this prototype
 */
@interface EmailService : RemoteService

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Singleton methods

/*!
 *  @brief  Get a default instance of a EmailService
 *
 *  @return defaultManager
 */
+ (nonnull EmailService*)sharedInstance;


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Properties


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Class Methods

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Instance Methods
/**
 *  Helper methor to get inbox resource from the server
 *
 *  @param success block with Inbox model
 *  @param failure block with error info
 */
- (void)getInboxOnSuccess:(nullable void (^)(Inbox * _Nonnull))success
                onFailure:(nullable void (^)(NSError * _Nonnull))failure;

@end
