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

- (IBAction)newQuestions:(id)sender
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.studentHomeText setText:[NSString stringWithFormat:@"Welcome %@ %@ \nto Section %@.", [self.userModel getFirstName], [self.userModel getLastName], [self.userModel.listOfSections objectAtIndex:0]]];
    
    [self.navigationItem setHidesBackButton:TRUE];
    
    [self newQs];
}

-(void)newQs
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://199.180.255.173/index.php/mobile/getNotAnsweredQuestions/%@/%@/0", [self.userModel getUserName], [self.userModel.listOfSections objectAtIndex:0]]];
    
    NSData *userInfoData = [NSData dataWithContentsOfURL:url];
    
    NSString *string = [[NSString alloc] initWithData:userInfoData encoding:NSASCIIStringEncoding];
    
    [self.theNewLabel setText:string];
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
