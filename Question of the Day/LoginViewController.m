//
//  QotDViewController.m
//  Question of the Day
//
//  Created by Ogny on 3/17/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import "LoginViewController.h"
#import "ResetPassViewController.h"
#import "RegisterViewController.h"
#import "ProfessorHomeViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
    
    UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Message to Graders"
                                                     message:@"As of now there is not a way to register users. Please use my user(ID: dognean, PASS: romania   to test the program. Release 2 will have this option along with a professor side. Thank you! Remember access http://199.180.255.173 before running app. Thanks!"
                                                    delegate:nil
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles:nil];
    [alert2 show];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message to Graders"
                                                    message:@"Please note!\nIf you are grading this from a public network such as ASU you will need to access the API website and click that it is not malicious. The location of the API is on a server without a Domain name, and ASU does not like that and blocks conections. \nTLDR; Please go to http://199.180.255.173 and click it is not malicious. The team will work around this in Project 2. Thank you!"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender
{
    [self.userModel setUserName: self.usernameTextField.text];
    NSString *password = self.passwordTextField.text;

    
    // If one or both fields are blank
    if([self.usernameTextField.text isEqualToString:@""] || [self.passwordTextField.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Empty Fields"
                                                        message:@"Please fill in both fields"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
    else
    {
        // Verify entered password first
        NSString *theURL = [NSString stringWithFormat:@"http://199.180.255.173/index.php/mobile/getPassword/%@/%@", [self.userModel getUserName], password];
        NSURL *url = [NSURL URLWithString:theURL];
        
        NSData *userInfoData = [NSData dataWithContentsOfURL:url];
        NSString *resultData = [[NSString alloc] initWithData:userInfoData encoding: NSUTF8StringEncoding];
        
        // If the password didn't pass, or if user doesn't exist
        if([resultData isEqualToString:@"false"])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Password"
                                                            message:@"The username or password is incorrect"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
        else
        {
            // Log in with username
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://199.180.255.173/index.php/mobile/getUserInfo/%@", [self.userModel getUserName]]];
            
            NSData *userInfoData = [NSData dataWithContentsOfURL:url];
            
            NSString *haha = [[NSString alloc] initWithData:userInfoData encoding:NSUTF8StringEncoding];
            
            NSString *json = [haha substringWithRange:NSMakeRange(1, [haha length]-2)];
            
            userInfoData = [json dataUsingEncoding:NSUTF8StringEncoding];
            
            NSDictionary *userInfoDictionary = [NSJSONSerialization JSONObjectWithData:userInfoData options:kNilOptions error:Nil];
            
            
            [self.userModel setUserName:[[userInfoDictionary valueForKey:@"username"] objectAtIndex:0]];
            [self.userModel setFirstName:[[userInfoDictionary valueForKey:@"firstName"] objectAtIndex:0]];
            [self.userModel setLastName:[[userInfoDictionary valueForKey:@"lastName"] objectAtIndex:0]];
            [self.userModel setEMail:[[userInfoDictionary valueForKey:@"email"] objectAtIndex:0]];
            [self.userModel setUserID:[[[userInfoDictionary valueForKey:@"userID"] objectAtIndex:0] intValue]];
            
            
            
            NSURL *idURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://199.180.255.173/index.php/mobile/isProfessor/%@", [self.userModel getUserName]]];
            
            NSData *userIDData = [NSData dataWithContentsOfURL:idURL];
            NSString *boolcheck = [[NSString alloc] initWithData:userIDData encoding:NSASCIIStringEncoding];
            if([boolcheck isEqualToString:@"false"])
                [self.userModel setUserType:1];
            if([boolcheck isEqualToString:@"true"])
                [self.userModel setUserType:2];
            
            
            for (int i = 0; i< [[userInfoDictionary valueForKey:@"sectionID"] count]; i++)
            {
                [self.userModel.listOfSections addObject:[[userInfoDictionary valueForKey:@"sectionID"] objectAtIndex:i]];
            }
            
            if([self.userModel getUserType] == 1)
                [self performSegueWithIdentifier:@"goStudentHome" sender:self];
            else
                [self performSegueWithIdentifier:@"goProfessorHome" sender:self];
        }
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [segue.identifier isEqualToString:@"goStudentHome"] && [self.userModel getUserType] == 1)   //this is the segue name that you can change from story board.
    {
        
        StudentHomeViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
    }
    if ( [segue.identifier isEqualToString:@"goProfessorHome"] && [self.userModel getUserType] == 2)   //this is the segue name that you can change from story board.
    {
        
        ProfessorHomeViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
    }
    
}

// Make keyboard disappear when clicking outside
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
