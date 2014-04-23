//
//  TopicHome2ViewController.m
//  Question of the Day
//
//  Created by Ogny on 4/22/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import "TopicHome2ViewController.h"

@interface TopicHome2ViewController ()
{
    NSMutableArray *questionsList;
    bool mondayBool, tuesdayBool, wednesdayBool, thurdayBool, fridayBool, saturdayBool, sundayBool;
}

@end

@implementation TopicHome2ViewController

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
    [self.topicTitle setText:[NSString stringWithFormat:@"Details for %@", self.topic]];
    
    UIImage *checked = [UIImage imageNamed:@"bifat.jpg"];
    UIImage *unchecked = [UIImage imageNamed:@"nebifat.jpg"];
    
    //this is where you instantiate the button.
    mondayBool = false;
    tuesdayBool = false;
    wednesdayBool = false;
    thurdayBool = false;
    fridayBool = false;
    saturdayBool = false;
    sundayBool = false;
    
    [self instantiateDetails];
    
    if(mondayBool)
        [self.MondayButton setBackgroundImage:checked forState:UIControlStateNormal];
    else
        [self.MondayButton setBackgroundImage:unchecked forState:UIControlStateNormal];
    
    if(tuesdayBool)
        [self.tuesdayButton setBackgroundImage:checked forState:UIControlStateNormal];
    else
        [self.tuesdayButton setBackgroundImage:unchecked forState:UIControlStateNormal];
    
    if(wednesdayBool)
        [self.wednesdayButton setBackgroundImage:checked forState:UIControlStateNormal];
    else
        [self.wednesdayButton setBackgroundImage:unchecked forState:UIControlStateNormal];
    
    if(thurdayBool)
        [self.thursdayButton setBackgroundImage:checked forState:UIControlStateNormal];
    else
        [self.thursdayButton setBackgroundImage:unchecked forState:UIControlStateNormal];
    
    if(fridayBool)
        [self.fridayButton setBackgroundImage:checked forState:UIControlStateNormal];
    else
        [self.fridayButton setBackgroundImage:unchecked forState:UIControlStateNormal];
    
    if(saturdayBool)
        [self.saturdayButton setBackgroundImage:checked forState:UIControlStateNormal];
    else
        [self.saturdayButton setBackgroundImage:unchecked forState:UIControlStateNormal];
    
    if(sundayBool)
        [self.sundayButton setBackgroundImage:checked forState:UIControlStateNormal];
    else
        [self.sundayButton setBackgroundImage:unchecked forState:UIControlStateNormal];
    
    
    [self instantiateQUestionList];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Log out" style:UIBarButtonItemStyleBordered target:self action:@selector(logout:)];
    self.navigationItem.title = @"Sending Details";
}

-(void) instantiateDetails
{
    NSString *url2 = [NSString stringWithFormat:@"http://199.180.255.173/index.php/mobile/getTopicSchedule/%@/%@", [self.sectionModel getSectionID], self.topic];
    url2 = [url2 stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    
    NSURL *url = [NSURL URLWithString:url2];
    
    NSData *userInfoData = [NSData dataWithContentsOfURL:url];
    
    NSMutableArray *userInfoDictionary = [NSJSONSerialization JSONObjectWithData:userInfoData options:NSJSONReadingMutableContainers error:Nil];
    
    if([userInfoDictionary count] >0)
    {
        [self.dateField setText:[[userInfoDictionary objectAtIndex:0] valueForKey:@"startDate"]];
        if([[[userInfoDictionary objectAtIndex:0] valueForKey:@"monday"] integerValue] == 1)
        {
            mondayBool = true;
        }
        if([[[userInfoDictionary objectAtIndex:0] valueForKey:@"tuesday"] integerValue] == 1)
        {
            tuesdayBool = true;
        }
        if([[[userInfoDictionary objectAtIndex:0] valueForKey:@"wednesday"] integerValue] == 1)
        {
            wednesdayBool = true;
        }
        if([[[userInfoDictionary objectAtIndex:0] valueForKey:@"thursday"] integerValue] == 1)
        {
            thurdayBool = true;
        }
        if([[[userInfoDictionary objectAtIndex:0] valueForKey:@"friday"] integerValue] == 1)
        {
            fridayBool = true;
        }
        if([[[userInfoDictionary objectAtIndex:0] valueForKey:@"saturday"] integerValue] == 1)
        {
            saturdayBool = true;
        }
        if([[[userInfoDictionary objectAtIndex:0] valueForKey:@"sunday"] integerValue] == 1)
        {
            sundayBool = true;
        }
    }
    
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

- (void)touchesBegan: (NSSet *) touches withEvent:(UIEvent *)event
{
    // Hides Keyboard after clicking outside of keyboard
    
    [self.view endEditing: YES];
    [super touchesBegan:touches withEvent: event];
}

-(IBAction)valueReturn:(id)sender
{
    [sender resignFirstResponder];
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
    
    UIButton *button = (UIButton *)[cell viewWithTag:8888];
    
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

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [segue.identifier isEqualToString:@"SecHome3"])   //this is the segue name that you can change from story board.
    {
        SectionHomeViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
        viewCont.sectionModel = self.sectionModel;
    }
    
}

- (IBAction)mondayAction:(id)sender
{
    UIImage *checked = [UIImage imageNamed:@"bifat.jpg"];
    UIImage *unchecked = [UIImage imageNamed:@"nebifat.jpg"];
    
    if(mondayBool)
    {
        mondayBool = false;
        [self.MondayButton setBackgroundImage:unchecked forState:UIControlStateNormal];
    }
    else{
        mondayBool = true;
        [self.MondayButton setBackgroundImage:checked forState:UIControlStateNormal];
    }
    
}

- (IBAction)tuesdayAction:(id)sender
{
    UIImage *checked = [UIImage imageNamed:@"bifat.jpg"];
    UIImage *unchecked = [UIImage imageNamed:@"nebifat.jpg"];
    
    if(tuesdayBool)
    {
        tuesdayBool = false;
        [self.tuesdayButton setBackgroundImage:unchecked forState:UIControlStateNormal];
    }
    else{
        tuesdayBool = true;
        [self.tuesdayButton setBackgroundImage:checked forState:UIControlStateNormal];
    }
}

- (IBAction)wednesdayAcion:(id)sender
{
    UIImage *checked = [UIImage imageNamed:@"bifat.jpg"];
    UIImage *unchecked = [UIImage imageNamed:@"nebifat.jpg"];
    
    if(wednesdayBool)
    {
        wednesdayBool = false;
        [self.wednesdayButton setBackgroundImage:unchecked forState:UIControlStateNormal];
    }
    else{
        wednesdayBool = true;
        [self.wednesdayButton setBackgroundImage:checked forState:UIControlStateNormal];
    }
}

- (IBAction)thursdayAction:(id)sender
{
    UIImage *checked = [UIImage imageNamed:@"bifat.jpg"];
    UIImage *unchecked = [UIImage imageNamed:@"nebifat.jpg"];
    
    if(thurdayBool)
    {
        thurdayBool = false;
        [self.thursdayButton setBackgroundImage:unchecked forState:UIControlStateNormal];
    }
    else{
        thurdayBool = true;
        [self.thursdayButton setBackgroundImage:checked forState:UIControlStateNormal];
    }
}

- (IBAction)fridayAction:(id)sender
{
    UIImage *checked = [UIImage imageNamed:@"bifat.jpg"];
    UIImage *unchecked = [UIImage imageNamed:@"nebifat.jpg"];
    
    if(fridayBool)
    {
        fridayBool = false;
        [self.fridayButton setBackgroundImage:unchecked forState:UIControlStateNormal];
    }
    else{
        fridayBool = true;
        [self.fridayButton setBackgroundImage:checked forState:UIControlStateNormal];
    }
}

- (IBAction)saturdayAction:(id)sender
{
    UIImage *checked = [UIImage imageNamed:@"bifat.jpg"];
    UIImage *unchecked = [UIImage imageNamed:@"nebifat.jpg"];
    
    if(saturdayBool)
    {
        saturdayBool = false;
        [self.saturdayButton setBackgroundImage:unchecked forState:UIControlStateNormal];
    }
    else{
        saturdayBool = true;
        [self.saturdayButton setBackgroundImage:checked forState:UIControlStateNormal];
    }
}

- (IBAction)sundayAction:(id)sender
{
    UIImage *checked = [UIImage imageNamed:@"bifat.jpg"];
    UIImage *unchecked = [UIImage imageNamed:@"nebifat.jpg"];
    
    if(sundayBool)
    {
        sundayBool = false;
        [self.sundayButton setBackgroundImage:unchecked forState:UIControlStateNormal];
    }
    else{
        sundayBool = true;
        [self.sundayButton setBackgroundImage:checked forState:UIControlStateNormal];
    }
}

- (IBAction)saveDetails:(id)sender
{
    int monday, tuesday, wednesday, thursday, friday, saturday, sunday;
    
    if(mondayBool)
    {
        monday = 1;
    }
    else
        monday = 0;
    
    if(tuesdayBool)
        tuesday = 1;
    else
        tuesday = 0;
    
    if(wednesdayBool)
        wednesday = 1;
    else
        wednesday = 0;
    
    if(thurdayBool)
        thursday = 1;
    else
        thursday = 0;
    
    if(fridayBool)
        friday = 1;
    else
        friday = 0;
    
    if(saturdayBool)
        saturday = 1;
    else
        saturday =0;
    
    if(sundayBool)
        sunday = 1;
    else
        sunday = 0;
    
    NSString *url2 = [NSString stringWithFormat:@"http://199.180.255.173/index.php/mobile/addTopic/%@/%@/%d/%d/%d/%d/%d/%d/%d/%@", [self.sectionModel getSectionID], self.topic, monday, tuesday, wednesday, thursday, friday, saturday, sunday, [self.dateField text]];
    url2 = [url2 stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    
    NSURL *url = [NSURL URLWithString:url2];
    
    NSData *userInfoData = [NSData dataWithContentsOfURL:url];
    
    if(userInfoData)
    {
        
    }
    
    [self performSegueWithIdentifier:@"SecHome3" sender:self];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Saved!"
                                                    message:@"Your input for the sending options are saved!"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

@end
