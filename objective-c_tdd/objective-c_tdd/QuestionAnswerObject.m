//
//  QuestionAnswerObject.m
//  objective-c_tdd
//
//  Created by Kin Wah Lai on 8/26/12.
//  Copyright (c) 2012 Kin Wah Lai. All rights reserved.
//

#import "QuestionAnswerObject.h"

@implementation QuestionAnswerObject
- (id)initWithQuestion:(NSString*)question answer:(NSString*)answer
{
    self = [super init];
    if (self) {
        self.questionStr = question;
        self.answerStr = answer;
    }
    return self;
}
-(BOOL)verifyAnswer:(NSString *)input
{
    return [self.answerStr caseInsensitiveCompare:input] == NSOrderedSame ? YES : NO;
}
@end
