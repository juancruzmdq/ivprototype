//
//  NSString+Validator.m
//  ivprototype
//
//  Created by Juan Cruz Ghigliani on 16/3/16.
//  Copyright © 2016 Juan Cruz Ghigliani. All rights reserved.
//

#import "NSString+Validator.h"

@implementation NSString (Validator)
- (BOOL) isValidEmail
{
    // Another validation option
    // NSString *emailRegex = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *emailRegex = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}
@end
