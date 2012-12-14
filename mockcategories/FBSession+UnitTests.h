//
//  FBSession+UnitTests.h
//
//  Created by Caro N on 11/7/2012.
//  Copyright (c) 2012 Digital Pioneers N.V. All rights reserved.
//

#import <FacebookSDK/FacebookSDK.h>
#import <OCMock/OCMock.h>

@interface FBSession (UnitTests)

+ (FBSession *)activeSession;

+ (id)createMockObject;
+ (id)createNiceMockObject;

@end
