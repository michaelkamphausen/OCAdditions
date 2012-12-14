//
//  NSNotificationCenter+UnitTests.h
//
//  Created by Michael Kamphausen on 15.11.12.
//  Copyright (c) 2012 Digital Pioneers N.V. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OCMock/OCMock.h>

@interface NSNotificationCenter (UnitTests)

+ (NSNotificationCenter*)defaultCenter;

+ (id)createPartialMockObject;
+ (void)destroyMockObject;

@end
