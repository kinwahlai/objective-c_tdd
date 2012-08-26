//
//  QuestionAnswerObject.h
//  objective-c_tdd
//
//  Created by Kin Wah Lai on 8/26/12.
//  Copyright (c) 2012 Kin Wah Lai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionAnswerObject : NSObject
@property NSString *questionStr;
@property NSString *answerStr;
- (id)initWithQuestion:(NSString*)question answer:(NSString*)answer;
-(BOOL)verifyAnswer:(NSString*)input;
@end
