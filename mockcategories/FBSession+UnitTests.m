//
//  FBSession+UnitTests.m
//
//  Created by Caro N on 11/7/2012.
//  Copyright (c) 2012 Digital Pioneers N.V. All rights reserved.
//

#import "FBSession+UnitTests.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

@implementation FBSession (UnitTests)

static FBSession* mockActiveSession = nil;

+ (FBSession *)activeSession {
    return mockActiveSession;
}

+ (id)createMockObject {
    mockActiveSession = [OCMockObject mockForClass:[FBSession class]];
    return mockActiveSession;
}

+ (id)createNiceMockObject {
    mockActiveSession = [OCMockObject niceMockForClass:[FBSession class]];
    return mockActiveSession;
}

@end

#pragma clang diagnostic pop