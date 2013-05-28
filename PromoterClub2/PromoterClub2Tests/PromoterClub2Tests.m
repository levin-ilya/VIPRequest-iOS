//
//  PromoterClub2Tests.m
//  PromoterClub2Tests
//
//  Created by ILYA LEVIN on 5/11/13.
//  Copyright (c) 2013 ILYA LEVIN. All rights reserved.
//

#import "PromoterClub2Tests.h"
#import "VIPRequestService.h"

@implementation PromoterClub2Tests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    service = [[VIPRequestService alloc] init];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testSave
{
    [service save];
    STFail(@"Unit tests are not implemented yet in PromoterClub2Tests");
}

@end
