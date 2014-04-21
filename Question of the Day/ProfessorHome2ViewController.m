//
//  ProfessorHome2ViewController.m
//  Question of the Day
//
//  Created by Ogny on 4/19/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import "ProfessorHome2ViewController.h"

@interface ProfessorHome2ViewController ()
{
    NSMutableArray *sectionList;
}

@end

@implementation ProfessorHome2ViewController

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
    
    [self getSections];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Log out" style:UIBarButtonItemStyleBordered target:self action:@selector(logout:)];
    
    NSString *titleString = [NSString stringWithFormat:@"Select Section for: %@", self.course];
    [self.titleLabel setText:titleString];
}

-(void) getSections
{
    
    NSString *url2 = [NSString stringWithFormat:@"http://199.180.255.173/index.php/mobile/getSectionsForCourse/%@", self.course];
    url2 = [url2 stringByReplacingOccurrencesOfString:@" " withString:@"%20"];

    NSURL *url = [NSURL URLWithString:url2];
    
    NSData *userInfoData = [NSData dataWithContentsOfURL:url];
    
    NSMutableArray *userInfoDictionary = [NSJSONSerialization JSONObjectWithData:userInfoData options:NSJSONReadingMutableContainers error:Nil];
    
    sectionList = userInfoDictionary;
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
    return [sectionList count];
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UIButton *button = (UIButton *)[cell viewWithTag:2222];
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:11];
    
    UIImage *with = [UIImage imageNamed:@"rightArrow2.jpeg"];
    [imageView setImage:with];
    
    button.tag = indexPath.row;
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    NSString *test = [NSString stringWithFormat:@"%@", [[sectionList objectAtIndex:indexPath.row] valueForKey:@"sectionID"]];
    button.titleLabel.numberOfLines = 0;
    
    
    if([test rangeOfString:@"<br>"].location != NSNotFound)
        test = [test stringByReplacingOccurrencesOfString:@"<br>" withString:@"  "];
    
    [button setTitle:test forState:UIControlStateNormal];
    
    return cell;
    
}

-(void)buttonPressed:(id)sender {
    
    UIButton *button = (UIButton *) sender;
    
    NSArray *singleCourse = [sectionList objectAtIndex:button.tag];
    
    
    [self.sectionModel setCanDrop:[[singleCourse valueForKey:@"canDrop"] integerValue]];
    [self.sectionModel setCourseID:[singleCourse valueForKey:@"courseID"]];
    [self.sectionModel setMeetFriday:[[singleCourse valueForKey:@"meetFriday"] integerValue]];
    [self.sectionModel setMeetMonday:[[singleCourse valueForKey:@"meetMonday"] integerValue]];
    [self.sectionModel setMeetSaturday:[[singleCourse valueForKey:@"meetSaturday"] integerValue]];
    [self.sectionModel setMeetSunday:[[singleCourse valueForKey:@"meetSunday"] integerValue]];
    [self.sectionModel setMeetThursday:[[singleCourse valueForKey:@"meetThursday"] integerValue]];
    [self.sectionModel setMeetTuesday:[[singleCourse valueForKey:@"meetTuesday"] integerValue]];
    [self.sectionModel setMeetWednesday:[[singleCourse valueForKey:@"meetWednesday"] integerValue]];
    [self.sectionModel setProfessorID:[[singleCourse valueForKey:@"professorID"] integerValue]];
    [self.sectionModel setSectionID:[singleCourse valueForKey:@"sectionID"]];
    [self.sectionModel setSemester:[singleCourse valueForKey:@"semester"]];
    [self.sectionModel setSendToProf:[[singleCourse valueForKey:@"sendToProf"] integerValue]];
    [self.sectionModel setSendingQuestions:[[singleCourse valueForKey:@"sendingQuestions"] integerValue]];
    [self.sectionModel setTime:[singleCourse valueForKey:@"time"]];
    [self.sectionModel setTimeLimit:[[singleCourse valueForKey:@"timeLimit"] integerValue]];
    [self.sectionModel setTitle:[singleCourse valueForKey:@"title"]];
    
    [self performSegueWithIdentifier:@"goToSection" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [segue.identifier isEqualToString:@"goToSection"])   //this is the segue name that you can change from story board.
    {
        
        SectionHomeViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
        viewCont.sectionModel = self.sectionModel;
    }
    
}


@end
