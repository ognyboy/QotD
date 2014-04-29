//
//  SendByTopicViewController.m
//  Question of the Day
//
//  Created by Ogny on 4/20/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import "SendByTopicViewController.h"

@interface SendByTopicViewController ()
{
    bool option;
    NSMutableArray *topicList;
    NSString *topic;
}

@end

@implementation SendByTopicViewController

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
    
    [self instantiateTopicList];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Log out" style:UIBarButtonItemStyleBordered target:self action:@selector(logout:)];
    
    option = false;
}

-(void)instantiateTopicList
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://cse110.courses.asu.edu/index.php/mobile/getTopics/%@", [self.sectionModel getSectionID]]];
    
    NSData *userInfoData = [NSData dataWithContentsOfURL:url];
    
    NSMutableArray *userInfoDictionary = [NSJSONSerialization JSONObjectWithData:userInfoData options:NSJSONReadingMutableContainers error:Nil];
    
    topicList = userInfoDictionary;
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
    
    if ( [segue.identifier isEqualToString:@"EditRoster"])   //this is the segue name that you can change from story board.
    {
        
        RosterViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
        viewCont.sectionModel = self.sectionModel;
    }
    
    if ( [segue.identifier isEqualToString:@"CreateQuestion"])   //this is the segue name that you can change from story board.
    {
        
        CreateQuestionViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
        viewCont.sectionModel = self.sectionModel;
        viewCont.edit = false;
    }
    
    if ( [segue.identifier isEqualToString:@"ManageQuestion"])   //this is the segue name that you can change from story board.
    {
        
        ManageQuestionViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
        viewCont.sectionModel = self.sectionModel;
    }
    
    if ( [segue.identifier isEqualToString:@"SearchQuestion"])   //this is the segue name that you can change from story board.
    {
        
        SearchQuestionViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
        viewCont.sectionModel = self.sectionModel;
    }
    
    if ( [segue.identifier isEqualToString:@"SendByTopic"])   //this is the segue name that you can change from story board.
    {
        
        SendByTopicViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
        viewCont.sectionModel = self.sectionModel;
    }
    
    if ( [segue.identifier isEqualToString:@"StatsByName"])   //this is the segue name that you can change from story board.
    {
        
        StatsByNameViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
        viewCont.sectionModel = self.sectionModel;
    }
    
    if ( [segue.identifier isEqualToString:@"StatsByTopic"])   //this is the segue name that you can change from story board.
    {
        
        StatsByTopicViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
        viewCont.sectionModel = self.sectionModel;
    }
    
    if ( [segue.identifier isEqualToString:@"TopicHome2"])   //this is the segue name that you can change from story board.
    {
        TopicHome2ViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
        viewCont.sectionModel = self.sectionModel;
        viewCont.topic = topic;
    }
    
}

- (IBAction)questionsButton:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Select Your Option" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    [alert addButtonWithTitle:@"Create Question"];
    [alert addButtonWithTitle:@"Manage Question"];
    [alert addButtonWithTitle:@"Search Question"];
    [alert addButtonWithTitle:@"Send by Topic"];
    [alert show];
    option = true;
}

- (IBAction)statisticsButton:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Select Your Option" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    [alert addButtonWithTitle:@"Statistics By Name"];
    [alert addButtonWithTitle:@"Statistics By Topic"];
    [alert show];
    option = false;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 1 && option)
        [self performSegueWithIdentifier:@"CreateQuestion" sender:self];
    if(buttonIndex == 2 && option)
        [self performSegueWithIdentifier:@"ManageQuestion" sender:self];
    if(buttonIndex == 3 && option)
        [self performSegueWithIdentifier:@"SearchQuestion" sender:self];
    if(buttonIndex == 4 && option)
        [self performSegueWithIdentifier:@"SendByTopic" sender:self];
    if(buttonIndex == 1 && !option)
        [self performSegueWithIdentifier:@"StatsByName" sender:self];
    if(buttonIndex == 2 && !option)
        [self performSegueWithIdentifier:@"StatsByTopic" sender:self];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [topicList count];
    
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
    
    NSString *test = [NSString stringWithFormat:@"%@", [[topicList objectAtIndex:indexPath.row] valueForKey:@"topic"]];
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
    
    [topicList enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if([[obj valueForKey:@"topic"] isEqualToString:temp])
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
    topic = [[topicList objectAtIndex:index] valueForKey:@"topic"];
    [self performSegueWithIdentifier:@"TopicHome2" sender:self];
}

@end
