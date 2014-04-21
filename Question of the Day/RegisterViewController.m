//
//  RegisterViewController.m
//  Question of the Day
//
//  Created by Ogny on 3/28/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import "RegisterViewController.h"
#import "SelectSectionViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

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
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ( [segue.identifier isEqualToString:@"SelectSection"])   //this is the segue name that you can change from story board.
    {
        
        SelectSectionViewController*viewCont = segue.destinationViewController;
        viewCont.firstName = self.firstName.text;
        viewCont.lastName = self.lastName.text;
        viewCont.email = self.email.text;
        viewCont.username = self.username.text;
        viewCont.password1 = self.password1.text;
        viewCont.password2 = self.password2.text;
    }
    
}

- (void)touchesBegan: (NSSet *) touches withEvent:(UIEvent *)event
{
    // Hides Keyboard after clicking outside of keyboard
    
    [self.view endEditing: YES];
    [super touchesBegan:touches withEvent: event];
}

- (IBAction)valueReturn:(id)sender
{
    [sender resignFirstResponder];
}

- (IBAction)selectSection:(id)sender
{
    if([self.username.text isEqualToString:@""])
    {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Incorrect Input"
                                                         message:@"Username Field is empty"
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
        [alert2 show];
    }
    
    else if([self.firstName.text isEqualToString:@""])
    {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Incorrect Input"
                                                         message:@"First Name Field is empty"
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
        [alert2 show];
    }
    
    else if([self.lastName.text isEqualToString:@""])
    {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Incorrect Input"
                                                         message:@"Last Name Field is empty"
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
        [alert2 show];
    }
    
    else if([self.email.text isEqualToString:@""])
    {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Incorrect Input"
                                                         message:@"E-Mail Field is empty"
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
        [alert2 show];
    }
    
    else if([self.password1.text isEqualToString:@""])
    {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Incorrect Input"
                                                         message:@"Password Field is empty"
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
        [alert2 show];
    }
    
    else if([self.password2.text isEqualToString:@""])
    {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Incorrect Input"
                                                         message:@"Password Field is empty"
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
        [alert2 show];
    }
    else
        [self performSegueWithIdentifier:@"SelectSection" sender:self];
}


@end
