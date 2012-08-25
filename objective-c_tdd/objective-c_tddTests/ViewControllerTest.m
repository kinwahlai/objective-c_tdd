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



@end
