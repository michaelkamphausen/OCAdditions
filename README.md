# OCAdditions

## Base Classes

`DPTestCase` comes without dependencies except `SenTestingKit` and has methods to let the test case execution wait for a certain interval or a condition to become true. Typical use case is waiting for an animation to finish.

`DPBaseTestCase` inherits from `DPTestCase` and has methods to setup and tear down view controllers from Storyboard for testing, and provides a generator for a `NSArray` of `NSManagedObject`. Therefore it depends on an AppDelegate with a `UIWindow* window` property, the `DSMockDataGenerator` from [iOSReusableComponents](https://github.com/michaelkamphausen/iOSReusableComponents/tree/master/MockDataGenerator) and the [OCMock](http://ocmock.org) and [OCHamcrest](http://hamcrest.org/OCHamcrest/) frameworks. It also imports the header files of all the mock categories, so that every subclass uses these categories.
You want to customize `DPBaseTestCase` for your needs, especially change the constants with the names of your storyboard and your momd file and rename the AppDelegate class name.

Test cases should inherit from either `DPTestCase` or `DPBaseTestCase`.

## Mock Categories

The [mockcategories][mockcategories] directory contains a set of categories for mocking singletons, inspired by the great article on [Mocking singletons with OCMock](http://twobitlabs.com/2011/02/mocking-singletons-with-ocmock/). There are categories for a few classes from Cocoa Touch, Facebook SDK, Urban Airship, UserVoice and RestKit.

### Mocking Shared Instances

Many categories add class methods like `createMockObject`, `createNiceMockObject` or `createPartialMockObject` to initialize and return a mock object for the shared instance of this class. The counterpart is `destroyMockObject`, which is provided to release the mock object after verification, so the real shared instance can be used. A typical usage example looks like this:

    id mockNotificationCenter = [NSNotificationCenter createPartialMockObject];
    [[mockNotificationCenter expect] addObserver:[OCMArg isNotNil] selector:NSSelectorFromString(@"sessionStateChanged:") name:FBSessionStateChangedNotification object:[OCMArg isNil]];
    
    // … the tested code is called
    
    STAssertNoThrow([mockNotificationCenter verify], nil);
    [NSNotificationCenter destroyMockObject];

Be careful when mocking `NSNotificationCenter`, especially when performing segues. Some parts of UIKit trigger `NSNotifications` that other parts need to receive, which is not the case when `NSNotificationCenter` is currently mocked. This might result in unexpected exceptions.

In order to be able to switch between mock object and real implementation when testing  shared instances with categories, the _Supersequent Implementation_ by [Matt Galagher](http://www.cocoawithlove.com/2008/03/supersequent-implementation.html) is used with the implemented version by [Francois Proulx](http://code.google.com/p/textured-uinavigationbar/source/browse/trunk/TexturedNavBar/Classes/).

### Mocking Class Methods

As far as I know, class methods cannot be mocked with OCMock. Therefore, some mock categories override this class method and provide another class method to be called in advance to setup an expectation. This expect method takes a block as argument with a similar signature as the mocked class method, which is executed when the mocked class method is called. That way, you can check inside the block whether the mocked class method was called and check the values of the arguments. Example usage:


    __block BOOL verifyTakeOff = NO;
    [UAirship expectTakeOff:^(NSDictionary *options) {
        assertThat(options, notNilValue());
        assertThat(options, hasKey(UAirshipTakeOffOptionsAirshipConfigKey));
        verifyTakeOff = YES;
    }];
    
    // the code under test
    [appdelegate application:mockApplication didFinishLaunchingWithOptions:nil];
    
    assertThatBool(verifyTakeOff, equalToBool(YES));

## License

Licensed under the terms of the [MIT License](https://github.com/michaelkamphausen/OCAdditions/tree/master/LICENSE).