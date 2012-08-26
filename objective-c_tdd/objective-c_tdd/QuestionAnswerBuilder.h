//
//  QuestionAnswerBuilder.h
//  objective-c_tdd
//
//  Created by Kin Wah Lai on 8/26/12.
//  Copyright (c) 2012 Kin Wah Lai. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QuestionAnswerObject;

@interface QuestionAnswerBuilder : NSObject
-(QuestionAnswerObject *)questionAnswerFromJSON:(NSString*)jsonString error:(NSError **)error;
@end
