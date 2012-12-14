//
//  UserVoice+UnitTests.h
//
//  Created by Caro N on 11/7/2012.
//  Copyright (c) 2012 Digital Pioneers N.V. All rights reserved.
//

#import "UserVoice.h"

typedef void(^UserVoiceExpectPresentUserVoiceInterfaceForParentViewControllerBlock)(UIViewController* viewcontroller, UVConfig* config);

@interface UserVoice (UnitTests)

+ (void)presentUserVoiceInterfaceForParentViewController:(UIViewController *)viewController andConfig:(UVConfig *)config;

+ (void)expectPresentUserVoiceInterfaceForParentViewController:(UserVoiceExpectPresentUserVoiceInterfaceForParentViewControllerBlock)testingBlock;

@end
