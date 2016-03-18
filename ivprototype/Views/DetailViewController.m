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
    
    self.lblSubject.text = [(Email*)self.emails[0] subject];
    
    self.selectedIndexPath = [NSIndexPath indexPathForRow:self.emails.count-1 inSection:0];
    
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
        MailTableViewCell *newCell = [self.tableView cellForRowAtIndexPath:indexPath];
        MailTableViewCell *oldCell = [self.tableView cellForRowAtIndexPath:self.selectedIndexPath];
        
        newCell.collapsed = FALSE;
        oldCell.collapsed = TRUE;
    }
    
    self.selectedIndexPath = indexPath;
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath compare:self.selectedIndexPath] == NSOrderedSame) {
        static MailTableViewCell *cell = nil;
        static dispatch_once_t onceToken;
        
        dispatch_once(&onceToken, ^{
            cell = [self.tableView dequeueReusableCellWithIdentifier:MailCellIdentifier];
        });
        
        [cell presentEmail:self.emails[indexPath.row]];
        cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
        [cell layoutIfNeeded];
        
        CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingExpandedSize];
        return size.height+10;

    }
    return 70;
}
@end
