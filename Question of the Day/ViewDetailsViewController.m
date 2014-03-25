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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) instantiate
{
    [self.titleDetail setText:[NSString stringWithFormat:@"Details for #%d:", [self.questionModel getQuestionID]]];
    
    [self.topicDetail setText:[self.questionModel getTopic]];
    [self.promptDetail setText:[self.questionModel getPrompt]];
    [self.aDetail setText:[self.questionModel getA]];
    [self.bDetail setText:[self.questionModel getB]];
    [self.cDetail setText:[self.questionModel getC]];
    [self.dDetail setText:[self.questionModel getD]];
    [self.correctDetail setText:[self.questionModel getCorrect]];
    [self.hintDetail setText:[self.questionModel getHint]];
    [self.explanationDetail setText:[self.questionModel getExplanation]];    
    
}

@end
