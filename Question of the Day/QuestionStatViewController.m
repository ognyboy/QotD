//
//  QuestionStatViewController.m
//  Question of the Day
//
//  Created by Ogny on 3/24/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import "QuestionStatViewController.h"
#import "DetailAnswerViewController.h"

@interface QuestionStatViewController ()
{
    NSMutableArray *attemptList;
}

@end

@implementation QuestionStatViewController

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
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Log out" style:UIBarButtonItemStyleBordered target:self action:@selector(logout:)];
    [self instantiateAttemptList];
    NSString *test = [NSString stringWithFormat:@"%d. %@", [self.questionModel getQuestionID], [self.questionModel getPrompt]];
    self.questionBut.titleLabel.numberOfLines = 3;
    
    if([test rangeOfString:@"<br>"].location != NSNotFound)
        test = [test stringByReplacingOccurrencesOfString:@"<br>" withString:@"  "];
    
    [self.questionBut setTitle:test forState:UIControlStateNormal];
    
    if(!attemptList || !attemptList.count)
    {
        self.attemptTableView.hidden = true;
        self.yourAnswer.hidden = true;
        self.correctLabel.hidden = true;
        [self.attempts setText:@"You have not answered this question!"];
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

-(void) instantiateAttemptList
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://199.180.255.173/index.php/mobile/getAttemptsAsStudent/%d/%@/%d", [self.userModel getUserID], [self.userModel.listOfSections objectAtIndex:0], [self.questionModel getQuestionID]]];
    
    NSData *userInfoData = [NSData dataWithContentsOfURL:url];
    
    NSMutableArray *userInfoDictionary = [NSJSONSerialization JSONObjectWithData:userInfoData options:NSJSONReadingMutableContainers error:Nil];
    
    attemptList = userInfoDictionary;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [attemptList count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UILabel *label1 = (UILabel *)[cell viewWithTag:50];
    UILabel *label2 = (UILabel *)[cell viewWithTag:51];
    
    
    NSString *test = [[attemptList objectAtIndex:indexPath.row] valueForKey:@"answer"];
    test = [test uppercaseString];
    
    [label1 setText:test];
    
    int correct = [[[attemptList objectAtIndex:indexPath.row] valueForKey:@"correct"] intValue];
    if(correct == 1)
    {
        [label2 setText:@"Yes"];
    }
    else
        [label2 setText:@"No"];

    
    return cell;
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [segue.identifier isEqualToString:@"PrepareQuestion3"])   //this is the segue name that you can change from story board.
    {
        
        DetailAnswerViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
        viewCont.questionModel = self.questionModel;
    }
    
}

@end
