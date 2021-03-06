//
//  ViewController.h
//  objective-c_tdd
//
//  Created by Kin Wah Lai on 8/17/12.
//  Copyright (c) 2012 Kin Wah Lai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QuestionCommunicator;
@class QuestionAnswerObject;

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *gameTitle;
@property (weak, nonatomic) IBOutlet UILabel *gameDesc;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *fetchingDesc;

@property (weak, nonatomic) IBOutlet UILabel *question;
@property (weak, nonatomic) IBOutlet UIButton *nextQuestionBtn;
@property (weak, nonatomic) IBOutlet UIButton *giveUpBtn;
@property (weak, nonatomic) IBOutlet UITextField *answer;

@property QuestionCommunicator *communicator;
@property QuestionAnswerObject *qaObject;

-(void)showQuestionSection;
-(void)hideQuestionSection;
-(void)hideActivityIndicatorSection;
-(void)showActivityIndicatorSection;
-(void)fetchQuestion;

- (IBAction)answerQuestion:(id)sender;
- (IBAction)iGiveUp:(id)sender;
@end
