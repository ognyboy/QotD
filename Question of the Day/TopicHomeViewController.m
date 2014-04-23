//
//  TopicHomeViewController.m
//  Question of the Day
//
//  Created by Ogny on 4/21/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import "TopicHomeViewController.h"

@interface TopicHomeViewController ()
{
    NSMutableArray *questionsList;
}

@end

@implementation TopicHomeViewController

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
    
    [self instantiateQUestionList];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Log out" style:UIBarButtonItemStyleBordered target:self action:@selector(logout:)];
    self.navigationItem.title = @"Choose Question";
    [self.titleLabel setText:[NSString stringWithFormat:@"Questions for Topic: %@", self.topic]];
    
}

-(void) instantiateQUestionList
{
    NSString *url2 = [NSString stringWithFormat:@"http://199.180.255.173/index.php/mobile/getQuestionStatsByTopic/%@/%@/%d", self.topic, [self.sectionModel getSectionID], [self.userModel getUserID]];
    url2 = [url2 stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    
    NSURL *url = [NSURL URLWithString:url2];
    
    NSData *userInfoData = [NSData dataWithContentsOfURL:url];
    
    NSMutableArray *userInfoDictionary = [NSJSONSerialization JSONObjectWithData:userInfoData options:NSJSONReadingMutableContainers error:Nil];
    
    questionsList = userInfoDictionary;
}

-(void) logout: (id) sender
{
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [questionsList count];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UIButton *button = (UIButton *)[cell viewWithTag:2222];
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:22];
    
    UIImage *with = [UIImage imageNamed:@"rightArrow2.jpeg"];
    [imageView setImage:with];
    
    button.tag = indexPath.row;
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    NSString *test = [NSString stringWithFormat:@"%d. %@", [[[questionsList objectAtIndex:indexPath.row] valueForKey:@"id"] integerValue], [[questionsList objectAtIndex:indexPath.row] valueForKey:@"prompt"]];
    button.titleLabel.numberOfLines = 0;
    
    if([test rangeOfString:@"<br>"].location != NSNotFound)
        test = [test stringByReplacingOccurrencesOfString:@"<br>" withString:@"  "];
    
    [button setTitle:test forState:UIControlStateNormal];
    
    return cell;
    
}

-(void)buttonPressed:(id)sender
{
    UIButton *button = (UIButton *) sender;
    
    NSArray *singleQuestion = [questionsList objectAtIndex:button.tag];
    
    
    [self.questionModel setTopic:[singleQuestion valueForKey:@"topic"]];
    [self.questionModel setPrompt:[singleQuestion valueForKey:@"prompt"]];
    [self.questionModel setA:[singleQuestion valueForKey:@"a"]];
    [self.questionModel setB:[singleQuestion valueForKey:@"b"]];
    [self.questionModel setC:[singleQuestion valueForKey:@"c"]];
    [self.questionModel setD:[singleQuestion valueForKey:@"d"]];
    [self.questionModel setCorrect:[singleQuestion valueForKey:@"correct"]];
    [self.questionModel setHint:[singleQuestion valueForKey:@"hint"]];
    [self.questionModel setExplanation:[singleQuestion valueForKey:@"explanation"]];
    [self.questionModel setQuestionID:[[singleQuestion valueForKey:@"id"] integerValue]];

    [self performSegueWithIdentifier:@"QuestionDet" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [segue.identifier isEqualToString:@"QuestionDet"])   //this is the segue name that you can change from story board.
    {
        
        QuestionDetailViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
        viewCont.sectionModel = self.sectionModel;
        viewCont.questionModel = self.questionModel;
    }
    
}

@end
