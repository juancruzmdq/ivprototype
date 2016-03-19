//
//  InboxViewController.m
//  ivprototype
//
//  Created by Juan Cruz Ghigliani on 14/3/16.
//  Copyright (c) 2016 Juan Cruz Ghigliani. All rights reserved.
//

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Imports

#import "InboxViewController.h"
#import "EmailService.h"
#import "Inbox.h"
#import "InboxTableViewCell.h"
#import "DetailViewController.h"
#import "EmailFlowManager.h"
#import "ReallySimpleProgress.h"

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Types

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Defines & Constants
static NSString *InboxCellIdentifier = @"InboxTableViewCellId";

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Macros

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private Interface

@interface InboxViewController () <UITableViewDataSource,UITableViewDelegate>

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private Properties
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet NSDictionary *groupedInbox;
@property (strong, nonatomic) IBOutlet NSDictionary *filterInbox;
@property (strong, nonatomic) IBOutlet UITextField *tfSearch;

@end


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Implementation

@implementation InboxViewController

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Setup & Teardown

- (void)commonInitInboxViewController
{
    self.title = @"Inbox";
}

- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        [self commonInitInboxViewController];
    }
    return self;
}

- (id)initWithCoder:(NSCoder*)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self commonInitInboxViewController];
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
    
}

- (void)viewDidUnload {
	// your code here
    [super viewDidUnload];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    // Only for the prototype, search inbox if the current inbox is empty
    if (!self.groupedInbox) {
        ReallySimpleProgress *loading = [ReallySimpleProgress progressWithTitle:@"Getting Inbox"];
        [self presentViewController:loading animated:NO completion:nil];
        
        // Retrieve Emails. from remote service, and display conversations
        [[EmailService sharedInstance] getInboxOnSuccess:^(Inbox * inbox) {
            self.groupedInbox = [inbox groupedEmail];
            self.filterInbox = self.groupedInbox;
            [self.tableView reloadData];
            [loading dismissViewControllerAnimated:YES completion:nil];
        } onFailure:^(NSError * error) {
            NSLog(@"error: %@",error);
            [loading dismissViewControllerAnimated:YES completion:nil];
        }];
    }
    
    
    
}

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Superclass Overrides

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"detail"]){
        DetailViewController *detail = segue.destinationViewController;
        NSIndexPath *selectedRowIndex = [self.tableView indexPathForSelectedRow];
        detail.emails = self.filterInbox.allValues[selectedRowIndex.row];
    }
}
////////////////////////////////////////////////////////////////////////////////
#pragma mark - Custom Accessors

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Public methods

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private methods

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Actions

-(IBAction)searchChange:(id)sender{
    NSLog(@"Filter: %@",self.tfSearch.text);
    
    if ([self.tfSearch.text isEqualToString:@""]) {
        self.filterInbox = self.groupedInbox;
    }else{
        // Simulate search, only display de fist conversation of the inbox
        if (self.groupedInbox.allKeys > 0) {
            id fistKey = self.groupedInbox.allKeys[0];
            self.filterInbox = @{fistKey:self.groupedInbox[fistKey]};
        }else{
            self.filterInbox = self.groupedInbox;
        }
    }
    [self.tableView reloadData];
}

-(IBAction)tapDrawerButton:(id)sender{
    // Show/Hide left menu
    [[[EmailFlowManager sharedInstance] drawerViewController] toggleDrawer];
}

- (IBAction)tapCreate:(id)sender {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Action"
                                                                   message:@"TODO: Create Mail"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:nil];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
   
}
////////////////////////////////////////////////////////////////////////////////
#pragma mark - UITableViewDataSource Delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.filterInbox.allKeys count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    InboxTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:InboxCellIdentifier];
    
    
    // Configure Cell
    [cell presentEmails:self.filterInbox.allValues[indexPath.row]];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
