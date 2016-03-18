//
//  DetailViewController.m
//  ivprototype
//
//  Created by Juan Cruz Ghigliani on 15/3/16.
//  Copyright (c) 2016 Juan Cruz Ghigliani. All rights reserved.
//

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Imports

#import "DetailViewController.h"
#import "MailTableViewCell.h"
#import "Email.h"
////////////////////////////////////////////////////////////////////////////////
#pragma mark - Types

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Defines & Constants
static NSString *MailCellIdentifier = @"MailTableViewCellId";

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Macros

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private Interface

@interface DetailViewController ()

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private Properties
@property(nonatomic,strong) IBOutlet UITableView *tableView;
@property(nonatomic,strong) IBOutlet UILabel *lblSubject;
@property(nonatomic,strong) NSIndexPath *selectedIndexPath;
@end


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Implementation

@implementation DetailViewController

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Setup & Teardown

- (void)commonInitDetailViewController
{
}

- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        [self commonInitDetailViewController];
    }
    return self;
}

- (id)initWithCoder:(NSCoder*)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self commonInitDetailViewController];
    }
    return self;
}

- (void)dealloc
{
}

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // your code here
}

- (void)viewDidUnload {
	// your code here
    [super viewDidUnload];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // Present fist subject as general subject for the conversation, only for prototyping purpose
    self.lblSubject.text = [(Email*)self.emails[0] subject];
    
    // By default the latest email is selected and fully displayed
    self.selectedIndexPath = [NSIndexPath indexPathForRow:self.emails.count-1 inSection:0];
    
    // Need to be able the cell height  dinamically
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 70.0;

}

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Superclass Overrides

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Custom Accessors

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Public methods

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private methods

- (void)alertWitMessage:(NSString *)message {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Action"
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:nil];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Actions
-(IBAction) popBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)tapReplay:(id)sender {
    [self alertWitMessage:@"TODO: Replay"];
}

- (IBAction)tapForward:(id)sender {
    [self alertWitMessage:@"TODO: Forward"];
}

- (IBAction)tapActions:(id)sender {
    [self alertWitMessage:@"TODO: NavBar Actions"];
}
////////////////////////////////////////////////////////////////////////////////
#pragma mark - UITableViewDataSource Delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.emails count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MailCellIdentifier];
    
    // Configure Cell
    [cell presentEmail:self.emails[indexPath.row]];
    if (indexPath.row == self.selectedIndexPath.row) {
        cell.collapsed = FALSE;
    }else{
        cell.collapsed = TRUE;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row != self.selectedIndexPath.row) {
        // If the user selected a new cell in the, change the collapsed state between old and new selection
        MailTableViewCell *newCell = [self.tableView cellForRowAtIndexPath:indexPath];
        MailTableViewCell *oldCell = [self.tableView cellForRowAtIndexPath:self.selectedIndexPath];
        
        newCell.collapsed = FALSE;
        oldCell.collapsed = TRUE;
    }
    
    // Store new user selection
    self.selectedIndexPath = indexPath;
    
    // Raise an update in the table view to animate the collapse transition
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath compare:self.selectedIndexPath] == NSOrderedSame) {
        // If this cell is selected by the user, the height is dinamic, to display all the content

        // Create a prototype cell, to get the structure and autolayout definition, and use it to get the final height
        static MailTableViewCell *cell = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            cell = [self.tableView dequeueReusableCellWithIdentifier:MailCellIdentifier];
        });
        
        // load data in the prototype cell and update layout
        [cell presentEmail:self.emails[indexPath.row]];
        cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
        [cell layoutIfNeeded];
        
        // Get and return the final height of the prototype cell
        CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingExpandedSize];
        return size.height+10;

    }
    return 70;
}
@end
