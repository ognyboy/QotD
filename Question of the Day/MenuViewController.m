//
//  MenuViewController.m
//  Question of the Day
//
//  Created by Ogny on 3/21/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import "MenuViewController.h"
#import "ChangePasswordViewController.h"

@interface MenuViewController ()
{
    bool notificationChecked, eMailChecked;
}
@end

@implementation MenuViewController

-(UserModel *)userModel
{
    if(_userModel == Nil)
    {
        _userModel = [[UserModel alloc] init];
    }
    
    return _userModel;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    notificationChecked = false;
    eMailChecked = [self checkEmails];
    [self dealWithButtons];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Log out" style:UIBarButtonItemStyleBordered target:self action:@selector(logout:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(bool)checkEmails
{
    NSURL *boolURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://199.180.255.173/index.php/mobile/emailss/%@", [self.userModel getUserName]]];
    
    NSData *userIDData = [NSData dataWithContentsOfURL:boolURL];
    NSString *boolcheck = [[NSString alloc] initWithData:userIDData encoding:NSASCIIStringEncoding];
    if([boolcheck isEqualToString:@"false"])
        return false;
    if([boolcheck isEqualToString:@"true"])
        return true;
    return false;
}

-(void) logout: (id) sender
{
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:YES];
}

- (IBAction)notifications:(id)sender
{
    if(notificationChecked)
        notificationChecked = false;
    else
        notificationChecked = true;
    [self dealWithButtons];
}

- (IBAction)emails:(id)sender
{
    if(eMailChecked)
        eMailChecked = false;
    else
        eMailChecked = true;
    [self dealWithButtons];
}

- (IBAction)saveSettings:(id)sender
{
    int send = 0;
    if(eMailChecked)
    {
        send = 1;
    }
    else
        send = 0;
    
    NSURL *boolURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://199.180.255.173/index.php/mobile/changeEmailSettings/%@/%d", [self.userModel getUserName], send]];
    NSData *userIDData = [NSData dataWithContentsOfURL:boolURL];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) dealWithButtons
{
    UIImage *checked = [UIImage imageNamed:@"bifat.jpg"];
    UIImage *unchecked = [UIImage imageNamed:@"nebifat.jpg"];
    
    if(notificationChecked)
    {
        [self.notificationButton setBackgroundImage:checked forState:UIControlStateNormal];
    }
    else
        [self.notificationButton setBackgroundImage:unchecked forState:UIControlStateNormal];
    
    if(eMailChecked)
    {
        [self.emailsButton setBackgroundImage:checked forState:UIControlStateNormal];
    }
    else
        [self.emailsButton setBackgroundImage:unchecked forState:UIControlStateNormal];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [segue.identifier isEqualToString:@"ChangePassword"])   //this is the segue name that you can change from story board.
    {
        
        ChangePasswordViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
    }
    
}

@end
