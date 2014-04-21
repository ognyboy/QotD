//
//  QuestionsViewController.m
//  Question of the Day
//
//  Created by Ogny on 3/21/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import "QuestionsViewController.h"
#import "DetailAnswerViewController.h"

@interface QuestionsViewController ()
{
    NSMutableArray *questionList;
}
@end

@implementation QuestionsViewController

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
    
    [self instantiateQuestionList];
    [self.questionsTableView flashScrollIndicators];
    [self.questionsText setText:[NSString stringWithFormat:@"Section %@ Questions", [self.userModel.listOfSections objectAtIndex:0]]];
    
    if(!questionList)
    {
        self.questionsTableView.hidden = true;
        [self.aaaa setText:@"No new questions!"];
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void) logout: (id) sender
{
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:YES];
}

-(void) instantiateQuestionList
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://199.180.255.173/index.php/mobile/getsentQuestions/%@", [self.userModel.listOfSections objectAtIndex:0]]];
    
    NSData *userInfoData = [NSData dataWithContentsOfURL:url];
    
    NSMutableArray *userInfoDictionary = [NSJSONSerialization JSONObjectWithData:userInfoData options:NSJSONReadingMutableContainers error:Nil];
    
    questionList = userInfoDictionary;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [questionList count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UIButton *button = (UIButton *)[cell viewWithTag:5555];
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:105];
    UIImage *with = [UIImage imageNamed:@"rightArrow2.jpeg"];
    [imageView setImage:with];
    
    button.tag = indexPath.row;
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    NSString *test = [NSString stringWithFormat:@"%d. %@", [[[questionList objectAtIndex:indexPath.row] valueForKey:@"id"] intValue], [[questionList objectAtIndex:indexPath.row] valueForKey:@"prompt"]];
    button.titleLabel.numberOfLines = 0;
    
    
    if([test rangeOfString:@"<br>"].location != NSNotFound)
        test = [test stringByReplacingOccurrencesOfString:@"<br>" withString:@"  "];
    
    [button setTitle:test forState:UIControlStateNormal];
    
    return cell;
    
}

-(void)buttonPressed:(id)sender {
    
    UIButton *button = (UIButton *) sender;
    
    NSArray *singleQuestion = [questionList objectAtIndex:button.tag];
    
    
    [self.questionModel setA:[singleQuestion valueForKey:@"a"]];
    [self.questionModel setB:[singleQuestion valueForKey:@"b"]];
    [self.questionModel setC:[singleQuestion valueForKey:@"c"]];
    [self.questionModel setCorrect:[singleQuestion valueForKey:@"correct"]];
    [self.questionModel setD:[singleQuestion valueForKey:@"d"]];
    [self.questionModel setExplanation:[singleQuestion valueForKey:@"explanation"]];
    [self.questionModel setHint:[singleQuestion valueForKey:@"hint"]];
    [self.questionModel setQuestionID:[[singleQuestion valueForKey:@"id"] intValue]];
    [self.questionModel setPrompt:[singleQuestion valueForKey:@"prompt"]];
    [self.questionModel setTopic:[singleQuestion valueForKey:@"topic"]];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [segue.identifier isEqualToString:@"PrepareQuestion"])   //this is the segue name that you can change from story board.
    {
        
        DetailAnswerViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
        viewCont.questionModel = self.questionModel;
    }

}



@end
