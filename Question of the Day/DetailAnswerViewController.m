//
//  DetailAnswerViewController.m
//  Question of the Day
//
//  Created by Ogny on 3/24/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import "DetailAnswerViewController.h"
#import "AnswerScreenViewController.h"
#import "ViewDetailsViewController.h"

@interface DetailAnswerViewController ()

@end

@implementation DetailAnswerViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [segue.identifier isEqualToString:@"AnswerQuestion"])   //this is the segue name that you can change from story board.
    {
        
        AnswerScreenViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
        viewCont.questionModel = self.questionModel;
    }
    
    if ( [segue.identifier isEqualToString:@"QuestionDetails"])   //this is the segue name that you can change from story board.
    {
        
        ViewDetailsViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
        viewCont.questionModel = self.questionModel;
    }
    
}

@end
