//
//  RKClient+UnitTests.h
//
//  Created by Michael Kamphausen on 10.10.12.
//  Copyright (c) 2012 Digital Pioneers N.V. All rights reserved.
//

#import <RestKit/RestKit.h>
#import <OCMock/OCMock.h>

@interface RKClient (UnitTests)

+ (void)setSharedClient:(RKClient *)client;
+ (RKClient *)sharedClient;

+ (id)createMockObject;
+ (id)createNiceMockObject;
+ (RKClient *)realSharedClient;
+ (RKRequest*)getRequestAndExecuteBlock:(NSInvocation*)invocation;
+ (void)didLoadResponseForRequest:(RKRequest*)request statusCode:(int)status dataFromString:(NSString*)json;
+ (void)didLoadResponseForRequest:(RKRequest*)request statusCode:(int)status dataFromBundle:(NSBundle*)bundle file:(NSString*)filename;
+ (void)didLoadResponseForRequest:(RKRequest*)request statusCode:(int)status data:(NSData*)data;
+ (void)didFailLoadWithNetworkErrorForRequest:(RKRequest*)request;

@end
