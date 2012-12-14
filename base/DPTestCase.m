//
//  DPTestCase.m
//
//  Created by Michael Kamphausen on 14.09.12.
//  Copyright (c) 2012 Digital Pioneers N.V.. All rights reserved.
//

#import "DPTestCase.h"

@implementation DPTestCase

- (void)setUp {
    [super setUp];
    self.waitTimeout = 2.0;
    self.waitIterationInterval = 0.1;
}

- (void) wait:(NSTimeInterval)seconds {
    [[NSRunLoop mainRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:seconds]];
}

- (BOOL) waitUntil:(BOOL (^)())condition {
    return [self waitUntil:(BOOL (^)())condition withTimeout:self.waitTimeout];
}

- (BOOL) waitUntil:(BOOL (^)())condition withTimeout:(NSTimeInterval)timeout {
    NSDate* timeoutTime = [NSDate dateWithTimeIntervalSinceNow:timeout];
    while (!condition() && ([timeoutTime compare:[NSDate date]] == NSOrderedDescending)) {
		[[NSRunLoop mainRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:self.waitIterationInterval]];
    }
    return [timeoutTime compare:[NSDate date]] == NSOrderedDescending;
}

@end
