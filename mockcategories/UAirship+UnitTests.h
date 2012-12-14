//
//  UAirship+UnitTests.h
//
//  Created by Michael Kamphausen on 10.10.12.
//  Copyright (c) 2012 Digital Pioneers N.V. All rights reserved.
//

#import "UAirship.h"

typedef void(^UAirshipExpectTakeOffBlock)(NSDictionary* dictionary);
typedef void(^UAirshipExpectLandBlock)(void);

@interface UAirship (UnitTests)

+ (void)takeOff:(NSDictionary *)options;
+ (void)land;

+ (void)expectTakeOff:(UAirshipExpectTakeOffBlock)testingBlock;
+ (void)expectLand:(UAirshipExpectLandBlock)testingBlock;

@end
