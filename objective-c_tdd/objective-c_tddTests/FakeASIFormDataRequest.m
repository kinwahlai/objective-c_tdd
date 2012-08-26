//
//  FakeASIFormDataRequest.m
//  objective-c_tdd
//
//  Created by Kin Wah Lai on 8/26/12.
//  Copyright (c) 2012 Kin Wah Lai. All rights reserved.
//

#import "FakeASIFormDataRequest.h"

@implementation FakeASIFormDataRequest

-(void)startAsynchronous
{
    self.startAsynchronousCalled = YES;
}

-(void)simulateSuccess
{
    if (self.delegate) {
        [self.delegate requestFinished:self];
    }
}

-(void)simulateError
{
    if (self.delegate) {
        [self.delegate requestFailed:self];
    }
}

-(NSString *)responseString
{
    return @"{\"answer\": \"Lhotse\", \"question\": \"What is the forth highest mountain?\"}";
}

-(NSError *)error
{
    return [[NSError alloc]initWithDomain:@"test" code:100 userInfo:nil];
}
@end
