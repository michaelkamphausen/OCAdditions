//
//  RKObjectManager+UnitTests.h
//
//  Created by Michael Kamphausen on 10.10.12.
//  Copyright (c) 2012 Digital Pioneers N.V. All rights reserved.
//

#import <RestKit/RestKit.h>
#import <OCMock/OCMock.h>

@interface RKObjectManager (UnitTests)

+ (void)setSharedManager:(RKObjectManager *)manager;
+ (RKObjectManager *)sharedManager;

+ (id)createMockObject;
+ (id)createNiceMockObject;
+ (RKObjectManager *)realSharedManager;

@end
