//
//  ivprototypeTests.m
//  ivprototypeTests
//
//  Created by Juan Cruz Ghigliani on 14/3/16.
//  Copyright © 2016 Juan Cruz Ghigliani. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EmailService.h"

@interface ivprototypeTests : XCTestCase
@property (nonatomic,strong) EmailService *es;
@end

@implementation ivprototypeTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.es = [[EmailService alloc] init];

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.es = nil;
}

- (void)testInboxResource
{
    // Poobably is not a good idea test it here, this is just an example
    XCTAssertNotNil([self.es resourceforKey:@"inbox"], @"Should exist a resource with the key Inbox");
}

@end
