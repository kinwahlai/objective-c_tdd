//
//  ViewControllerTest.m
//  objective-c_tdd
//
//  Created by Kin Wah Lai on 8/25/12.
//  Copyright (c) 2012 Kin Wah Lai. All rights reserved.
//

#import "ViewControllerTest.h"
#import "objc/runtime.h"
#import "ViewController.h"
#import "FakeQuestionCommunicator.h"
#import "FakeASIFormDataRequest.h"
#import "QuestionAnswerObject.h"

@implementation ViewControllerTest
-(void)setUp
{
    [super setUp];
#pragma mark -
#pragma mark UI setup
    vc = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
    view = [[UIView alloc]init];
    vc.view = view;
    gameTitle = [[UILabel alloc]init];
    gameTitle.text = @"Q & A";
    vc.gameTitle = gameTitle;
    gameDesc = [[UILabel alloc]init];
    gameDesc.text = @"A simple game";
    vc.gameDesc = gameDesc;
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    vc.activityIndicator = activityIndicator;
    fetchingDesc = [[UILabel alloc]init];
    fetchingDesc.text = @"Fetching next question...";
    vc.fetchingDesc = fetchingDesc;
    question = [[UILabel alloc]init];
    question.text = @"Question 1?";
    vc.question = question;
    answer = [[UITextField alloc]init];
    vc.answer = answer;
    nextQuestionBtn = [[UIButton alloc]init];
    vc.nextQuestionBtn = nextQuestionBtn;
    giveUpBtn = [[UIButton alloc]init];
    vc.giveUpBtn = giveUpBtn;
}

-(void)tearDown
{
    [super tearDown];
}

-(void) testViewControllerHasUIViewProperty
{
    objc_property_t pview = class_getProperty([ViewController class], "view");
    STAssertTrue(pview != NULL, @"game title should be there");
}

-(void) testViewControllerHasBlankUIViewPopulated
{
    
    STAssertTrue(vc.view != NULL,@"should not be nil");
}

-(void) testViewControllerHasAGameTitle
{
    objc_property_t pgameTitle = class_getProperty([vc class], "gameTitle");
    STAssertTrue(pgameTitle != NULL, @"game title should be there");
    STAssertNotNil(vc.gameTitle, @"should already initialized");
    STAssertTrue([vc.gameTitle isKindOfClass:[UILabel class]], @"should be a UILabel");
    STAssertEquals(vc.gameTitle.text, @"Q & A", @"should have the same title");
}

-(void) testViewControllerHasAGameDesc
{
    objc_property_t pgameDesc = class_getProperty([vc class], "gameDesc");
    STAssertTrue(pgameDesc != NULL, @"game desc should be there");
    STAssertNotNil(vc.gameDesc, @"should already initialized");
    STAssertTrue([vc.gameDesc isKindOfClass:[UILabel class]], @"should be a UILabel");
    STAssertEquals(vc.gameDesc.text, @"A simple game", @"should have the same description");
}

-(void) testViewControllerHasFetchingQuestionsIndicatorSection
{
    objc_property_t pactivityIndicator = class_getProperty([vc class], "activityIndicator");
    STAssertTrue(pactivityIndicator != NULL, @"indicator should be there");
    STAssertNotNil(vc.activityIndicator, @"should already initialized");
    STAssertTrue([vc.activityIndicator isKindOfClass:[UIActivityIndicatorView class]], @"should be a UIActivityIndicatorView");
    
    objc_property_t pfetchingDesc = class_getProperty([vc class], "fetchingDesc");
    STAssertTrue(pfetchingDesc != NULL, @"fetching desc should be there");
    STAssertNotNil(vc.fetchingDesc, @"should already initialized");
    STAssertTrue([vc.fetchingDesc isKindOfClass:[UILabel class]], @"should be a UILabel");
    STAssertEquals(vc.fetchingDesc.text, @"Fetching next question...", @"should have the same description");
}

-(void)testViewControllerHasQuestionsSection
{
    objc_property_t pquestion = class_getProperty([vc class], "question");
    STAssertTrue(pquestion != NULL, @"should be there");
    STAssertNotNil(vc.question, @"should already initialized");
    STAssertTrue([vc.question isKindOfClass:[UILabel class]], @"should be a UILabel");
    
    objc_property_t panswer = class_getProperty([vc class], "answer");
    STAssertTrue(panswer != NULL, @"should be there");
    STAssertNotNil(vc.answer, @"should already initialized");
    STAssertTrue([vc.answer isKindOfClass:[UITextField class]], @"should be a UITextField");
    
    objc_property_t pnextQuestion = class_getProperty([vc class], "nextQuestionBtn");
    STAssertTrue(pnextQuestion != NULL, @"should be there");
    STAssertNotNil(vc.nextQuestionBtn, @"should already initialized");
    STAssertTrue([vc.nextQuestionBtn isKindOfClass:[UIButton class]], @"should be a UIButton");
    
    objc_property_t pgiveUp = class_getProperty([vc class], "giveUpBtn");
    STAssertTrue(pgiveUp != NULL, @"should be there");
    STAssertNotNil(vc.giveUpBtn, @"should already initialized");
    STAssertTrue([vc.giveUpBtn isKindOfClass:[UIButton class]], @"should be a UIButton");

}

-(void)testViewControllerHideQuestionSectionInsideViewDidLoad
{
    STAssertNoThrow([vc viewDidLoad], @"should execute without exception");
    STAssertTrue(vc.question.hidden, @"should be hidden");
    STAssertTrue(vc.answer.hidden, @"should be hidden");
    STAssertTrue(vc.nextQuestionBtn.hidden, @"should be hidden");
    STAssertTrue(vc.giveUpBtn.hidden, @"should be hidden");
}

-(void)testViewControllerShowQuestionSection
{
    STAssertNoThrow([vc showQuestionSection], @"should execute without exception");
    STAssertFalse(vc.question.hidden, @"should be hidden");
    STAssertFalse(vc.answer.hidden, @"should be hidden");
    STAssertFalse(vc.nextQuestionBtn.hidden, @"should be hidden");
    STAssertFalse(vc.giveUpBtn.hidden, @"should be hidden");
}

-(void)testViewControllerHideActivityIndicatorSection
{
    STAssertNoThrow([vc hideActivityIndicatorSection], @"should execute without exception");
    STAssertTrue(vc.activityIndicator.hidden, @"should be hidden");
    STAssertTrue(vc.fetchingDesc.hidden, @"should be hidden");
    STAssertFalse([vc.activityIndicator isAnimating], @"should start animating");
}

-(void)testViewControllerShowActivityIndicatorSection
{
    STAssertNoThrow([vc showActivityIndicatorSection], @"should execute without exception");
    STAssertFalse(vc.activityIndicator.hidden, @"should be hidden");
    STAssertFalse(vc.fetchingDesc.hidden, @"should be hidden");
    STAssertTrue([vc.activityIndicator isAnimating], @"should start animating");
}

-(void) testViewControllerHasCommunicator
{
    objc_property_t pcommunicator = class_getProperty([vc class], "communicator");
    STAssertTrue(pcommunicator != NULL, @"communicator should be there");
}

-(void)testViewControllerCreateCommunicatorInsideInit
{
    STAssertNotNil(vc.communicator, @"should not be nil");
}

-(void)testViewControllerFetchQuestionInsideViewDidLoad
{
    FakeQuestionCommunicator *comm = [[FakeQuestionCommunicator alloc]init];
    vc.communicator = comm;
    STAssertNoThrow([vc fetchQuestion], @"should execute without exception");
    
    FakeASIFormDataRequest *request = (FakeASIFormDataRequest*)comm.formDataRequest;
    [request simulateSuccess];
    STAssertNotNil(vc.qaObject, @"should not be nil");
    STAssertTrue([vc.question.text isEqualToString:vc.qaObject.questionStr],@"should be true");
    STAssertFalse(vc.question.hidden, @"should not be hidden");
}

@end
