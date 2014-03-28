//
//  AnswerScreenViewController.m
//  Question of the Day
//
//  Created by Ogny on 3/22/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import "AnswerScreenViewController.h"

@interface AnswerScreenViewController ()
{
    bool aChecked, bChecked, cChecked, dChecked;
}

@end

@implementation AnswerScreenViewController

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
    
    aChecked = true;
    bChecked = false;
    cChecked = false;
    dChecked = false;
    [self dealWithButtons];
    [self initiateLabels];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Log out" style:UIBarButtonItemStyleBordered target:self action:@selector(logout:)];

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
    if ( [segue.identifier isEqualToString:@"SubmittedAnswer"])   //this is the segue name that you can change from story board.
    {
        
        SubmittedViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
        viewCont.questionModel = self.questionModel;
        if(aChecked)
        {
            viewCont.answer = @"a";
        }
        if(bChecked)
        {
            viewCont.answer = @"b";
        }
        if(cChecked)
        {
            viewCont.answer = @"c";
        }
        if(dChecked)
        {
            viewCont.answer = @"d";
        }
    }

}

- (IBAction)aCliecked:(id)sender
{
    aChecked =true;
    bChecked = false;
    cChecked = false;
    dChecked = false;
    [self dealWithButtons];
}

- (IBAction)bClcked:(id)sender
{
    aChecked = false;
    bChecked = true;
    cChecked = false;
    dChecked = false;
    [self dealWithButtons];
}

- (IBAction)cClicked:(id)sender
{
    aChecked = false;
    bChecked = false;
    cChecked = true;
    dChecked = false;
    [self dealWithButtons];
}

- (IBAction)dClicked:(id)sender
{
    aChecked = false;
    bChecked = false;
    cChecked = false;
    dChecked = true;
    [self dealWithButtons];
}

-(void) dealWithButtons
{
    UIImage *checked = [UIImage imageNamed:@"checked.jpg"];
    UIImage *unchecked = [UIImage imageNamed:@"unchecked.jpg"];
    
    if(aChecked)
    {
        [self.aButton setBackgroundImage:checked forState:UIControlStateNormal];
        [self.bButton setBackgroundImage:unchecked forState:UIControlStateNormal];
        [self.cButton setBackgroundImage:unchecked forState:UIControlStateNormal];
        [self.dButton setBackgroundImage:unchecked forState:UIControlStateNormal];
    }
    
    if(bChecked)
    {
        [self.aButton setBackgroundImage:unchecked forState:UIControlStateNormal];
        [self.bButton setBackgroundImage:checked forState:UIControlStateNormal];
        [self.cButton setBackgroundImage:unchecked forState:UIControlStateNormal];
        [self.dButton setBackgroundImage:unchecked forState:UIControlStateNormal];
    }
    
    if(cChecked)
    {
        [self.aButton setBackgroundImage:unchecked forState:UIControlStateNormal];
        [self.bButton setBackgroundImage:unchecked forState:UIControlStateNormal];
        [self.cButton setBackgroundImage:checked forState:UIControlStateNormal];
        [self.dButton setBackgroundImage:unchecked forState:UIControlStateNormal];
    }
    
    if(dChecked)
    {
        [self.aButton setBackgroundImage:unchecked forState:UIControlStateNormal];
        [self.bButton setBackgroundImage:unchecked forState:UIControlStateNormal];
        [self.cButton setBackgroundImage:unchecked forState:UIControlStateNormal];
        [self.dButton setBackgroundImage:checked forState:UIControlStateNormal];
    }
}

-(void) initiateLabels
{
    
    NSString *test = [NSString stringWithFormat:@"%d. %@", [self.questionModel getQuestionID], [self.questionModel getPrompt]];
    if([test rangeOfString:@"<br>"].location != NSNotFound)
        test = [test stringByReplacingOccurrencesOfString:@"<br>" withString:@"  "];
    [self.answerText setText:test];
    [self.answerText sizeToFit];
    
    
    test = [self.questionModel getA];
    if([test rangeOfString:@"<br>"].location != NSNotFound)
        test = [test stringByReplacingOccurrencesOfString:@"<br>" withString:@"  "];
    [self.aAnswer setText:test];
    CGRect newFrame = self.aAnswer.frame;
    newFrame.origin.y = self.answerText.frame.origin.y + self.answerText.frame.size.height+20;
    self.aAnswer.frame = newFrame;
    [self.aAnswer sizeToFit];
    newFrame = self.aButton.frame;
    newFrame.origin.y = self.aAnswer.frame.origin.y;
    self.aButton.frame = newFrame;
    
    test = [self.questionModel getB];
    if([test rangeOfString:@"<br>"].location != NSNotFound)
        test = [test stringByReplacingOccurrencesOfString:@"<br>" withString:@"  "];
    [self.bAnswer setText:test];
    newFrame = self.aAnswer.frame;
    newFrame.origin.y = self.aAnswer.frame.origin.y + self.aAnswer.frame.size.height+20;
    self.bAnswer.frame = newFrame;
    [self.bAnswer sizeToFit];
    newFrame = self.aButton.frame;
    newFrame.origin.y = self.aAnswer.frame.origin.y + self.aAnswer.frame.size.height+20;
    self.bButton.frame = newFrame;
   
    
    test = [self.questionModel getC];
    if([test rangeOfString:@"<br>"].location != NSNotFound)
        test = [test stringByReplacingOccurrencesOfString:@"<br>" withString:@"  "];
    [self.cAnswer setText:test];
    newFrame = self.bAnswer.frame;
    newFrame.origin.y = self.bAnswer.frame.origin.y + self.bAnswer.frame.size.height+20;
    self.cAnswer.frame = newFrame;
    [self.bAnswer sizeToFit];
    newFrame = self.bButton.frame;
    newFrame.origin.y = self.cAnswer.frame.origin.y;
    self.cButton.frame = newFrame;
    
    test = [self.questionModel getD];
    if([test rangeOfString:@"<br>"].location != NSNotFound)
        test = [test stringByReplacingOccurrencesOfString:@"<br>" withString:@"  "];
    [self.dAnswer setText:test];
    newFrame = self.cAnswer.frame;
    newFrame.origin.y = self.cAnswer.frame.origin.y + self.cAnswer.frame.size.height+20;
    self.dAnswer.frame = newFrame;
    [self.dAnswer sizeToFit];
    newFrame = self.cButton.frame;
    newFrame.origin.y = self.dAnswer.frame.origin.y;
    self.dButton.frame = newFrame;
    
    newFrame = self.submit.frame;
    newFrame.origin.y = self.dAnswer.frame.origin.y + self.dAnswer.frame.size.height+20;
    self.submit.frame = newFrame;
    
    
    newFrame = self.viewView.frame;
    newFrame.size.height = self.submit.frame.origin.y + self.submit.frame.size.height + 100;
    self.viewView.frame =newFrame;
    self.scrollView.contentSize = CGSizeMake(self.viewView.frame.size.width, self.viewView.frame.size.height);
}



@end
