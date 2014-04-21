//
//  ChangePasswordViewController.m
//  Question of the Day
//
//  Created by Ogny on 3/28/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import "ChangePasswordViewController.h"

@interface ChangePasswordViewController ()

@end

@implementation ChangePasswordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(UserModel *)userModel
{
    if(_userModel == Nil)
    {
        _userModel = [[UserModel alloc] init];
    }
    
    return _userModel;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Log out" style:UIBarButtonItemStyleBordered target:self action:@selector(logout:)];
}

-(void) logout: (id) sender
{
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)savePassword:(id)sender
{
    NSString *oldPassword = self.oldPassword.text;
    NSString *theNewPassword = self.theNewPassword.text;
    NSString *confirmPassword = self.confirmPassword.text;
    
    
    // If one or both fields are blank
    if([self.oldPassword.text isEqualToString:@""] || [self.theNewPassword.text isEqualToString:@""] ||[self.confirmPassword.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Empty Fields"
                                                        message:@"Please fill all three fields"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
    else if(![theNewPassword isEqualToString:confirmPassword])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Passwords not match"
                                                        message:@"The new and confirm passwords are not the same!"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
    else
    {
        // Verify entered password first
        NSString *theURL = [NSString stringWithFormat:@"http://199.180.255.173/index.php/mobile/getPassword/%@/%@", [self.userModel getUserName], oldPassword];
        NSURL *url = [NSURL URLWithString:theURL];
        
        NSData *userInfoData = [NSData dataWithContentsOfURL:url];
        NSString *resultData = [[NSString alloc] initWithData:userInfoData encoding: NSUTF8StringEncoding];
        
        // If the password didn't pass, or if user doesn't exist
        if([resultData isEqualToString:@"false"])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Old Password"
                                                            message:@"The old password is incorrect!"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
        else
        {
            // Log in with username
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://199.180.255.173/index.php/mobile/updatePassword/%@/%@", [self.userModel getUserName], theNewPassword]];
            
            NSData *userInfoData = [NSData dataWithContentsOfURL:url];
            if(userInfoData == 0)
            {
                
            }
            [self.navigationController popViewControllerAnimated:YES];
            
        }
    }
}

- (void)touchesBegan: (NSSet *) touches withEvent:(UIEvent *)event
{
    // Hides Keyboard after clicking outside of keyboard
    
    [self.view endEditing: YES];
    [super touchesBegan:touches withEvent: event];
}

-(IBAction)valueReturn:(id)sender
{
    [sender resignFirstResponder];
}

@end
