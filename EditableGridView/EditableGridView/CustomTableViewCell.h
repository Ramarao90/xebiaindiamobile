//
//  CustomTableViewCell.h
//  IMHealthy
//
//  Created by Xebia on 24/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CustomTableViewCell : UITableViewCell {
    IBOutlet UIButton *mLeftSideButton;
    IBOutlet UIButton *mMiddleSideButton;

    IBOutlet UIButton *mRightSideButton;
    IBOutlet UILabel *mLeftSideLabel;
    IBOutlet UILabel *mMiddleSideLabel;

    IBOutlet UILabel *mRightSideLabel;

}
@property (retain)UIButton *leftSideButton;
@property (retain)UIButton *middleSideButton;
@property (retain)UIButton *rightSideButton;
@property (retain)UILabel *leftSideLabel;
@property (retain)UILabel *middleSideLabel;
@property (retain)UILabel *rightSideLabel;

@end
