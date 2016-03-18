//
//  LoginViewController.m
//  ivprototype
//
//  Created by Juan Cruz Ghigliani on 14/3/16.
//  Copyright (c) 2016 Juan Cruz Ghigliani. All rights reserved.
//

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Imports

#import "LoginViewController.h"
#import "EmailFlowManager.h"
#import "NSString+Validator.h"

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Types

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Defines & Constants

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Macros

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private Interface

@interface LoginViewController ()

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private Properties
@property (strong, nonatomic) IBOutlet UITextField *tfEmail;
@property (strong, nonatomic) IBOutlet UITextField *tfPassword;

@end


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Implementation

@implementation LoginViewController

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Setup & Teardown

- (void)commonInitLoginViewController
{
}

- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        [self commonInitLoginViewController];
    }
    return self;
}

- (id)initWithCoder:(NSCoder*)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self commonInitLoginViewController];
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

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Superclass Overrides

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Custom Accessors

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Public methods

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private methods
-(void)displayErrorAlertWithMessage:(NSString *)message{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:nil];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];

}

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Actions

- (IBAction)tapEmailDone:(id)sender {
    [self.tfPassword becomeFirstResponder];
}


- (IBAction)tapLogin:(id)sender {
    
    if (![self.tfEmail.text isValidEmail]) {
        [self.tfEmail becomeFirstResponder];
        [self displayErrorAlertWithMessage:@"Please insert your Email."];
    }else if ([self.tfPassword.text isEqualToString:@""]) {
        [self.tfPassword becomeFirstResponder];
        [self displayErrorAlertWithMessage:@"Please insert your Password."];
    }else{
        [[EmailFlowManager sharedInstance] swithFlowToController:EmailFlowManagerMain];
    }
}

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Delegate methods


@end
