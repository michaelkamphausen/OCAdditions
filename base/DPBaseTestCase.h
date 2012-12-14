//
//  DPBaseTestCase.h
//
//  Created by Michael Kamphausen on 14.09.12.
//  Copyright (c) 2012 Michael Kamphausen. All rights reserved.
//

#import <OCMock/OCMock.h>
#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>
#import "NSNotificationCenter+UnitTests.h"
#import "RKObjectManager+UnitTests.h"
#import "FBSession+UnitTests.h"
#import "UserVoice+UnitTests.h"
#import "UAirship+UnitTests.h"
#import "UAPush+UnitTests.h"
#import "DPTestCase.h"
#import "DSMockDataGenerator.h"


@interface DPBaseTestCase : DPTestCase {
    UIView* view;
}

- (UIViewController*)setUpViewControllerWithIdentifier:(NSString*)identifier;
- (void)tearDownViewController;

@property (strong, nonatomic, readonly) DSMockDataGenerator* mockDataGenerator;

@end
