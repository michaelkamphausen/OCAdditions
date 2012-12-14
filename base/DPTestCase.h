//
//  DPTestCase.h
//
//  Created by Michael Kamphausen on 14.09.12.
//  Copyright (c) 2012 Digital Pioneers N.V.. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@interface DPTestCase : SenTestCase

- (void) wait:(NSTimeInterval)seconds;
- (BOOL) waitUntil:(BOOL (^)())condition;
- (BOOL) waitUntil:(BOOL (^)())condition withTimeout:(NSTimeInterval)timeout;

@property NSTimeInterval waitTimeout;
@property NSTimeInterval waitIterationInterval;

@end
