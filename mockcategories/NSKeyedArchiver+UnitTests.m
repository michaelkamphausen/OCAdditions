//
//  NSKeyedArchiver+UnitTests.m
//
//  Created by Michael Kamphausen on 15.10.12.
//  Copyright (c) 2012 Digital Pioneers N.V. All rights reserved.
//

#import "NSKeyedArchiver+UnitTests.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

static NSKeyedArchiverExpectArchiveRootObjectToFileBlock archiveRootObjectToFile = nil;

@implementation NSKeyedArchiver (UnitTests)

+ (BOOL)archiveRootObject:(id)rootObject toFile:(NSString *)path {
    if (archiveRootObjectToFile) {
        return archiveRootObjectToFile(rootObject, path);
    }
    return NO;
}

+ (void)expectArchiveRootObjectToFile:(NSKeyedArchiverExpectArchiveRootObjectToFileBlock)testingBlock {
    archiveRootObjectToFile = testingBlock;
}

@end

#pragma clang diagnostic pop
