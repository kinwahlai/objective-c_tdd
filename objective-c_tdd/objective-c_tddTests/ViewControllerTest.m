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

@implementation ViewControllerTest
-(void)setUp
{
    [super setUp];
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

-(void) testViewControllerHasFetchingQuestionsIndicator
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

@end
