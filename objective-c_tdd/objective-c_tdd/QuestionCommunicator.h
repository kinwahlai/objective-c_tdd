//
//  QuestionCommunicator.h
//  objective-c_tdd
//
//  Created by Kin Wah Lai on 8/25/12.
//  Copyright (c) 2012 Kin Wah Lai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequestDelegate.h"

typedef void (^errorHandler)(__autoreleasing NSError *);
typedef void (^successHandler)(__autoreleasing NSString *);

@class ASIHTTPRequest;

@interface QuestionCommunicator : NSObject <ASIHTTPRequestDelegate>
{
    successHandler delegateSuccessHandler;
    errorHandler delegateErrorHandler;
}
@property ASIHTTPRequest *formDataRequest;
-(void)setSuccessBlock:(successHandler)successBlock;
-(void)setErrorBlock:(errorHandler)errorBlock;
-(void)startAsynchronous;
@end
