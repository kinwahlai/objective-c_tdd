//
//  QuestionAnswerObjectTest.m
//  objective-c_tdd
//
//  Created by Kin Wah Lai on 8/26/12.
//  Copyright (c) 2012 Kin Wah Lai. All rights reserved.
//

#import "QuestionAnswerObjectTest.h"
#import "objc/runtime.h"
#import "QuestionAnswerObject.h"

@implementation QuestionAnswerObjectTest
-(void)setUp
{
    [super setUp];
    qaobj = [[QuestionAnswerObject alloc]initWithQuestion:@"Question1" answer:@"Answer1"];
}

-(void)tearDown
{
    [super tearDown];
}

-(void)testQuestionAnswerObjectHasQuestionAndAnswerProperties
{
    objc_property_t questionStr = class_getProperty([QuestionAnswerObject class], "questionStr");
    objc_property_t answerStr = class_getProperty([QuestionAnswerObject class], "answerStr");
    STAssertTrue(questionStr != NULL, @"should not be nil");
    STAssertTrue(answerStr != NULL, @"should not be nil");
}

-(void)testQuestionAnswerObjectInitWithQuestionAndAnswer
{
    STAssertNotNil(qaobj, @"should not be nil");
    STAssertEquals(qaobj.questionStr, @"Question1", @"should be the same");
    STAssertEquals(qaobj.answerStr, @"Answer1", @"should be the same");
}

-(void)testQuestionAnswerObjectVerifyAnswerCaseInsensitive
{
    STAssertTrue([qaobj verifyAnswer:@"aNsWEr1"], @"should verify success");
    STAssertFalse([qaobj verifyAnswer:@"aNsWEr111"], @"should verify failed");
    
}

@end
