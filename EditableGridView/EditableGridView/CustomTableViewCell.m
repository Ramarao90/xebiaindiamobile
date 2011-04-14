//
//  CustomTableViewCell.m
//  IMHealthy
//
//  Created by Xebia on 24/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CustomTableViewCell.h"


@implementation CustomTableViewCell
@synthesize leftSideButton=mLeftSideButton;
@synthesize rightSideButton=mRightSideButton;
@synthesize middleSideLabel=mMiddleSideLabel;
@synthesize middleSideButton=mMiddleSideButton;
@synthesize leftSideLabel=mLeftSideLabel;
@synthesize rightSideLabel=mRightSideLabel;
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)dealloc
{
    [mLeftSideButton release];
    [mRightSideButton release];
    [mMiddleSideButton release];
    [mLeftSideLabel release];
    [mRightSideLabel release];
    [mMiddleSideLabel release];
    
    [super dealloc];
}


#pragma mark - View lifecycle


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
