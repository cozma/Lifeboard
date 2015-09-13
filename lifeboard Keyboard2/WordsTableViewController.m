//
//  WordsTableViewController.m
//  lifeboard2
//
//  Created by Dag Yeshiwas on 9/12/15.
//  Copyright (c) 2015 Apple, Jordan White, Dag Yeshiwas. All rights reserved.
//

#import "WordsTableViewController.h"

@interface WordsTableViewController ()

@property (nonatomic, strong) NSArray *words;
@property (nonatomic, strong) NSArray *call;
@property (nonatomic, strong) NSArray *menu;
@property (nonatomic, strong) NSArray *send;
@property (nonatomic, strong) NSArray *info;
@property (nonatomic, strong) NSArray *rd;




@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@end

@implementation WordsTableViewController

- (void)segmentedControlWasTapped {
    //printf(self.segmentedControl.selectedSegmentIndex);
    
    
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.words = @[@"Please come to my location. Let me see how long this can get before it's too long.", @"I'm being followed.", @"Please come to my location.", @"Please come to my location."];
    
    self.menu = @[@"Call Help", @"Send Help", @"Information Hotlines", @"Recognize Depression"];
    
    self.call = @[@"Please come to my location. Let me see how long this can get before it's too long.", @"I'm being followed.", @"Please come to my location.", @"Please come to my location."];
    
    self.send = @[@"Test", @"Second message", @"Please come to my location.", @"Please come to my location."];
    
    self.info = @[@"information", @"information message", @"Please come to my location.", @"Please come to my location."];
    
    self.rd = @[@"Everything will be ok.", @"You're not alone.", @"Please come to my location.", @"Please come to my location."];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    
    
    
    [self.segmentedControl addTarget:self action:@selector(segmentedControlWasTapped) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.words count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    if (self.segmentedControl.selectedSegmentIndex == 0){
        self.words = self.call;
    }
    if (self.segmentedControl.selectedSegmentIndex == 1){
        self.words = self.send;
    }
    if (self.segmentedControl.selectedSegmentIndex == 2){
        self.words = self.info;
    }
    if (self.segmentedControl.selectedSegmentIndex == 3){
        self.words = self.rd;
    }
    
    // Configure the cell...
    NSString *str = [self.words objectAtIndex:indexPath.row];
    cell.textLabel.text = str;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.menu[self.segmentedControl.selectedSegmentIndex];
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *string = [self.words objectAtIndex:indexPath.row];
    NSLog(@"%@", string);
    
    [self.textDocumentProxy insertText:string];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
