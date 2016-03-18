//
//  Inbox.m
//  ivprototype
//
//  Created by Juan Cruz Ghigliani on 15/3/16.
//  Copyright (c) 2016 Juan Cruz Ghigliani. All rights reserved.
//

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Imports

#import "Inbox.h"

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Types

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Defines & Constants

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Macros

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private Interface
@interface Inbox ()

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private Properties
@end

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Implementation

@implementation Inbox

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Synthesize

/* Public *********************************************************************/

/* Private ********************************************************************/

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Setup & Teardown

- (id)init
{
    self = [super init];
    if (self)
    {
        _emails = [NSMutableArray array];
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)dict{
    self = [self init];
    
    for (NSDictionary * emailDict in dict) {
        [self addEmail:[[Email alloc]initWithDictionary:emailDict]];
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
-(void) addEmail:(Email*)email{
    [self.emails insertObject:email atIndex:self.emails.count];
}

-(NSDictionary*)groupedEmail{
    
    NSMutableDictionary *group = [NSMutableDictionary dictionary];
    
    for (Email * email in self.emails) {
        NSString * groupId;
        if (email.responseToUid &&
            ![email.responseToUid isEqualToString:@""]) {
            groupId = email.responseToUid;
        }else{
            groupId = email.uid;
        }
        
        NSMutableArray * list = group[groupId];
        if (!list) {
            list = [NSMutableArray array];
        }
        
        [list insertObject:email atIndex:list.count];
        group[groupId] = list;
    }
    return group;
}

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private methods

@end
