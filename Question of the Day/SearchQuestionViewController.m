//
//  SearchQuestionViewController.m
//  Question of the Day
//
//  Created by Ogny on 4/20/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import "SearchQuestionViewController.h"

@interface SearchQuestionViewController ()
{
    bool option;
}

@end

@implementation SearchQuestionViewController

-(UserModel *)userModel
{
    if(_userModel == Nil)
    {
        _userModel = [[UserModel alloc] init];
    }
    
    return _userModel;
}

-(SectionModel *)sectionModel
{
    if(_sectionModel == Nil)
    {
        _sectionModel = [[SectionModel alloc] init];
    }
    
    return _sectionModel;
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
    
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Log out" style:UIBarButtonItemStyleBordered target:self action:@selector(logout:)];
    
    option = false;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) logout: (id) sender
{
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:YES];
}

- (IBAction)questionsButton:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Select Your Option" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    [alert addButtonWithTitle:@"Create Question"];
    [alert addButtonWithTitle:@"Manage Question"];
    [alert addButtonWithTitle:@"Search Question"];
    [alert addButtonWithTitle:@"Send by Topic"];
    [alert show];
    option = true;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ( [segue.identifier isEqualToString:@"EditRoster"])   //this is the segue name that you can change from story board.
    {
        
        RosterViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
        viewCont.sectionModel = self.sectionModel;
    }
    
    if ( [segue.identifier isEqualToString:@"CreateQuestion"])   //this is the segue name that you can change from story board.
    {
        
        CreateQuestionViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
        viewCont.sectionModel = self.sectionModel;
    }
    
    if ( [segue.identifier isEqualToString:@"ManageQuestion"])   //this is the segue name that you can change from story board.
    {
        
        ManageQuestionViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
        viewCont.sectionModel = self.sectionModel;
    }
    
    if ( [segue.identifier isEqualToString:@"SearchQuestion"])   //this is the segue name that you can change from story board.
    {
        
        SearchQuestionViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
        viewCont.sectionModel = self.sectionModel;
    }
    
    if ( [segue.identifier isEqualToString:@"SendByTopic"])   //this is the segue name that you can change from story board.
    {
        
        SendByTopicViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
        viewCont.sectionModel = self.sectionModel;
    }
    
    if ( [segue.identifier isEqualToString:@"StatsByName"])   //this is the segue name that you can change from story board.
    {
        
        StatsByNameViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
        viewCont.sectionModel = self.sectionModel;
    }
    
    if ( [segue.identifier isEqualToString:@"StatsByTopic"])   //this is the segue name that you can change from story board.
    {
        
        StatsByTopicViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
        viewCont.sectionModel = self.sectionModel;
    }
    
}

- (IBAction)statisticsButton:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Select Your Option" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    [alert addButtonWithTitle:@"Statistics By Name"];
    [alert addButtonWithTitle:@"Statistics By Topic"];
    [alert show];
    option = false;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 1 && option)
        [self performSegueWithIdentifier:@"CreateQuestion" sender:self];
    if(buttonIndex == 2 && option)
        [self performSegueWithIdentifier:@"ManageQuestion" sender:self];
    if(buttonIndex == 3 && option)
        [self performSegueWithIdentifier:@"SearchQuestion" sender:self];
    if(buttonIndex == 4 && option)
        [self performSegueWithIdentifier:@"SendByTopic" sender:self];
    if(buttonIndex == 1 && !option)
        [self performSegueWithIdentifier:@"StatsByName" sender:self];
    if(buttonIndex == 2 && !option)
        [self performSegueWithIdentifier:@"StatsByTopic" sender:self];
}

@end
