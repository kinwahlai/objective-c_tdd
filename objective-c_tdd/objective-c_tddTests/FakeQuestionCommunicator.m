//
//  FakeQuestionCommunicator.m
//  objective-c_tdd
//
//  Created by Kin Wah Lai on 8/27/12.
//  Copyright (c) 2012 Kin Wah Lai. All rights reserved.
//

#import "FakeQuestionCommunicator.h"
#import "FakeASIFormDataRequest.h"

@implementation FakeQuestionCommunicator
- (id)init
{
    self = [super init];
    if (self) {
        self.formDataRequest = [[FakeASIFormDataRequest alloc]initWithURL:nil];
        self.formDataRequest.delegate = self;
    }
    return self;
}
@end
