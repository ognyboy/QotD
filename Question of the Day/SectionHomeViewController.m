//
//  SectionHomeViewController.m
//  Question of the Day
//
//  Created by Ogny on 4/14/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import "SectionHomeViewController.h"

@interface SectionHomeViewController ()
{
    bool option;
}
@end

@implementation SectionHomeViewController

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
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Log out" style:UIBarButtonItemStyleBordered target:self action:@selector(logout:)];
    
    [self.titleLabel setText:[NSString stringWithFormat:@"Section %@", [self.sectionModel getSectionID]]];
    
    [self instantiateDetails];
    option = false;
}

-(void) instantiateDetails
{
    [self.courseLabel setText:[self.sectionModel getTitle]];
    [self.codeLabel setText:[self.sectionModel getCourseID]];
    [self.sectionLabel setText:[self.sectionModel getSectionID]];
    [self.professorLabel setText:[NSString stringWithFormat:@"%d", [self.sectionModel getProfessorID]]];
    
    NSString *meetTimes = [[NSString alloc] init];
    
    if([self.sectionModel getMeetMonday] == 1)
    {
        meetTimes = [meetTimes stringByAppendingString:@"M"];
    }
    if([self.sectionModel getMeetTuesday] == 1)
    {
        meetTimes = [meetTimes stringByAppendingString:@"Tu"];
    }
    if([self.sectionModel getMeetWednesday] == 1)
    {
        meetTimes = [meetTimes stringByAppendingString:@"W"];
    }
    if([self.sectionModel getMeetThursday] == 1)
    {
        meetTimes = [meetTimes stringByAppendingString:@"Th"];
    }
    if([self.sectionModel getMeetFriday] == 1)
    {
        meetTimes = [meetTimes stringByAppendingString:@"F"];
    }
    if([self.sectionModel getMeetSatruday] == 1)
    {
        meetTimes = [meetTimes stringByAppendingString:@"Sa"];
    }
    if([self.sectionModel getMeetSunday] == 1)
    {
        meetTimes = [meetTimes stringByAppendingString:@"Su"];
    }
    
    if([meetTimes isEqualToString:@""])
    {
        meetTimes = @"Class doesn't meet";
    }
    
    [self.meetLabel setText:meetTimes];
    [self.semesterLabel setText:[self.sectionModel getSemester]];
    [self.timeLimit setText:[NSString stringWithFormat:@"%d days", [self.sectionModel getTimeLimit]]];
    
    if([self.sectionModel getSendToProf] == 1)
    {
        [self.sendProf setText:@"Yes"];
    }
    else
    {
        [self.sendProf setText:@"No"];
    }
    
    if([self.sectionModel getSendingQuestions] == 1)
    {
        [self.sendQuestion setText:@"Yes"];
    }
    else
    {
        [self.sendQuestion setText:@"No"];
    }
    
    if([self.sectionModel getCanDrop] == 1)
    {
        [self.dropSecion setText:@"Yes"];
    }
    else
    {
        [self.dropSecion setText:@"No"];
    }
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [segue.identifier isEqualToString:@"EditCourseProperties"])   //this is the segue name that you can change from story board.
    {
        
        CoursePropertiesViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
        viewCont.sectionModel = self.sectionModel;
    }
    
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
        viewCont.edit = false;
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
