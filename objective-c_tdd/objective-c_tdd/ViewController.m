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
    [self hideQuestionSection];
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
    [self.communicator setSuccessBlock:^(NSString *__autoreleasing responseString) {
        NSError *error;
        QuestionAnswerBuilder *builder = [[QuestionAnswerBuilder alloc]init];
        self.qaObject = [builder questionAnswerFromJSON:responseString error:&error];
        if (!error && self.qaObject != nil) {
            
        }
    }];
    [self.communicator setErrorBlock:^(NSError *__autoreleasing error) {
        
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
@end
