//
//  QuestionAnswerBuilder.m
//  objective-c_tdd
//
//  Created by Kin Wah Lai on 8/26/12.
//  Copyright (c) 2012 Kin Wah Lai. All rights reserved.
//

#import "QuestionAnswerBuilder.h"
#import "QuestionAnswerObject.h"

@implementation QuestionAnswerBuilder

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(QuestionAnswerObject *)questionAnswerFromJSON:(NSString *)objectNotation error:(NSError **)error
{
    NSParameterAssert(objectNotation != nil);
    NSData *unicodeNotation = [objectNotation dataUsingEncoding: NSUTF8StringEncoding];
    NSError *localError = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData: unicodeNotation options: 0 error: &localError];
    NSDictionary *parsedObject = (id)jsonObject;
    if (parsedObject == nil || jsonObject == nil) {
        if (error != NULL) {
            *error = localError;
            return nil;
        }
    }
    if ([parsedObject objectForKey:@"question"] == nil || [parsedObject objectForKey:@"answer"] == nil) {
        if (error != NULL) {
            *error = [NSError errorWithDomain:@"" code: 100 userInfo:nil];
        }
        return nil;
    }
    QuestionAnswerObject *expectedobj = [[QuestionAnswerObject alloc]initWithQuestion:[parsedObject objectForKey:@"question"] answer:[parsedObject objectForKey:@"answer"]];
    return expectedobj;
}
@end
