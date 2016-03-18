//
//  EmailService.m
//  ivprototype
//
//  Created by Juan Cruz Ghigliani on 14/3/16.
//  Copyright (c) 2016 Juan Cruz Ghigliani. All rights reserved.
//

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Imports

#import "EmailService.h"
#import "RemoteResource.h"
#import "Email.h"
////////////////////////////////////////////////////////////////////////////////
#pragma mark - Types

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Defines & Constants

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Macros

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private Interface
@interface EmailService ()

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private Properties
@end

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Implementation

@implementation EmailService

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Synthesize

/* Public *********************************************************************/

/* Private ********************************************************************/

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Setup & Teardown
+ (EmailService*)sharedInstance
{
    static EmailService *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}


- (id)init
{
    self = [super initWithBaseURL:@"http://hook.io"];
    if (self)
    {
        [self createInboxResouce];
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
- (void)getInboxOnSuccess:(void (^)(Inbox * _Nonnull inbox))success
                        onFailure:(void (^)(NSError * _Nonnull error))failure{
    
    [self getResource:@"inbox"
            onSuccess:^(id _Nonnull result) {
                success(result);
            } onFailure:^(NSError * _Nonnull error) {
                failure(error);
            }];

}

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private methods

-(void)createInboxResouce{
    RemoteResource * inbox = [[RemoteResource alloc] init];
    [inbox setPath:@"/juancruzmdq-gmail-com/inbox"];
    [inbox setParse:^ id (id response) {
        Inbox *inbox;
        inbox = [[Inbox alloc] initWithDictionary:response[@"inbox"]];
        return inbox;
    }];
    [self addResource:inbox forKey:@"inbox"];
}

@end
