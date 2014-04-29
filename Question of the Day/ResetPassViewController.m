//
//  ResetPassViewController.m
//  Question of the Day
//
//  Created by Ogny on 3/28/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import "ResetPassViewController.h"

@interface ResetPassViewController ()

@end

@implementation ResetPassViewController

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

- (IBAction)submit:(id)sender
{
    NSString *email = self.emailText.text;
    email = [email stringByReplacingOccurrencesOfString:@"@" withString:@"%90"];
    
    // If one or both fields are blank
    if([self.emailText.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Empty Field"
                                                        message:@"Please fill your correct E-mail"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
    else
    {
        NSString *theURL = [NSString stringWithFormat:@"http://cse110.courses.asu.edu/index.php/mobile/requestReset/%@", email];
        NSURL *url = [NSURL URLWithString:theURL];
        
        NSData *userInfoData = [NSData dataWithContentsOfURL:url];
        NSString *resultData = [[NSString alloc] initWithData:userInfoData encoding: NSUTF8StringEncoding];
        
        // If the password didn't pass, or if user doesn't exist
        if([resultData isEqualToString:@"true"])
        {
            [self.updateLabel setText:@"Reset E-mail was sent!\n Please check your Inbox and Spam"];
        }
        else
        {
            [self.updateLabel setText:@"Incorrect E-mail! Try again, use website, or contact your instructor!"];
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
