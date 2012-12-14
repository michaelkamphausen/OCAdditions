//
//  RKClient+UnitTests.m
//
//  Created by Michael Kamphausen on 10.10.12.
//  Copyright (c) 2012 Digital Pioneers N.V. All rights reserved.
//

#import "RKClient+UnitTests.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

static RKClient* sharedClient = nil;
static RKClient* mockSharedClient = nil;

@implementation RKClient (UnitTests)

+ (id)createMockObject
{
    mockSharedClient = [OCMockObject mockForClass:[RKClient class]];
    return mockSharedClient;
}

+ (id)createNiceMockObject
{
    mockSharedClient = [OCMockObject niceMockForClass:[RKClient class]];
    return mockSharedClient;
}

+ (RKClient *)realSharedClient
{
    return sharedClient;
}

+ (void)setSharedClient:(RKClient *)client
{
    sharedClient = client;
}

+ (RKClient *)sharedClient
{
    return mockSharedClient;
}

+ (RKRequest*)getRequestAndExecuteBlock:(NSInvocation*)invocation
{
    void (^theBlock)(RKRequest *request);
    [invocation getArgument:&theBlock atIndex:3];
    RKRequest *request = [RKRequest requestWithURL:[NSURL URLWithString:@""]];
    theBlock(request);
    return request;
}

+ (void)didLoadResponseForRequest:(RKRequest*)request statusCode:(int)status dataFromString:(NSString*)json
{
    NSData* data = [json dataUsingEncoding:NSUTF8StringEncoding];
    [self didLoadResponseForRequest:request statusCode:status data:data];
}

+ (void)didLoadResponseForRequest:(RKRequest*)request statusCode:(int)status dataFromBundle:(NSBundle*)bundle file:(NSString*)filename
{
    NSString* file = [bundle pathForResource:[filename stringByDeletingPathExtension] ofType:filename.pathExtension];
    NSData* data = [NSData dataWithContentsOfFile:file];
    [self didLoadResponseForRequest:request statusCode:status data:data];
}

+ (void)didLoadResponseForRequest:(RKRequest*)request statusCode:(int)status data:(NSData*)data
{
    NSDictionary* headers = @{RKRequestCacheStatusCodeHeadersKey: [NSNumber numberWithInt:status]};
    RKResponse *response = [[RKResponse alloc] initWithRequest:request body:data headers:headers];
    request.onDidLoadResponse(response);
}

+ (void)didFailLoadWithNetworkErrorForRequest:(RKRequest*)request
{
    NSError* error = [NSError errorWithDomain:(NSString *)kCFErrorDomainCFNetwork code:kCFHostErrorHostNotFound userInfo:nil];
    request.onDidFailLoadWithError(error);
}

@end

#pragma clang diagnostic pop
