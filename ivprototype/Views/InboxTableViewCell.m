//
//  InboxTableViewCell.m
//  ivprototype
//
//  Created by Juan Cruz Ghigliani on 15/3/16.
//  Copyright (c) 2016 Juan Cruz Ghigliani. All rights reserved.
//

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Imports

#import "InboxTableViewCell.h"
#import "Email.h"
////////////////////////////////////////////////////////////////////////////////
#pragma mark - Types

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Defines & Constants

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Macros

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private Interface

@interface InboxTableViewCell ()

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private Properties
@property(nonatomic,strong) IBOutlet UILabel * lblNames;
@property(nonatomic,strong) IBOutlet UILabel * lblSubject;
@property(nonatomic,strong) IBOutlet UILabel * lblFirstLine;
@property(nonatomic,strong) IBOutlet UILabel * lblDate;
@end

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Implementation

@implementation InboxTableViewCell

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Setup & Teardown

- (void)commonInitInboxTableViewCell
{
    // Your common initialization code here
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self commonInitInboxTableViewCell];
    }
    return self;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self commonInitInboxTableViewCell];
    }
    return self;
}

- (void)dealloc
{
    // Your code here
}


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Superclass Overrides

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Custom Accessors

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Public methods

-(void)presentEmails:(NSArray*)emails{
    self.emails = emails;
    
    self.lblNames.text = @"";
    if (emails &&
        (emails.count > 0)) {
        
        // Get array of email destinations to join them in a string
        NSMutableArray * nameList = [NSMutableArray array];
        for (Email *email in self.emails) {
            [nameList insertObject:email.to atIndex:nameList.count];
        }
        self.lblNames.text = [nameList componentsJoinedByString:@","];
        
        // Show info of the first mail, only for prototyping purpose
        Email*firstEmail = emails[0];
        self.lblSubject.text = firstEmail.subject;
        self.lblFirstLine.text = firstEmail.text;
        self.lblDate.text = firstEmail.dateTime;
    }
    
}


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private methods

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Actions


@end
