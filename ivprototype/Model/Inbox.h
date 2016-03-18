//
//  Inbox.h
//  ivprototype
//
//  Created by Juan Cruz Ghigliani on 15/3/16.
//  Copyright (c) 2016 Juan Cruz Ghigliani. All rights reserved.
//

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Imports

#import <Foundation/Foundation.h>
#import "Email.h"
////////////////////////////////////////////////////////////////////////////////
#pragma mark - Types

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Defines & Constants

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Macros

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Interface

@interface Inbox : NSObject


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Properties
@property(nonatomic,strong,readonly) NSMutableArray *emails;


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Class Methods

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Instance Methods
-(instancetype)initWithDictionary:(NSDictionary*)dict;

/**
 *  Add a new Email instance to the inbox collection
 *
 *  @param email Email instance
 */
-(void) addEmail:(Email*)email;

/**
 *  Create grous of conversations with the list of emails in this colections, use the field email.responseToUid to links the mails
 *
 *  @return dictionary of email's conversations, where each key is the id of the principal email, and the value is an array of emails that belong to the conversation
 */
-(NSDictionary*)groupedEmail;


@end
