//
//  RootViewController.m
//  EditableGridView
//
//  Created by Xebia on 13/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "CustomTableViewCell.h"
@implementation RootViewController
@synthesize arrayOfData=mArrayOfData;


//setting up sample data to be displayed in grid view
-(NSMutableArray *)setUpData
{

    NSMutableArray *arrayOfSampleData=[NSMutableArray arrayWithObjects:@"burger",@"coffee",@"colddrink",@"cookies",@"juice",@"liquor",@"pizza",@"tea",@"water", nil];
    return arrayOfSampleData;
}
- (void)viewDidLoad
{
    

    self.arrayOfData=[self setUpData];
	self.tableView.separatorColor=[UIColor clearColor];
	self.navigationController.navigationBar.tintColor=[UIColor colorWithRed: 0.21 green:0.46 blue:0.07 alpha:1.0];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.navigationItem.rightBarButtonItem=self.editButtonItem;
    self.parentViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];

    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //if table is in editing mode return number of rows equivalent to number of items
    if (tableView.editing) {
        return self.arrayOfData.count;
    }
    else
    {
        int count=self.arrayOfData.count%3;
        if(count==0)
        {
            return self.arrayOfData.count/3;
        }
        else
        {
            return (self.arrayOfData.count/3) +1;
        }
        
    }
    
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //in editable mode default cells are returned
    if (tableView.editing) {
        static NSString *CellIdentifier = @"Cell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
            UIView *view=[[UIView alloc] init];
            view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
            
            cell.selectedBackgroundView =view;
            [view release];
                   }
        NSString *buttonText=[self.arrayOfData objectAtIndex:indexPath.row];
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];

        cell.textLabel.text=buttonText;
        
        cell.textLabel.backgroundColor = [UIColor clearColor] ;    
        
        cell.detailTextLabel.backgroundColor = [UIColor clearColor] ;
        return cell;
        
    }
    //in grid view custom logic are returned
    else
    {
    static NSString *CellIdentifier = @"Cell1";
    
    CustomTableViewCell *cell = (CustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        [[NSBundle mainBundle] loadNibNamed:@"CustomTableViewCell" owner:self options:nil];
        cell = customCell;
	}
    int arrayCount=self.arrayOfData.count;
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        cell.backgroundColor=[UIColor clearColor];  

        NSString *buttonText=[self.arrayOfData objectAtIndex:((indexPath.row)*3)+0];

    
    [cell.leftSideButton setBackgroundImage:[UIImage imageNamed:buttonText] forState:UIControlStateNormal] ;
    [cell.leftSideButton setContentMode:UIViewContentModeCenter] ;
    cell.leftSideButton.backgroundColor=[UIColor clearColor]; 
    
    
    cell.leftSideLabel.text=buttonText;
    
    if(((indexPath.row)*3)+2<arrayCount)
    {
        
        buttonText=[self.arrayOfData objectAtIndex:((indexPath.row)*3)+1];
        
        [cell.middleSideButton setBackgroundImage:[UIImage imageNamed:buttonText] forState:UIControlStateNormal] ;
        [cell.middleSideButton setContentMode:UIViewContentModeCenter] ;
        cell.middleSideButton.backgroundColor=[UIColor clearColor]; 
        
        cell.middleSideButton.tag = ((indexPath.row)*3)+1 ;
        
        cell.middleSideLabel.text=buttonText;
            
        buttonText=[self.arrayOfData objectAtIndex:((indexPath.row)*3)+2];
        [cell.rightSideButton setBackgroundImage:[UIImage imageNamed:buttonText] forState:UIControlStateNormal] ;
        [cell.rightSideButton setContentMode:UIViewContentModeCenter] ;
        cell.rightSideButton.backgroundColor=[UIColor clearColor]; 

        cell.rightSideButton.tag = ((indexPath.row)*3)+2 ;
        cell.rightSideLabel.textColor = [UIColor colorWithRed:0.16 green:0.47 blue:0.02 alpha:1.0] ;
        
        cell.rightSideLabel.text=buttonText;
        
        
    }
    else if(((indexPath.row)*3)+1<arrayCount)
    {
        
        
        buttonText=[self.arrayOfData objectAtIndex:((indexPath.row)*3)+1];

        [cell.middleSideButton setBackgroundImage:[UIImage imageNamed:buttonText] forState:UIControlStateNormal] ;
        [cell.middleSideButton setContentMode:UIViewContentModeCenter] ;
        cell.middleSideButton.backgroundColor=[UIColor clearColor]; 
        
        cell.middleSideButton.tag = ((indexPath.row)*3)+1 ;
        
        cell.middleSideLabel.text=buttonText;
        
        cell.rightSideButton.hidden=YES;
        cell.rightSideLabel.hidden=YES;
        
    }
    else
    {
        cell.middleSideLabel.hidden=YES;
        cell.middleSideButton.hidden=YES;
        
        cell.rightSideButton.hidden=YES;
        cell.rightSideLabel.hidden=YES;
        
    }
    

  
    return cell;
    }
}
//it is called when table enters in editing mode or leaves editing mode. Here we clear the table and repopulate it
-(void)setEditing:(BOOL)editing animated:(BOOL)animated
{       
    [super setEditing:editing animated:animated];
	

    [self.tableView beginUpdates];
	[self.tableView deleteSections:[NSIndexSet indexSetWithIndex:0 ] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView insertSections:[NSIndexSet indexSetWithIndex:0 ] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.arrayOfData removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {   
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
	*/
}
//height of cells is different in different modes
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {  
	
    if (self.tableView.editing) {
        return 40;
    }
    else
    {
        return 100 ;
    }
    //	return heightOfEachRow ;
}
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{
    [super dealloc];
}

@end
