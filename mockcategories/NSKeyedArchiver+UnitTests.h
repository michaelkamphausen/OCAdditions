//
//  NSKeyedArchiver+UnitTests.h
//
//  Created by Michael Kamphausen on 15.10.12.
//  Copyright (c) 2012 Digital Pioneers N.V. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef BOOL(^NSKeyedArchiverExpectArchiveRootObjectToFileBlock)(id rootObject, NSString* path);

@interface NSKeyedArchiver (UnitTests)

+ (void)expectArchiveRootObjectToFile:(NSKeyedArchiverExpectArchiveRootObjectToFileBlock)testingBlock;

@end
