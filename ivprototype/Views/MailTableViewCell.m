//
//  MailTableViewCell.m
//  ivprototype
//
//  Created by Juan Cruz Ghigliani on 16/3/16.
//  Copyright (c) 2016 Juan Cruz Ghigliani. All rights reserved.
//

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Imports

#import "MailTableViewCell.h"

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Types

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Defines & Constants

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Macros

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private Interface

@interface MailTableViewCell ()

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private Properties
@property(nonatomic,strong) Email *email;
@property(nonatomic,strong) IBOutlet UILabel *lblFromEmail;
@property(nonatomic,strong) IBOutlet UILabel *lblDate;
@property(nonatomic,strong) IBOutlet UILabel *lblDateExpanded;
@property(nonatomic,strong) IBOutlet UILabel *lblText;
@property(nonatomic,strong) IBOutlet UILabel *lblTextExpanded;
@property(nonatomic,strong) IBOutlet UILabel *lblToEmail;
@property(nonatomic,strong) IBOutlet UIButton *btnReply;


@end

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Implementation

@implementation MailTableViewCell

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Setup & Teardown

- (void)commonInitMailTableViewCell
{
    // Your common initialization code here
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self commonInitMailTableViewCell];
    }
    return self;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self commonInitMailTableViewCell];
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
    //[super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // Since cell's height is dinamic, we need to update the content view layout
    [self.contentView layoutIfNeeded];
    
    // This widht is use to calculate the
    self.lblTextExpanded.preferredMaxLayoutWidth = CGRectGetWidth(self.lblTextExpanded.frame);
}
////////////////////////////////////////////////////////////////////////////////
#pragma mark - Custom Accessors

-(void)setCollapsed:(BOOL)collapsed{
    _collapsed = collapsed;
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         if (collapsed) {
                             self.lblDate.alpha = 1.0;
                             self.lblText.alpha = 1.0;
                             self.btnReply.alpha = 0.0;
                             self.lblDateExpanded.alpha = 0.0;
                             self.lblToEmail.alpha = 0.0;
                             self.lblTextExpanded.alpha = 0.0;
                         }else{
                             self.lblDate.alpha = 0.0;
                             self.lblText.alpha = 0.0;
                             self.btnReply.alpha = 1.0;
                             self.lblDateExpanded.alpha = 1.0;
                             self.lblToEmail.alpha = 1.0;
                             self.lblTextExpanded.alpha = 1.0;
                         }

                     }];
}

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Public methods
-(void)presentEmail:(Email*)email{
    _email = email;
    self.lblFromEmail.text = email.from;
    self.lblText.text = email.text;
    self.lblTextExpanded.text = email.text;
    self.lblDate.text = email.dateTime;
    self.lblDateExpanded.text = email.dateTime;
    self.lblToEmail.text = email.to;
    
    // Assign static image, only for prototyping purpose
    if ([email.from isEqualToString:@"matt@gmail.com"]) {
        self.imgAvatar.image = [UIImage imageNamed:@"user1"];
    }else if ([email.from isEqualToString:@"jhon@gmail.com"]) {
        self.imgAvatar.image = [UIImage imageNamed:@"user2"];
    }else{
        self.imgAvatar.image = [UIImage imageNamed:@"user3"];
    }
    
}

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private methods

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Actions


@end
