//
//  SubmittedViewController.m
//  Question of the Day
//
//  Created by Ogny on 3/22/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import "SubmittedViewController.h"

@interface SubmittedViewController ()

@end

@implementation SubmittedViewController

-(UserModel *)userModel
{
    if(_userModel == Nil)
    {
        _userModel = [[UserModel alloc] init];
    }
    
    return _userModel;
}

-(QuestionModel *)questionModel
{
    if(_questionModel == Nil)
    {
        _questionModel = [[QuestionModel alloc] init];
    }
    
    return _questionModel;
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
    [self sendAnswer];
    [self.switchExp addTarget:self action:@selector(toggleButton:) forControlEvents:UIControlEventValueChanged];
    [self.homeButton addTarget:self action:@selector(homeBut:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.navigationItem setHidesBackButton:TRUE];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Log out" style:UIBarButtonItemStyleBordered target:self action:@selector(logout:)];
    
    [self instantiateView];
    NSLog(@"%f %f %f %f", self.viewView.frame.origin.y, self.viewView.frame.origin.x, self.viewView.frame.size.height, self.viewView.frame.size.width);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) instantiateView
{
    CGRect newFrame = self.ExplanationLabel.frame;
    newFrame.size.height = 100;
    newFrame.size.width = 300;
    self.ExplanationLabel.frame = newFrame;
    
    [self.explanationTitle setText:@"Hide Explanation"];
    [self.ExplanationLabel setText:[self.questionModel getExplanation]];
    
    newFrame = self.homeButton.frame;
    newFrame.origin.y = self.ExplanationLabel.frame.origin.y + self.ExplanationLabel.frame.size.height+10;
    self.homeButton.frame = newFrame;
    
    
    newFrame = self.viewView.frame;
    newFrame.size.height = self.homeButton.frame.origin.y + self.homeButton.frame.size.height + 10;
    self.viewView.frame =newFrame;
    self.scrollView.contentSize = CGSizeMake(self.viewView.frame.size.width, 500);
    
    newFrame = self.ExplanationLabel.frame;
    newFrame.size.height = 10;
    newFrame.size.width = 10;
    self.ExplanationLabel.frame = newFrame;
    
    [self.explanationTitle setText:@"Show Explanation"];
    [self.ExplanationLabel setText:@""];
    
    newFrame = self.homeButton.frame;
    newFrame.origin.y = self.ExplanationLabel.frame.origin.y + self.ExplanationLabel.frame.size.height+10;
    self.homeButton.frame = newFrame;
    
    
    newFrame = self.viewView.frame;
    newFrame.size.height = self.homeButton.frame.origin.y + 300 + 10;
    self.viewView.frame =newFrame;
    self.scrollView.contentSize = CGSizeMake(self.viewView.frame.size.width, 500);
}

-(void) logout: (id) sender
{
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:YES];
}

-(void) sendAnswer
{
    int correct;
    if([self.answer isEqualToString:[self.questionModel getCorrect]])
    {
        correct = 1;
    }
    else
        correct = 0;
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://cse110.courses.asu.edu/index.php/mobile/dealWithAnswer/%d/%@/%d/%@/%d", [self.userModel getUserID], [self.userModel.listOfSections objectAtIndex:0], [self.questionModel getQuestionID], self.answer, correct]];
    
    NSData *responseData = [NSData dataWithContentsOfURL:url];
    NSString *response = [[NSString alloc] initWithData:responseData encoding:NSASCIIStringEncoding];
    [self.responseText setText:response];
    response = [response substringWithRange:NSMakeRange(1, 1)];
    
    if([response isEqualToString:@"Y"])
    {
        self.retryButton.hidden = TRUE;
    }
    if([response isEqualToString:@"A"])
    {
        if([self.answer isEqualToString:[self.questionModel getCorrect]])
        {
            [self.responseText setText:@"You answered correctly!"];
            self.retryButton.hidden = TRUE;
        }
        else
            [self.responseText setText:@"You answered incorreclty! You may retry"];
    }
    if([response isEqualToString:@"E"])
    {
        self.retryButton.hidden = TRUE;
        //self.switchExp.hidden = true;
        //[self.explanationTitle setText:@""];
    }
    if([response isEqualToString:@"T"])
    {
        self.retryButton.hidden = TRUE;
        //self.switchExp.hidden = true;
        //[self.explanationTitle setText:@""];
    }
    
}

- (IBAction)toggleButton:(id)sender
{
    if([self.switchExp isOn])
    {
        CGRect newFrame = self.ExplanationLabel.frame;
        newFrame.size.height = 100;
        newFrame.size.width = 300;
        self.ExplanationLabel.frame = newFrame;
        
        [self.explanationTitle setText:@"Hide Explanation"];
        [self.ExplanationLabel setText:[self.questionModel getExplanation]];
        
        newFrame = self.homeButton.frame;
        newFrame.origin.y = self.ExplanationLabel.frame.origin.y + self.ExplanationLabel.frame.size.height+10;
        self.homeButton.frame = newFrame;
        
        
        newFrame = self.viewView.frame;
        newFrame.size.height = self.homeButton.frame.origin.y + self.homeButton.frame.size.height + 10;
        self.viewView.frame =newFrame;
        self.scrollView.contentSize = CGSizeMake(self.viewView.frame.size.width, self.viewView.frame.size.height);
    }
    
    if(![self.switchExp isOn])
    {
        
        CGRect newFrame = self.ExplanationLabel.frame;
        newFrame.size.height = 10;
        newFrame.size.width = 10;
        self.ExplanationLabel.frame = newFrame;
        
        [self.explanationTitle setText:@"Show Explanation"];
        [self.ExplanationLabel setText:@""];
        
        newFrame = self.homeButton.frame;
        newFrame.origin.y = self.ExplanationLabel.frame.origin.y + self.ExplanationLabel.frame.size.height+10;
        self.homeButton.frame = newFrame;
        
        
        newFrame = self.viewView.frame;
        newFrame.size.height = self.homeButton.frame.origin.y + self.homeButton.frame.size.height + 10;
        self.viewView.frame =newFrame;
        self.scrollView.contentSize = CGSizeMake(self.viewView.frame.size.width, self.viewView.frame.size.height);
    }
    
}

- (IBAction)retryQuestion:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)homeBut:(id)sender
{
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
}

@end
