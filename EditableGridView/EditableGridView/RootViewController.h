//
//  RootViewController.h
//  EditableGridView
//
//  Created by Xebia on 13/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomTableViewCell;
@interface RootViewController : UITableViewController {
    IBOutlet CustomTableViewCell *customCell;
    NSMutableArray *mArrayOfData;
}
@property(retain)NSMutableArray *arrayOfData;

@end
