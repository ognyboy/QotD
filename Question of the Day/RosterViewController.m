//
//  RosterViewController.m
//  Question of the Day
//
//  Created by Ogny on 4/20/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import "RosterViewController.h"

@interface RosterViewController ()
{
    bool option;
    NSMutableArray *studentList;
    NSMutableArray *checkedList;
}

@end

@implementation RosterViewController

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
	// Do any additional setup after loading the view.
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Log out" style:UIBarButtonItemStyleBordered target:self action:@selector(logout:)];
    
    option = false;
    
    [self getStudentList];
}

-(void) getStudentList
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://199.180.255.173/index.php/mobile/getRoster/%@", [self.sectionModel getSectionID]]];
    
    NSData *userInfoData = [NSData dataWithContentsOfURL:url];
    
    NSMutableArray *userInfoDictionary = [NSJSONSerialization JSONObjectWithData:userInfoData options:NSJSONReadingMutableContainers error:Nil];
    
    studentList = userInfoDictionary;
    checkedList = [[NSMutableArray alloc] init];
    
    for(int i = 0; i<studentList.count; i++)
    {
        NSNumber* temp = [NSNumber numberWithInteger:0];
        [checkedList addObject:temp];
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
    return [studentList count];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:7777];
    
    UIImage *checked = [UIImage imageNamed:@"bifat.jpg"];
    UIImage *unchecked = [UIImage imageNamed:@"nebifat.jpg"];
    if([[checkedList objectAtIndex:indexPath.row] integerValue] == 0)
        [imageView setImage:unchecked];
    if([[checkedList objectAtIndex:indexPath.row] integerValue] == 1)
        [imageView setImage:checked];
    
    UIButton *button = (UIButton *)[cell viewWithTag:2222];
    
    button.tag = indexPath.row;
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    NSString *test = [NSString stringWithFormat:@"                 %@ %@", [[studentList objectAtIndex:indexPath.row] valueForKey:@"firstName"], [[studentList objectAtIndex:indexPath.row] valueForKey:@"lastName"]];
    button.titleLabel.numberOfLines = 0;
    
    
    if([test rangeOfString:@"<br>"].location != NSNotFound)
        test = [test stringByReplacingOccurrencesOfString:@"<br>" withString:@"  "];
    
    [button setTitle:test forState:UIControlStateNormal];
    
    return cell;
    
}

-(void)buttonPressed:(id)sender
{
    UIButton *button = (UIButton *) sender;
    
    if([[checkedList objectAtIndex:button.tag] integerValue] == 0)
    {
        [checkedList replaceObjectAtIndex:button.tag withObject:[NSNumber numberWithInteger:1]];
    }
    else if([[checkedList objectAtIndex:button.tag] integerValue] == 1)
    {
        [checkedList replaceObjectAtIndex:button.tag withObject:[NSNumber numberWithInteger:0]];
    }
    
    [self.rosterTable reloadData];
}


- (IBAction)removeStudents:(id)sender
{
    for(int i = 0; i<studentList.count; i++)
    {
        if([[checkedList objectAtIndex:i] integerValue] == 1)
        {
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://199.180.255.173/index.php/mobile/removeStudent/%@/%@", [[studentList objectAtIndex:i] valueForKey:@"username"], [self.sectionModel getSectionID]]];
            
            NSData *responseData = [NSData dataWithContentsOfURL:url];
            NSString *response = [[NSString alloc] initWithData:responseData encoding:NSASCIIStringEncoding];
            response = [response substringWithRange:NSMakeRange(1, 1)];
            
            [studentList removeObjectAtIndex:i];
            [checkedList removeObjectAtIndex:i];
            if([response isEqualToString:@"f"])
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error In Removing"
                                                                message:@"There was an error in the attempt to remove the selected students. Please try again or use the related website for this app!"
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
                [alert show];
            }
            
            if([response isEqualToString:@"t"])
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success!"
                                                                message:@"You have successfully removed the student(s)!"
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
                [alert show];
                [self.rosterTable reloadData];
            }
        }
    }
    
}


@end
