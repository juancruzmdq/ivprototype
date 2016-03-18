//
//  NSString+Validator.h
//  ivprototype
//
//  Created by Juan Cruz Ghigliani on 16/3/16.
//  Copyright © 2016 Juan Cruz Ghigliani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validator)
/*!
 *  @brief  Check if the string has a valid email format using regex @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*"
 *
 *  @return True if the string has a valid mail format
 */
- (BOOL) isValidEmail;
@end
