//
//  CreateQuestionViewController.m
//  Question of the Day
//
//  Created by Ogny on 4/20/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import "CreateQuestionViewController.h"
#import "SectionHomeViewController.h"

@interface CreateQuestionViewController ()
{
    bool option;
}

@end

@implementation CreateQuestionViewController

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
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Log out" style:UIBarButtonItemStyleBordered target:self action:@selector(logout:)];

    option = false;
    
    CGRect newFrame = self.bottomView.frame;
    newFrame.size.height = self.createButton.frame.origin.y + self.createButton.frame.size.height + 20;
    self.bottomView.frame =newFrame;
    
    self.scrollView.contentSize = CGSizeMake(self.bottomView.frame.size.width, self.bottomView.frame.size.height);
    
    if(![[self.questionModel getTopic] isEqualToString:@""])
    {
        [self.topicField setText:[self.questionModel getTopic]];
    }
    if(![[self.questionModel getPrompt] isEqualToString:@""])
    {
        [self.promptField setText:[self.questionModel getPrompt]];
    }
    if(![[self.questionModel getA] isEqualToString:@""])
    {
        [self.aField setText:[self.questionModel getA]];
    }
    if(![[self.questionModel getB] isEqualToString:@""])
    {
        [self.bField setText:[self.questionModel getB]];
    }
    if(![[self.questionModel getC] isEqualToString:@""])
    {
        [self.cField setText:[self.questionModel getC]];
    }
    if(![[self.questionModel getD] isEqualToString:@""])
    {
        [self.dField setText:[self.questionModel getD]];
    }
    if(![[self.questionModel getCorrect] isEqualToString:@""])
    {
        [self.correctField setText:[self.questionModel getCorrect]];
    }
    if(![[self.questionModel getHint] isEqualToString:@""])
    {
        [self.hintField setText:[self.questionModel getHint]];
    }
    if(![[self.questionModel getExplanation] isEqualToString:@""])
    {
        [self.explanationField setText:[self.questionModel getExplanation]];
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
    if ( [segue.identifier isEqualToString:@"gotoMenu"])   //this is the segue name that you can change from story board.
    {
        
        SectionHomeViewController *viewCont = segue.destinationViewController;
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

- (IBAction)createAction:(id)sender
{
    if([self.promptField.text isEqualToString:@""])
    {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Incorrect Input"
                                                         message:@"Prompt Field is empty"
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
        [alert2 show];
    }
    
    else if([self.topicField.text isEqualToString:@""])
    {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Incorrect Input"
                                                         message:@"Topic Name Field is empty"
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
        [alert2 show];
    }
    
    else if([self.aField.text isEqualToString:@""])
    {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Incorrect Input"
                                                         message:@"A Field is empty"
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
        [alert2 show];
    }
    
    else if([self.bField.text isEqualToString:@""])
    {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Incorrect Input"
                                                         message:@"B Field is empty"
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
        [alert2 show];
    }
    
    else if([self.cField.text isEqualToString:@""])
    {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Incorrect Input"
                                                         message:@"C Field is empty"
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
        [alert2 show];
    }
    
    else if([self.dField.text isEqualToString:@""])
    {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Incorrect Input"
                                                         message:@"D Field is empty"
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
        [alert2 show];
    }
    else if([self.correctField.text isEqualToString:@""])
    {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Incorrect Input"
                                                         message:@"Correct Field is empty"
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
        [alert2 show];
    }
    else if([self.hintField.text isEqualToString:@""])
    {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Incorrect Input"
                                                         message:@"Hint Field is empty"
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
        [alert2 show];
    }
    else if([self.explanationField.text isEqualToString:@""])
    {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Incorrect Input"
                                                         message:@"Explanation Field is empty"
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
        [alert2 show];
    }
    else
    {
        NSString *topic= @"", *prompt = @"", *a= @"", *b= @"", *c= @"", *d= @"", *correct= @"", *hint= @"", *explanation= @"";
        
        topic = [[self.topicField text] stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        prompt = [[self.promptField text] stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        a = [[self.aField text] stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        b = [[self.bField text] stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        c = [[self.cField text] stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        d = [[self.dField text] stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        correct = [[self.correctField text] stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        hint = [[self.hintField text] stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        explanation = [[self.explanationField text] stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        
        if(self.edit)
        {
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://cse110.courses.asu.edu/index.php/mobile/editQuestion/%d/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@", [self.questionModel getQuestionID], topic, prompt, a, b, c, d, correct, hint, explanation, [self.sectionModel getSectionID]]];
            
            NSData *responseData = [NSData dataWithContentsOfURL:url];
            NSString *response = [[NSString alloc] initWithData:responseData encoding:NSASCIIStringEncoding];
            if([response isEqualToString:@""])
            {
                
            }
            
            UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Question Edited"
                                                             message:@"You have successfuly edited the question"
                                                            delegate:nil
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles:nil];
            [alert2 show];

            [self performSegueWithIdentifier:@"gotoMenu" sender:self];
        }
        else
        {
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://cse110.courses.asu.edu/index.php/mobile/createQuestion/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@",  topic, prompt, a, b, c, d, correct, hint, explanation, [self.sectionModel getSectionID]]];
            
            NSData *responseData = [NSData dataWithContentsOfURL:url];
            NSString *response = [[NSString alloc] initWithData:responseData encoding:NSASCIIStringEncoding];
            if([response isEqualToString:@""])
            {
                
            }
            
            UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Question Edited"
                                                             message:@"You have successfuly edited the question"
                                                            delegate:nil
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles:nil];
            [alert2 show];
            
            [self performSegueWithIdentifier:@"gotoMenu" sender:self];
        }
    }

}
@end
