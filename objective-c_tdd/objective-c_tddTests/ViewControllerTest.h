//
//  ViewControllerTest.h
//  objective-c_tdd
//
//  Created by Kin Wah Lai on 8/25/12.
//  Copyright (c) 2012 Kin Wah Lai. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@class ViewController;
@class FakeQuestionCommunicator;
@class FakeASIFormDataRequest;

@interface ViewControllerTest : SenTestCase
{
    ViewController *vc;
    UIView *view;
    UILabel *gameTitle;
    UILabel *gameDesc;
    UIActivityIndicatorView *activityIndicator;
    UILabel *fetchingDesc;
    UILabel *question;
    UIButton *nextQuestionBtn;
    UIButton *giveUpBtn;
    UITextField *answer;
    FakeQuestionCommunicator *comm;
    FakeASIFormDataRequest *request;
}

@end
