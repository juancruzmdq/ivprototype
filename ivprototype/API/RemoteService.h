//
//  RemoteService.h
//  ivprototype
//
//  Created by Juan Cruz Ghigliani on 14/3/16.
//  Copyright (c) 2016 Juan Cruz Ghigliani. All rights reserved.
//

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Imports

#import <Foundation/Foundation.h>
#import "RemoteResource.h"

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Types

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Defines & Constants

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Macros

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Interface
/**
 Simple Proxy class that retrieve resources in a remote server
 Use AFNetworking to make request to the destination server
 */
@interface RemoteService : NSObject

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Setup & Teardown
/**
 *  Initialice an instance of RemoteService with a specific root URL
 *
 *  @param baseURL root url of remote service
 *
 *  @return instance of RemoteService
 */
- (nonnull id)initWithBaseURL:(nonnull NSString *)baseURL;

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Properties

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Class Methods

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Instance Methods
/**
 *  Link to this service the specification of a remote resource
 *
 *  @param resource instance of RemoteResource
 *  @param key      key to store/retrieve this specific resource
 */
-(void)addResource:(nonnull RemoteResource *)resource forKey:(nonnull NSString*)key;

/**
 *  Get a resource from this service
 *
 *  @param resourceKey key to retrieve an specific remote resource
 *  @param success     block with the data retrieved from the resource
 *  @param failure     block with the error info
 */
-(void)getResource:(nonnull NSString *)resourceKey
         onSuccess:(nullable void (^)(id _Nonnull))success
         onFailure:(nullable void (^)(NSError * _Nonnull))failure;

@end
