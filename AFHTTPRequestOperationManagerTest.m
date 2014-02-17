//
//  AFHTTPRequestOperationManagerTests.m
//  yeswareiOS
//
//  Created by Benjamin Coe on 2/17/14.
//  Copyright (c) 2014 Yesware. All rights reserved.
//

#import <XCTest/XCTest.h>

#define EXP_SHORTHAND YES

#import <Expecta/Expecta.h>
#import "AFHTTPRequestOperationManager+timeout.h"

@interface AFHTTPRequestOperationManagerTests : XCTestCase
{
	NSString *baseURL;
}
@end

@implementation AFHTTPRequestOperationManagerTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // We hit httpbin.org for the AFHTTPRequestTests, this approach is the same
    // as is used by https://github.com/AFNetworking/AFNetworking.
    baseURL = @"http://httpbin.org/";
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - connection timeout tests

- (void)testFailureOccursIfRequestTakesLongerThanTimeoutInterval {
	[Expecta setAsynchronousTestTimeout:2.0];

	__block id blockResponseObject = nil;
	__block id blockError = nil;

	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
	
	[manager
		GET: [NSString stringWithFormat:@"%@/delay/10", baseURL]
		parameters:nil
		timeoutInterval:0.1f
		success:^(AFHTTPRequestOperation *operation, id responseObject) {
	        blockResponseObject = responseObject;
		}
		failure:^(AFHTTPRequestOperation *operation, NSError *error) {
	        blockError = error;
		}
	];

	[NSThread sleepForTimeInterval:1.0];

	expect(blockResponseObject).will.beNil();
	expect(blockError).willNot.beNil();
}

- (void)testRequestSucceedsIfRequestIsLessThanTimeoutInterval {
	[Expecta setAsynchronousTestTimeout:2.0];

	__block id blockResponseObject = nil;
	__block id blockError = nil;

	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
	
	[manager
		GET: [NSString stringWithFormat:@"%@/get", baseURL]
		parameters:nil
		timeoutInterval:10.0f
		success:^(AFHTTPRequestOperation *operation, id responseObject) {
	        blockResponseObject = responseObject;
		}
		failure:^(AFHTTPRequestOperation *operation, NSError *error) {
	        blockError = error;
		}
	];

	[NSThread sleepForTimeInterval:1.0];

	expect(blockError).will.beNil();
	expect(blockResponseObject).willNot.beNil();	
}

@end
