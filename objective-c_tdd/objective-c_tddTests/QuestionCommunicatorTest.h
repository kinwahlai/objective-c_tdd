//
//  QuestionCommunicatorTest.h
//  objective-c_tdd
//
//  Created by Kin Wah Lai on 8/25/12.
//  Copyright (c) 2012 Kin Wah Lai. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@class QuestionCommunicator;
@class FakeASIFormDataRequest;

@interface QuestionCommunicatorTest : SenTestCase
{
    QuestionCommunicator *comm;
    FakeASIFormDataRequest *fakeRequest;
}

@end
