//
//  RKObjectManager+UnitTests.m
//
//  Created by Michael Kamphausen on 10.10.12.
//  Copyright (c) 2012 Digital Pioneers N.V. All rights reserved.
//

#import "RKObjectManager+UnitTests.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

static RKObjectManager* sharedManager = nil;
static RKObjectManager* mockSharedManager = nil;

@implementation RKObjectManager (UnitTests)

+ (void)setSharedManager:(RKObjectManager *)manager {
    sharedManager = manager;
}

+ (RKObjectManager *)sharedManager {
    return mockSharedManager;
}

+ (id)createMockObject {
    mockSharedManager = [OCMockObject mockForClass:[RKObjectManager class]];
    return mockSharedManager;
}

+ (id)createNiceMockObject {
    mockSharedManager = [OCMockObject niceMockForClass:[RKObjectManager class]];
    return mockSharedManager;
}

+ (RKObjectManager *)realSharedManager {
    return sharedManager;
}

@end

#pragma clang diagnostic pop
