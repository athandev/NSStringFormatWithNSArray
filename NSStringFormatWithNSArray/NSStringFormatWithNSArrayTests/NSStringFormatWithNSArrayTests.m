//
//  NSStringFormatWithNSArrayTests.m
//  NSStringFormatWithNSArrayTests
//
//  Created by david on 20/06/15.
//  Copyright (c) 2015 Comunity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSStringFormatTest.h"


@interface NSStringFormatWithNSArrayTests : XCTestCase

@property (nonatomic) NSStringFormatTest *test;

@end

@implementation NSStringFormatWithNSArrayTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.test = [[NSStringFormatTest alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.test = nil;
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        [self.test testFunction];
    }];
}

@end
