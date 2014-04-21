//
//  SelectSectionViewController.m
//  Question of the Day
//
//  Created by Ogny on 4/1/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import "SelectSectionViewController.h"

@interface SelectSectionViewController ()
{
    NSMutableArray *sectionList;
    bool goBack;
}
@end

@implementation SelectSectionViewController

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
    
    if([self.username isEqualToString:@""])
    {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Incorrect Input"
                                                         message:@"Username Field is empty"
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
        [alert2 show];
        goBack = true;
    }
    
    else if([self.firstName isEqualToString:@""])
    {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Incorrect Input"
                                                         message:@"First Name Field is empty"
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
        [alert2 show];
        goBack = true;
    }
    
    else if([self.lastName isEqualToString:@""])
    {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Incorrect Input"
                                                         message:@"Last Name Field is empty"
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
        [alert2 show];
        goBack = true;
    }
    
    else if([self.email isEqualToString:@""])
    {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Incorrect Input"
                                                         message:@"E-Mail Field is empty"
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
        [alert2 show];
        goBack = true;
    }
    
    else if([self.password1 isEqualToString:@""])
    {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Incorrect Input"
                                                         message:@"Password Field is empty"
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
        [alert2 show];
        goBack = true;
    }
    
    else if([self.password2 isEqualToString:@""])
    {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Incorrect Input"
                                                         message:@"Password Field is empty"
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
        [alert2 show];
        
        goBack = true;
    }
    else{
        goBack = false;
    }
    
    [self instantiateSections];
}


-(void) instantiateSections
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://199.180.255.173/index.php/mobile/getSections" ]];
    
    NSData *userInfoData = [NSData dataWithContentsOfURL:url];
    
    NSMutableArray *userInfoDictionary = [NSJSONSerialization JSONObjectWithData:userInfoData options:NSJSONReadingMutableContainers error:Nil];
    
    sectionList = userInfoDictionary;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [sectionList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UIButton *button = (UIButton *)[cell viewWithTag:1414];
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:12];
    
    UIImage *with = [UIImage imageNamed:@"rightArrow2.jpeg"];
    [imageView setImage:with];
    
    button.tag = indexPath.row;
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    NSString *days = @"";
    
    if([[[sectionList objectAtIndex:indexPath.row] valueForKey:@"meetMonday"] intValue] == 1)
    {
        days = [days stringByAppendingString:@"M"];
    }
    if([[[sectionList objectAtIndex:indexPath.row] valueForKey:@"meetTuesday"] intValue] == 1)
    {
        days = [days stringByAppendingString:@"Tu"];
    }
    if([[[sectionList objectAtIndex:indexPath.row] valueForKey:@"meetWednesday"] intValue] == 1)
    {
        days = [days stringByAppendingString:@"W"];
    }
    if([[[sectionList objectAtIndex:indexPath.row] valueForKey:@"meetThrusday"] intValue] == 1)
    {
        days = [days stringByAppendingString:@"Th"];
    }
    if([[[sectionList objectAtIndex:indexPath.row] valueForKey:@"meetFriday"] intValue] == 1)
    {
        days = [days stringByAppendingString:@"F"];
    }
    if([[[sectionList objectAtIndex:indexPath.row] valueForKey:@"meetSaturday"] intValue] == 1)
    {
        days = [days stringByAppendingString:@"Sa"];
    }
    if([[[sectionList objectAtIndex:indexPath.row] valueForKey:@"meetSunday"] intValue] == 1)
    {
        days = [days stringByAppendingString:@"Su"];
    }
    
    if([days isEqualToString:@""])
    {
        days = @"No meeting days";
    }
    
    NSString *test = [NSString stringWithFormat:@"%@      %@   (%@)", days, [[sectionList objectAtIndex:indexPath.row] valueForKey:@"time"], [[sectionList objectAtIndex:indexPath.row] valueForKey:@"professorID"]];
    button.titleLabel.numberOfLines = 0;
    
    
    if([test rangeOfString:@"<br>"].location != NSNotFound)
        test = [test stringByReplacingOccurrencesOfString:@"<br>" withString:@"  "];
    
    [button setTitle:test forState:UIControlStateNormal];
    
    return cell;
    
}

-(void)buttonPressed:(id)sender {
    UIButton *button = (UIButton *) sender;
    
    NSString *sectionID = [[sectionList objectAtIndex:button.tag] valueForKey:@"sectionID"];
    
    self.username = [self.username stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    self.firstName = [self.firstName stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    self.lastName = [self.lastName stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    self.email = [self.email stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    self.email = [self.email stringByReplacingOccurrencesOfString:@"@" withString:@"%90"];
    self.password1 = [self.password1 stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    self.password2 = [self.password2 stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    sectionID = [sectionID stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://199.180.255.173/index.php/mobile/createUser/%@/%@/%@/%@/%@/%@/%@", self.username, self.firstName, self.lastName, self.email, self.password1, self.password2, sectionID]];
    
    NSData *responseData = [NSData dataWithContentsOfURL:url];
    NSString *response = [[NSString alloc] initWithData:responseData encoding:NSASCIIStringEncoding];
    
    UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Dear Future User"
                                                     message:response
                                                    delegate:nil
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles:nil];
    [alert2 show];
    
    response = [response substringWithRange:NSMakeRange(0, 1)];
    
    if([response isEqualToString:@"A"])
    {
        [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:YES];
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
