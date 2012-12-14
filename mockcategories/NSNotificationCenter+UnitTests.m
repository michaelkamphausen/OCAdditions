//
//  NSNotificationCenter+UnitTests.m
//
//  Created by Michael Kamphausen on 15.11.12.
//  Copyright (c) 2012 Digital Pioneers N.V. All rights reserved.
//

#import "NSNotificationCenter+UnitTests.h"
#import "NSObject+SupersequentImplementation.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

static NSNotificationCenter* mockDefaultCenter = nil;

@implementation NSNotificationCenter (UnitTests)

+ (NSNotificationCenter *)defaultCenter {
    if (mockDefaultCenter) {
        return mockDefaultCenter;
    }
    
    return invokeSupersequentNoParameters();
}

+ (id)createPartialMockObject {
    [NSNotificationCenter destroyMockObject];
    mockDefaultCenter = [OCMockObject partialMockForObject:[NSNotificationCenter defaultCenter]];
    return mockDefaultCenter;
}

+ (void)destroyMockObject {
    mockDefaultCenter = nil;
}

@end

#pragma clang diagnostic pop
