//
//  QuestionAnswerBuilderTest.m
//  objective-c_tdd
//
//  Created by Kin Wah Lai on 8/26/12.
//  Copyright (c) 2012 Kin Wah Lai. All rights reserved.
//

#import "QuestionAnswerBuilderTest.h"
#import "QuestionAnswerBuilder.h"

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




@end
