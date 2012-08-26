//
//  FakeASIFormDataRequest.h
//  objective-c_tdd
//
//  Created by Kin Wah Lai on 8/26/12.
//  Copyright (c) 2012 Kin Wah Lai. All rights reserved.
//

#import "ASIFormDataRequest.h"

@interface FakeASIFormDataRequest : ASIFormDataRequest
@property BOOL startAsynchronousCalled;
-(void)simulateSuccess;
-(void)simulateError;
@end
