//
//  NewQuestionsViewController.m
//  Question of the Day
//
//  Created by Ogny on 3/22/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import "NewQuestionsViewController.h"
#import "DetailAnswerViewController.h"

@interface NewQuestionsViewController ()
{
    NSMutableArray *questionList;
}

@end

@implementation NewQuestionsViewController

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
    [self instantiateQuestionList];
    [self.questionsTablew flashScrollIndicators];
    [self.questionsLabel setText:[NSString stringWithFormat:@"Section %@ Questions", [self.userModel.listOfSections objectAtIndex:0]]];
    if(!questionList || !questionList.count)
    {
        self.questionsTablew.hidden = true;
        [self.aaaa setText:@"No new questions!"];
    }
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Log out" style:UIBarButtonItemStyleBordered target:self action:@selector(logout:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) instantiateQuestionList
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://cse110.courses.asu.edu/index.php/mobile/getNotAnsweredQuestions/%@/%@/1", [self.userModel getUserName], [self.userModel.listOfSections objectAtIndex:0]]];
    
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

-(void) logout: (id) sender
{
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:YES];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UIButton *button = (UIButton *)[cell viewWithTag:5555];
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:11];
    
    UIImage *with = [UIImage imageNamed:@"rightArrow2.jpeg"];
    [imageView setImage:with];
    
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    NSString *test = [NSString stringWithFormat:@"%d. %@", [[[questionList objectAtIndex:indexPath.row] valueForKey:@"id"] intValue], [[questionList objectAtIndex:indexPath.row] valueForKey:@"prompt"]];
    button.titleLabel.numberOfLines = 0;
    
    
    if([test rangeOfString:@"<br>"].location != NSNotFound)
        test = [test stringByReplacingOccurrencesOfString:@"<br>" withString:@"  "];
    
    [button setTitle:test forState:UIControlStateNormal];
    
    return cell;
    
}

-(int) indexForButtonTitle: (NSString *) string
{
    __block int index = 0;
    NSString *temp = string;
    
    //this returns the string that holds the i
    temp = [[temp componentsSeparatedByString:@"."] objectAtIndex:0];
    
    [questionList enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if([[obj valueForKey:@"id"] isEqualToString:temp])
        {
            index = idx;
            *stop = YES;
        }
    }];
    
    return index;
}

-(void)buttonPressed:(id)sender {
    
    UIButton *button = (UIButton *) sender;
    int index = [self indexForButtonTitle:button.titleLabel.text];
    NSArray *singleQuestion = [questionList objectAtIndex:index];
    
    
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
    if ( [segue.identifier isEqualToString:@"PrepareQuestion2"])   //this is the segue name that you can change from story board.
    {
        
        DetailAnswerViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
        viewCont.questionModel = self.questionModel;
    }
    
}

@end
