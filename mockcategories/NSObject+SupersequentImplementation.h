//
//  NSObject+SupersequentImplementation.h
//  TexturedNavBar
//
//  Created by Francois Proulx on 10-06-16.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define invokeSupersequent(...) \
([self getImplementationOf:_cmd \
after:impOfCallingMethod(self, _cmd)]) \
(self, _cmd, ##__VA_ARGS__)

#define invokeSupersequentNoParameters() \
([self getImplementationOf:_cmd \
after:impOfCallingMethod(self, _cmd)]) \
(self, _cmd)

@interface NSObject (SupersequentImplementation)

- (IMP) getImplementationOf:(SEL)lookup after:(IMP)skip;
IMP impOfCallingMethod(id lookupObject, SEL selector);

@end
