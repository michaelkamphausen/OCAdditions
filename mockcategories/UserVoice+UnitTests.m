//
//  UserVoice+UnitTests.m
//
//  Created by Caro N on 11/7/2012.
//  Copyright (c) 2012 Digital Pioneers N.V. All rights reserved.
//

#import "UserVoice+UnitTests.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

@implementation UserVoice (UnitTests)

static UserVoiceExpectPresentUserVoiceInterfaceForParentViewControllerBlock presentBlockWithoutCredentials = nil;

+ (void)presentUserVoiceInterfaceForParentViewController:(UIViewController *)viewController andConfig:(UVConfig *)config {
    if (presentBlockWithoutCredentials) {
        presentBlockWithoutCredentials(viewController, config);
    }
}

+ (void)expectPresentUserVoiceInterfaceForParentViewController:(UserVoiceExpectPresentUserVoiceInterfaceForParentViewControllerBlock)testingBlock {
    presentBlockWithoutCredentials = testingBlock;
}

@end

#pragma clang diagnostic pop