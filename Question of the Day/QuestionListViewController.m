//
//  QuestionListViewController.m
//  Question of the Day
//
//  Created by Ogny on 4/23/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import "QuestionListViewController.h"

@interface QuestionListViewController ()
{
    NSMutableArray *questionsList;
    NSMutableArray *checkedList;
    int count;
}

@end

@implementation QuestionListViewController

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
    self.navigationItem.title = @"Add/View Questions";
    
    count = 0;
}

-(void) instantiateQUestionList
{
    NSString *url2 = [NSString stringWithFormat:@"http://199.180.255.173/index.php/mobile/search/%@", self.topic];
    url2 = [url2 stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    
    NSURL *url = [NSURL URLWithString:url2];
    
    NSData *userInfoData = [NSData dataWithContentsOfURL:url];
    
    NSMutableArray *userInfoDictionary = [NSJSONSerialization JSONObjectWithData:userInfoData options:NSJSONReadingMutableContainers error:Nil];
    
    NSMutableArray *uniqueArray = [NSMutableArray array];
    [uniqueArray addObjectsFromArray:[[NSSet setWithArray:userInfoDictionary] allObjects]];
    
    questionsList = userInfoDictionary;
    
    checkedList = [[NSMutableArray alloc] init];
    
    for(int i = 0; i<questionsList.count; i++)
    {
        NSNumber* temp = [NSNumber numberWithInteger:0];
        [checkedList addObject:temp];
    }
  
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

- (IBAction)addQuestions:(id)sender
{
    [self performSegueWithIdentifier:@"SecHome4" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ( [segue.identifier isEqualToString:@"SecHome4"])   //this is the segue name that you can change from story board.
    {
        
        SectionHomeViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
        viewCont.sectionModel = self.sectionModel;
    }
    
    if ( [segue.identifier isEqualToString:@"Qdetail"])   //this is the segue name that you can change from story board.
    {
        ViewDetailsViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
        viewCont.questionModel = self.questionModel;
    }
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
    
    NSLog(@"%@", [[questionsList objectAtIndex:indexPath.row] valueForKey:@"id"]);
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UIButton *button = (UIButton *)[cell viewWithTag:5555];
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:11];
    
    UIButton *button2 = (UIButton *)[cell viewWithTag:9999];
    UIImageView *imageView2 = (UIImageView *)[cell viewWithTag:8888];
    
    UIImage *with = [UIImage imageNamed:@"rightArrow2.jpeg"];
    [imageView setImage:with];
    
    UIImage *checked = [UIImage imageNamed:@"bifat.jpg"];
    UIImage *unchecked = [UIImage imageNamed:@"nebifat.jpg"];
    if([[checkedList objectAtIndex:indexPath.row] integerValue] == 0)
        [imageView2 setImage:unchecked];
    if([[checkedList objectAtIndex:indexPath.row] integerValue] == 1)
        [imageView2 setImage:checked];
    
    button.tag = indexPath.row;
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    button2.tag = indexPath.row;
    [button2 addTarget:self action:@selector(button2Pressed:) forControlEvents:UIControlEventTouchUpInside];
    
    NSString *test = [NSString stringWithFormat:@"%@. %@", [[questionsList objectAtIndex:indexPath.row] valueForKey:@"id"], [[questionsList objectAtIndex:indexPath.row] valueForKey:@"prompt"]];
    button.titleLabel.numberOfLines = 0;
    
    
    if([test rangeOfString:@"<br>"].location != NSNotFound)
        test = [test stringByReplacingOccurrencesOfString:@"<br>" withString:@"  "];
    
    [button setTitle:test forState:UIControlStateNormal];
    
    return cell;
    
}

-(void)buttonPressed:(id)sender {
    
    UIButton *button = (UIButton *) sender;
    
    [self.questionModel setTopic:self.topic];
    [self.questionModel setPrompt:[[questionsList objectAtIndex:button.tag] valueForKey:@"prompt"]];
    [self.questionModel setA:[[questionsList objectAtIndex:button.tag] valueForKey:@"a"]];
    [self.questionModel setB:[[questionsList objectAtIndex:button.tag] valueForKey:@"b"]];
    [self.questionModel setC:[[questionsList objectAtIndex:button.tag] valueForKey:@"c"]];
    [self.questionModel setD:[[questionsList objectAtIndex:button.tag] valueForKey:@"d"]];
    [self.questionModel setCorrect:[[questionsList objectAtIndex:button.tag] valueForKey:@"correct"]];
    [self.questionModel setHint:[[questionsList objectAtIndex:button.tag] valueForKey:@"hint"]];
    [self.questionModel setExplanation:[[questionsList objectAtIndex:button.tag] valueForKey:@"explanation"]];
    [self.questionModel setQuestionID:[[[questionsList objectAtIndex:button.tag] valueForKey:@"id"] integerValue]];
    
    [self performSegueWithIdentifier:@"Qdetail" sender:self];
}

-(void)button2Pressed:(id)sender {
    
    UIButton *button = (UIButton *) sender;
    
    if([[checkedList objectAtIndex:button.tag] integerValue] == 0)
    {
        [checkedList replaceObjectAtIndex:button.tag withObject:[NSNumber numberWithInteger:1]];
    }
    else if([[checkedList objectAtIndex:button.tag] integerValue] == 1)
    {
        [checkedList replaceObjectAtIndex:button.tag withObject:[NSNumber numberWithInteger:0]];
    }
    
    [self.questionsTable reloadData];
}
@end
