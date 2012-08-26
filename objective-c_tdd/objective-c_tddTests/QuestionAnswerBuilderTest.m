//
//  QuestionAnswerBuilderTest.m
//  objective-c_tdd
//
//  Created by Kin Wah Lai on 8/26/12.
//  Copyright (c) 2012 Kin Wah Lai. All rights reserved.
//

#import "QuestionAnswerBuilderTest.h"
#import "QuestionAnswerBuilder.h"
#import "QuestionAnswerObject.h"

@implementation QuestionAnswerBuilderTest
-(void)setUp
{
    [super setUp];
    builder = [[QuestionAnswerBuilder alloc]init];
}

-(void)tearDown
{
    [super tearDown];
}

-(void) testBuilderShouldHaveValidParameter
{
    STAssertThrows([builder questionAnswerFromJSON:nil error:nil], @"should throw exception");
}

-(void)testExpectErrorWhenBuilderParseInvalidJSON
{
    NSError *error;
    STAssertNoThrow([builder questionAnswerFromJSON:@"Not JSON" error:&error], @"should throw exception");
    STAssertNotNil(error, @"should not be nil");
}

-(void)testBuilderParseCorrectJSONAndReturnValidObject
{
    NSString *validJSON = @"{\"answer\": \"Lhotse\", \"question\": \"What is the forth highest mountain?\"}";
        NSError *error;
    QuestionAnswerObject *expectedobj = [[QuestionAnswerObject alloc]initWithQuestion:@"What is the forth highest mountain?" answer:@"Lhotse"];
    QuestionAnswerObject *qaobj = [builder questionAnswerFromJSON:validJSON error:&error];
    STAssertNotNil(qaobj, @"should not be nil");
    STAssertTrue([qaobj.questionStr isEqualToString:expectedobj.questionStr], @"should be the same");
    STAssertTrue([qaobj.answerStr isEqualToString:expectedobj.answerStr], @"should be the same");
}

-(void)testBuilderParseValidJSONWithNoQuestion
{
    NSString *validJSON = @"{}";
    NSError *error;
    STAssertNoThrow([builder questionAnswerFromJSON:validJSON error:&error], @"should throw exception");
    STAssertNotNil(error, @"should not be nil");

}


@end
