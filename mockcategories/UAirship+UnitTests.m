//
//  UAirship+UnitTests.m
//
//  Created by Michael Kamphausen on 10.10.12.
//  Copyright (c) 2012 Digital Pioneers N.V. All rights reserved.
//

#import "UAirship+UnitTests.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

static UAirshipExpectTakeOffBlock takeOffBlock = nil;
static UAirshipExpectLandBlock landBlock = nil;

@implementation UAirship (UnitTests)

+ (void)takeOff:(NSDictionary *)options {
    if (takeOffBlock) {
        takeOffBlock(options);
    }
}

+ (void)expectTakeOff:(UAirshipExpectTakeOffBlock)testingBlock {
    takeOffBlock = testingBlock;
}

+ (void)land {
    if (landBlock) {
        landBlock();
    }
}

+ (void)expectLand:(UAirshipExpectLandBlock)testingBlock {
    landBlock = testingBlock;
}

@end

#pragma clang diagnostic pop
