//
//  ReallySimpleProgress.h
//  ivprototype
//
//  Created by Juan Cruz Ghigliani on 16/3/16.
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
#pragma mark - Macros

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Interface
/**
 *  Simple view controller with a title and a spinner
 */
@interface ReallySimpleProgress : UIAlertController


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Properties

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Outlets

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Class Methods
/**
 *  Create instance of ReallySimpleProgress with a specific title
 *
 *  @param title Title in the view
 *
 *  @return ReallySimpleProgress
 */
+(ReallySimpleProgress*)progressWithTitle:(NSString*)title;
////////////////////////////////////////////////////////////////////////////////
#pragma mark - Instance Methods

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Actions


@end