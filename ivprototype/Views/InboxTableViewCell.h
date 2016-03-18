//
//  InboxTableViewCell.h
//  ivprototype
//
//  Created by Juan Cruz Ghigliani on 15/3/16.
//  Copyright (c) 2016 Juan Cruz Ghigliani. All rights reserved.
//

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Imports

#import <UIKit/UIKit.h>

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Types

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Defines & Constants

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Constants

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Macros

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Interface

@interface InboxTableViewCell : UITableViewCell

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Properties
@property(nonatomic,strong) NSArray * emails;
////////////////////////////////////////////////////////////////////////////////
#pragma mark - Outlets

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Class Methods

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Instance Methods
-(void)presentEmails:(NSArray*)emails;


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Actions


@end
