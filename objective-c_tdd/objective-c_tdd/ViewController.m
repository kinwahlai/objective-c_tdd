//
//  ViewController.m
//  objective-c_tdd
//
//  Created by Kin Wah Lai on 8/17/12.
//  Copyright (c) 2012 Kin Wah Lai. All rights reserved.
//

#import "ViewController.h"
#import "QuestionCommunicator.h"
#import "QuestionAnswerBuilder.h"
#import "QuestionAnswerObject.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize gameTitle;
@synthesize gameDesc;
@synthesize activityIndicator;
@synthesize fetchingDesc;
@synthesize question;
@synthesize nextQuestionBtn;
@synthesize giveUpBtn;
@synthesize answer;

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.communicator = [[QuestionCommunicator alloc]init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self fetchQuestion];
}

- (void)viewDidUnload
{
    [self setGameTitle:nil];
    [self setGameDesc:nil];
    [self setActivityIndicator:nil];
    [self setFetchingDesc:nil];
    [self setQuestion:nil];
    [self setAnswer:nil];
    [self setNextQuestionBtn:nil];
    [self setGiveUpBtn:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void)fetchQuestion
{
    [self showActivityIndicatorSection];
    [self hideQuestionSection];
    
    __weak id myself = self;
    [self.communicator setSuccessBlock:^(NSString *__autoreleasing responseString) {
        NSError *error;
        QuestionAnswerBuilder *builder = [[QuestionAnswerBuilder alloc]init];
        self.qaObject = [builder questionAnswerFromJSON:responseString error:&error];
        if (!error && self.qaObject != nil) {
            self.question.text = self.qaObject.questionStr;
            [myself showQuestionSection];
            [myself hideActivityIndicatorSection];
        }
    }];
    [self.communicator setErrorBlock:^(NSError *__autoreleasing error) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Error"
                              message:[error localizedDescription]
                              delegate: nil
                              cancelButtonTitle: @"OK"
                              otherButtonTitles:nil, nil];
        alert.tag = 1;
        [alert show];
    }];
    [self.communicator startAsynchronous];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)hideQuestionSection
{
    self.question.hidden = YES;
    self.answer.hidden = YES;
    self.nextQuestionBtn.hidden = YES;
    self.giveUpBtn.hidden = YES;
}

-(void)showQuestionSection
{
    self.question.hidden = NO;
    self.answer.hidden = NO;
    self.nextQuestionBtn.hidden = NO;
    self.giveUpBtn.hidden = NO;
}

-(void)hideActivityIndicatorSection
{
    [self.activityIndicator stopAnimating];
    self.activityIndicator.hidden = YES;
    self.fetchingDesc.hidden = YES;
}

-(void)showActivityIndicatorSection
{
    self.activityIndicator.hidden = NO;
    self.fetchingDesc.hidden = NO;
    [self.activityIndicator startAnimating];
}

- (IBAction)answerQuestion:(id)sender
{
    if ([self.qaObject verifyAnswer:self.answer.text]) {
        self.answer.text = @"";
        self.communicator = nil;
        self.communicator = [[QuestionCommunicator alloc]init];
        [self fetchQuestion];
    }
}

- (IBAction)iGiveUp:(id)sender
{
    self.answer.text = @"";
    self.communicator = nil;
    self.communicator = [[QuestionCommunicator alloc]init];
    [self fetchQuestion];
}


@end
