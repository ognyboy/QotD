//
//  QuestionDetailViewController.m
//  Question of the Day
//
//  Created by Ogny on 4/21/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import "QuestionDetailViewController.h"
#import "CreateQuestionViewController.h"
#import "SectionHomeViewController.h"

@interface QuestionDetailViewController ()

@end

@implementation QuestionDetailViewController

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
    self.navigationItem.title = @"Question Details";
    [self instantiate];
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

-(void) instantiate
{
    [self.titleDetail setText:[NSString stringWithFormat:@"Details for #%d:", [self.questionModel getQuestionID]]];
    
    NSString *temp = [NSString stringWithFormat:@"%@", [self.questionModel getTopic]];
    if([temp rangeOfString:@"<br>"].location != NSNotFound)
        temp = [temp stringByReplacingOccurrencesOfString:@"<br>" withString:@"  "];
    [self.topicDetail setText:temp];
    
    temp = [NSString stringWithFormat:@"%@", [self.questionModel getPrompt]];
    if([temp rangeOfString:@"<br>"].location != NSNotFound)
        temp = [temp stringByReplacingOccurrencesOfString:@"<br>" withString:@"  "];
    [self.promptDetail setText:temp];
    CGRect newFrame = self.topicDetail.frame;
    newFrame.origin.y = self.topicDetail.frame.origin.y + self.topicDetail.frame.size.height+10;
    self.promptDetail.frame = newFrame;
    newFrame = self.t.frame;
    newFrame.origin.y = self.t.frame.origin.y + self.topicDetail.frame.size.height +10;
    self.p.frame = newFrame;
    [self.promptDetail sizeToFit];
    [self.p sizeToFit];
    
    
    temp = [NSString stringWithFormat:@"%@", [self.questionModel getA]];
    if([temp rangeOfString:@"<br>"].location != NSNotFound)
        temp = [temp stringByReplacingOccurrencesOfString:@"<br>" withString:@"  "];
    [self.aDetail setText:temp];
    newFrame = self.promptDetail.frame;
    newFrame.origin.y = self.promptDetail.frame.origin.y + self.promptDetail.frame.size.height+10;
    self.aDetail.frame = newFrame;
    newFrame = self.p.frame;
    newFrame.origin.y = self.p.frame.origin.y + self.promptDetail.frame.size.height+10;
    self.a.frame = newFrame;
    [self.aDetail sizeToFit];
    [self.a sizeToFit];
    
    
    temp = [NSString stringWithFormat:@"%@", [self.questionModel getB]];
    if([temp rangeOfString:@"<br>"].location != NSNotFound)
        temp = [temp stringByReplacingOccurrencesOfString:@"<br>" withString:@"  "];
    [self.bDetail setText:temp];
    newFrame = self.aDetail.frame;
    newFrame.origin.y = self.aDetail.frame.origin.y + self.aDetail.frame.size.height+10;
    newFrame.size.width = self.promptDetail.frame.size.width;
    self.bDetail.frame = newFrame;
    newFrame = self.a.frame;
    newFrame.origin.y = self.a.frame.origin.y + self.aDetail.frame.size.height+10;
    self.b.frame = newFrame;
    [self.bDetail sizeToFit];
    [self.b sizeToFit];
    
    
    temp = [NSString stringWithFormat:@"%@", [self.questionModel getC]];
    if([temp rangeOfString:@"<br>"].location != NSNotFound)
        temp = [temp stringByReplacingOccurrencesOfString:@"<br>" withString:@"  "];
    [self.cDetail setText:temp];
    newFrame = self.bDetail.frame;
    newFrame.origin.y = self.bDetail.frame.origin.y + self.bDetail.frame.size.height+10;
    newFrame.size.width = self.promptDetail.frame.size.width;
    self.cDetail.frame = newFrame;
    newFrame = self.b.frame;
    newFrame.origin.y = self.b.frame.origin.y + self.bDetail.frame.size.height+10;
    self.c.frame = newFrame;
    [self.cDetail sizeToFit];
    [self.c sizeToFit];
    
    
    temp = [NSString stringWithFormat:@"%@", [self.questionModel getD]];
    if([temp rangeOfString:@"<br>"].location != NSNotFound)
        temp = [temp stringByReplacingOccurrencesOfString:@"<br>" withString:@"  "];
    [self.dDetail setText:temp];
    newFrame = self.cDetail.frame;
    newFrame.origin.y = self.cDetail.frame.origin.y + self.cDetail.frame.size.height+10;
    newFrame.size.width = self.promptDetail.frame.size.width;
    self.dDetail.frame = newFrame;
    newFrame = self.c.frame;
    newFrame.origin.y = self.c.frame.origin.y + self.cDetail.frame.size.height+10;
    self.d.frame = newFrame;
    [self.dDetail sizeToFit];
    [self.d sizeToFit];
    
    
    temp = [NSString stringWithFormat:@"%@", [self.questionModel getCorrect]];
    if([temp rangeOfString:@"<br>"].location != NSNotFound)
        temp = [temp stringByReplacingOccurrencesOfString:@"<br>" withString:@"  "];
    [self.correctDetail setText:temp];
    newFrame = self.dDetail.frame;
    newFrame.origin.y = self.dDetail.frame.origin.y + self.dDetail.frame.size.height+10;
    newFrame.size.width = self.promptDetail.frame.size.width;
    self.correctDetail.frame = newFrame;
    newFrame = self.d.frame;
    newFrame.origin.y = self.d.frame.origin.y + self.dDetail.frame.size.height+10;
    self.co.frame = newFrame;
    [self.correctDetail sizeToFit];
    [self.co sizeToFit];
    
    
    temp = [NSString stringWithFormat:@"%@", [self.questionModel getHint]];
    if([temp rangeOfString:@"<br>"].location != NSNotFound)
        temp = [temp stringByReplacingOccurrencesOfString:@"<br>" withString:@"  "];
    [self.hintDetail setText:temp];
    newFrame = self.correctDetail.frame;
    newFrame.origin.y = self.correctDetail.frame.origin.y + self.correctDetail.frame.size.height+10;
    newFrame.size.width = self.promptDetail.frame.size.width;
    self.hintDetail.frame = newFrame;
    newFrame = self.co.frame;
    newFrame.origin.y = self.co.frame.origin.y + self.correctDetail.frame.size.height+10;
    self.hi.frame = newFrame;
    [self.hintDetail sizeToFit];
    [self.hi sizeToFit];
    
    if([[self.hintDetail text] isEqualToString:@""])
    {
        temp = [NSString stringWithFormat:@"%@", [self.questionModel getExplanation]];
        if([temp rangeOfString:@"<br>"].location != NSNotFound)
            temp = [temp stringByReplacingOccurrencesOfString:@"<br>" withString:@"  "];
        [self.explanationDetail setText:temp];
        newFrame = self.hintDetail.frame;
        newFrame.origin.y = self.hi.frame.origin.y + self.hi.frame.size.height+10;
        newFrame.size.width = self.promptDetail.frame.size.width;
        self.explanationDetail.frame = newFrame;
        newFrame = self.hi.frame;
        newFrame.origin.y = self.hi.frame.origin.y + self.hi.frame.size.height+10;
        self.e.frame = newFrame;
        [self.explanationDetail sizeToFit];
        [self.e sizeToFit];
    }
    else{
    temp = [NSString stringWithFormat:@"%@", [self.questionModel getExplanation]];
    if([temp rangeOfString:@"<br>"].location != NSNotFound)
        temp = [temp stringByReplacingOccurrencesOfString:@"<br>" withString:@"  "];
    [self.explanationDetail setText:temp];
    newFrame = self.hintDetail.frame;
    newFrame.origin.y = self.hintDetail.frame.origin.y + self.hintDetail.frame.size.height+10;
    newFrame.size.width = self.promptDetail.frame.size.width;
    self.explanationDetail.frame = newFrame;
    newFrame = self.hi.frame;
    newFrame.origin.y = self.hi.frame.origin.y + self.hintDetail.frame.size.height+10;
    self.e.frame = newFrame;
    [self.explanationDetail sizeToFit];
    [self.e sizeToFit];
    }
    
    newFrame = self.editButton.frame;
    newFrame.origin.y = self.explanationDetail.frame.origin.y + self.explanationDetail.frame.size.height+20;
    newFrame.origin.x = 40;
    self.editButton.frame = newFrame;
    
    newFrame = self.deleteButton.frame;
    newFrame.origin.y = self.editButton.frame.origin.y;
    newFrame.origin.x = self.editButton.frame.origin.x + 100;
    self.deleteButton.frame = newFrame;
    
    newFrame = self.bottomView.frame;
    newFrame.size.height = self.editButton.frame.origin.y + self.editButton.frame.size.height + 20;
    self.bottomView.frame =newFrame;
    
    self.scrollStuff.contentSize = CGSizeMake(self.bottomView.frame.size.width, self.bottomView.frame.size.height);
}

- (IBAction)editButton:(id)sender
{
    [self performSegueWithIdentifier:@"CreateQ" sender:self];
}

- (IBAction)deleteButton:(id)sender
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://cse110.courses.asu.edu/index.php/mobile/removeQuestion/%@/%d", [self.sectionModel getSectionID], [self.questionModel getQuestionID]]];
    
    NSData *responseData = [NSData dataWithContentsOfURL:url];
    NSString *response = [[NSString alloc] initWithData:responseData encoding:NSASCIIStringEncoding];
    if([response isEqualToString:@""])
        {
            
        }
    [self performSegueWithIdentifier:@"SecHome" sender:self];
    
    UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Question Removed"
                                                     message:@"THe quesion has been removed from this section!"
                                                    delegate:nil
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles:nil];
    [alert2 show];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [segue.identifier isEqualToString:@"CreateQ"])   //this is the segue name that you can change from story board.
    {
        CreateQuestionViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
        viewCont.sectionModel = self.sectionModel;
        viewCont.questionModel = self.questionModel;
        viewCont.edit = true;
    }
    
    if ( [segue.identifier isEqualToString:@"SecHome"])   //this is the segue name that you can change from story board.
    {
        SectionHomeViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
        viewCont.sectionModel = self.sectionModel;
    }
    
}
@end
