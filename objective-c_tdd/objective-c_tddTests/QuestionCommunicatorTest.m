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
#import "FakeASIFormDataRequest.h"

@interface FakeParserClass : NSObject
-(void)processSuccess:(NSString*)response;
-(void)processError:(NSError*)error;
@end

@implementation FakeParserClass

-(void)processSuccess:(NSString*)response
{
    
}

-(void)processError:(NSError*)error
{

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
        FakeParserClass *pc = [[FakeParserClass alloc]init];
        [pc processSuccess:response];
    }];
    [comm setErrorBlock:^(NSError *error) {
        FakeParserClass *pc = [[FakeParserClass alloc]init];
        [pc processError:error];
    }];
    
    STAssertNoThrow([fakeRequest simulateSuccess], @"should not throw exception");
    STAssertNoThrow([fakeRequest simulateError], @"should not throw exception");
}

@end
