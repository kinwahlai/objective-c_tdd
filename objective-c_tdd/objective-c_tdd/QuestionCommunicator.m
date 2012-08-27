//
//  QuestionCommunicator.m
//  objective-c_tdd
//
//  Created by Kin Wah Lai on 8/25/12.
//  Copyright (c) 2012 Kin Wah Lai. All rights reserved.
//

#import "QuestionCommunicator.h"
#import "ASIHTTPRequest.h"

@implementation QuestionCommunicator
- (id)init
{
    self = [super init];
    if (self) {
        self.formDataRequest = [[ASIHTTPRequest alloc]initWithURL:[NSURL URLWithString:@"http://localhost:8080"]];
        self.formDataRequest.delegate = self;
    }
    return self;
}

-(void)setErrorBlock:(errorHandler)errorBlock
{
    delegateErrorHandler = errorBlock;
}

-(void)setSuccessBlock:(successHandler)successBlock
{
    delegateSuccessHandler = successBlock;
}

-(void)startAsynchronous
{
    [self.formDataRequest startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSString *responseString = [request responseString];
    delegateSuccessHandler(responseString);
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSError *error = [request error];
    delegateErrorHandler(error);
}

@end
