//
//  UAPush+UnitTests.h
//
//  Created by Michael Kamphausen on 10.10.12.
//  Copyright (c) 2012 Digital Pioneers N.V. All rights reserved.
//

#import <OCMock/OCMock.h>
#import "UAPush.h"

@interface UAPush (UnitTests)

+ (UAPush *)shared;

+ (id)createMockObject;

@end
