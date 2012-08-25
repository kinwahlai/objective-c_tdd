//
//  QuestionCommunicatorTest.m
//  objective-c_tdd
//
//  Created by Kin Wah Lai on 8/25/12.
//  Copyright (c) 2012 Kin Wah Lai. All rights reserved.
//

#import "QuestionCommunicatorTest.h"
#import "QuestionCommunicator.h"
#import "objc/runtime.h"
#import "ASIHTTPRequestDelegate.h"

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

@implementation QuestionCommunicatorTest
-(void)setUp
{
    [super setUp];
    comm = [[QuestionCommunicator alloc]init];
    fakeRequest = [[FakeASIFormDataRequest alloc]initWithURL:nil];
    comm.formDataRequest = fakeRequest;
}

-(void)tearDown
{
    [super tearDown];
}

-(void)testQuestionCommunicatorExists
{
    STAssertNotNil(comm, @"should exists and not nil");
}

-(void)testQuestionCommunicatorHasASIFormDataRequestProperty
{
    objc_property_t formDataRequest = class_getProperty([comm class], "formDataRequest");
    STAssertTrue(formDataRequest != NULL, @"should not be null");
    STAssertNotNil(comm.formDataRequest, @"should be initialized during communicator init");
}

-(void)testQuestionCommunicatorConformToASIHTTPRequestDelegate
{
    STAssertTrue([comm conformsToProtocol:@protocol(ASIHTTPRequestDelegate)], @"should conform to this protocol");
}

-(void)testQuestionCommunicatorStartAsynchronous
{
    STAssertNoThrow([comm startAsynchronous], @"should executed without exception");
    STAssertTrue(fakeRequest.startAsynchronousCalled, @"this method should be called");
}

-(void)testQuestionCommunicatorHandleSuccessRequest
{
    fakeRequest.delegate = comm;
    [comm setSuccessBlock:^(NSString *response) {
        // TODO: is this correct?
        STAssertNotNil(response, @"should not be nil");
    }];
    [comm setErrorBlock:^(NSError *error) {
        STAssertNotNil(error, @"should not be nil");
    }];
    
    STAssertNoThrow([fakeRequest simulateSuccess], @"should not throw exception");
    STAssertNoThrow([fakeRequest simulateError], @"should not throw exception");
}

@end
