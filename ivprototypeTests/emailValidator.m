//
//  emailValidator.m
//  ivprototype
//
//  Created by Juan Cruz Ghigliani on 18/3/16.
//  Copyright © 2016 Juan Cruz Ghigliani. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+Validator.h"

@interface emailValidator : XCTestCase

@end

@implementation emailValidator

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testEmailValidation{
    XCTAssertFalse([@"jhon" isValidEmail], "Should be an invalid email");
    XCTAssertFalse([@"jhon@gmail" isValidEmail], "Should be an invalid email");
    XCTAssertTrue([@"jhon@gmail.com" isValidEmail], "Should be a valid email");
}

@end
