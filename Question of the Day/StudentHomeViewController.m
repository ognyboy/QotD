//
//  StudentHomeViewController.m
//  Question of the Day
//
//  Created by Ogny on 3/20/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import "StudentHomeViewController.h"

@interface StudentHomeViewController ()

@end

@implementation StudentHomeViewController

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
	// Do any additional setup after loading the view.
    
    [self.studentHomeText setText:[NSString stringWithFormat:@"Welcome %@ %@ \nto Section %@.", [self.userModel getFirstName], [self.userModel getLastName], [self.userModel.listOfSections objectAtIndex:0]]];
    
    [self.navigationItem setHidesBackButton:TRUE];
    
    [self newQs];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Log out" style:UIBarButtonItemStyleBordered target:self action:@selector(logout:)];
}

-(void)newQs
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://cse110.courses.asu.edu/index.php/mobile/getNotAnsweredQuestions/%@/%@/0", [self.userModel getUserName], [self.userModel.listOfSections objectAtIndex:0]]];
    
    NSData *userInfoData = [NSData dataWithContentsOfURL:url];
    
    NSString *string = [[NSString alloc] initWithData:userInfoData encoding:NSASCIIStringEncoding];
    
    [self.theNewLabel setText:string];
}

-(void) logout: (id) sender
{
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [segue.identifier isEqualToString:@"QuestionsSegue"])   //this is the segue name that you can change from story board.
    {
        
        QuestionsViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
    }
    
    if ( [segue.identifier isEqualToString:@"StatisticsSegue"])   //this is the segue name that you can change from story board.
    {
        
        StatisticsViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
    }
    
    if ( [segue.identifier isEqualToString:@"MenuSegue"])   //this is the segue name that you can change from story board.
    {
        
        MenuViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
    }
    
    if ( [segue.identifier isEqualToString:@"NewQuestions"])   //this is the segue name that you can change from story board.
    {
        NewQuestionsViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
    }
}

@end
