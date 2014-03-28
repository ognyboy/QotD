//
//  ViewDetailsViewController.m
//  Question of the Day
//
//  Created by Ogny on 3/24/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import "ViewDetailsViewController.h"

@interface ViewDetailsViewController ()

@end

@implementation ViewDetailsViewController

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
	[self instantiate];
    
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
    
    newFrame = self.viewsuff.frame;
    newFrame.size.height = self.explanationDetail.frame.origin.y + self.explanationDetail.frame.size.height + 10;
    self.viewsuff.frame =newFrame;
    self.scrollStuff.contentSize = CGSizeMake(self.viewsuff.frame.size.width, self.viewsuff.frame.size.height);
}

@end
