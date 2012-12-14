//
//  UAPush+UnitTests.m
//
//  Created by Michael Kamphausen on 10.10.12.
//  Copyright (c) 2012 Digital Pioneers N.V. All rights reserved.
//

#import "UAPush+UnitTests.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

static UAPush* mockShared = nil;

@implementation UAPush (UnitTests)

+ (id)createMockObject {
    mockShared = [OCMockObject mockForClass:[UAPush class]];
    return mockShared;
}

+ (UAPush *)shared {
    return mockShared;
}

@end

#pragma clang diagnostic pop
