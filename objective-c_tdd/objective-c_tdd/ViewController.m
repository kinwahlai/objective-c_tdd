//
//  ViewController.m
//  objective-c_tdd
//
//  Created by Kin Wah Lai on 8/17/12.
//  Copyright (c) 2012 Kin Wah Lai. All rights reserved.
//

#import "ViewController.h"

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
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self hideQuestionSection];
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
