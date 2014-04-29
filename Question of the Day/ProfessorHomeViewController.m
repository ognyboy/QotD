//
//  ProfessorHomeViewController.m
//  Question of the Day
//
//  Created by Ogny on 4/14/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import "ProfessorHomeViewController.h"
#import "ProfessorHome2ViewController.h"

@interface ProfessorHomeViewController ()
{
    NSMutableArray *courseList;
    NSString *course;
}
@end

@implementation ProfessorHomeViewController

-(UserModel *)userModel
{
    if(_userModel == Nil)
    {
        _userModel = [[UserModel alloc] init];
    }
    
    return _userModel;
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
    
    [self getCourses];
    
    [self.navigationItem setHidesBackButton:TRUE];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Log out" style:UIBarButtonItemStyleBordered target:self action:@selector(logout:)];
    
}

-(void) logout: (id) sender
{
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:YES];
}

-(void) getCourses
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://cse110.courses.asu.edu/index.php/mobile/getCoursesForProfessor/%d", [self.userModel getUserID]]];
    
    NSData *userInfoData = [NSData dataWithContentsOfURL:url];

    NSMutableArray *userInfoDictionary = [NSJSONSerialization JSONObjectWithData:userInfoData options:NSJSONReadingMutableContainers error:Nil];
    
    courseList = userInfoDictionary;
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
    return [courseList count];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UIButton *button = (UIButton *)[cell viewWithTag:2222];
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:11];
    
    UIImage *with = [UIImage imageNamed:@"rightArrow2.jpeg"];
    [imageView setImage:with];
    
    
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    NSString *test = [NSString stringWithFormat:@"%@", [[courseList objectAtIndex:indexPath.row] valueForKey:@"courseID"]];
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
    
    [courseList enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if([[obj valueForKey:@"courseID"] isEqualToString:temp])
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
    NSArray *singleCourse = [courseList objectAtIndex:index];
    
    course = [singleCourse valueForKey:@"courseID"];
    [self performSegueWithIdentifier:@"professor2" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [segue.identifier isEqualToString:@"professor2"])   //this is the segue name that you can change from story board.
    {
        
        ProfessorHome2ViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
        viewCont.course = course;
    }
    
}

@end
