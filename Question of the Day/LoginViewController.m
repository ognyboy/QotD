//
//  QotDViewController.m
//  Question of the Day
//
//  Created by Ogny on 3/17/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

-(UserModel *)userModel
{
    if(_userModel == Nil)
    {
        _userModel = [[UserModel alloc] init];
    }
    
    return _userModel;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //this to be changed by Bach
    [self.userModel setUserName:@"dognean"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://199.180.255.173/index.php/mobile/getUserInfo/%@", [self.userModel getUserName]]];

    NSData *userInfoData = [NSData dataWithContentsOfURL:url];
    
    NSString *haha = [[NSString alloc] initWithData:userInfoData encoding:NSUTF8StringEncoding];
    
    NSString *json = [haha substringWithRange:NSMakeRange(1, [haha length]-2)];
    
    userInfoData = [json dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *userInfoDictionary = [NSJSONSerialization JSONObjectWithData:userInfoData options:kNilOptions error:Nil];
    
    
    [self.userModel setUserName:[[userInfoDictionary valueForKey:@"username"] objectAtIndex:0]];
    [self.userModel setFirstName:[[userInfoDictionary valueForKey:@"firstName"] objectAtIndex:0]];
    [self.userModel setLastName:[[userInfoDictionary valueForKey:@"lastName"] objectAtIndex:0]];
    [self.userModel setEMail:[[userInfoDictionary valueForKey:@"email"] objectAtIndex:0]];
    [self.userModel setUserID:[[[userInfoDictionary valueForKey:@"userID"] objectAtIndex:0] intValue]];
    
    
 
    NSURL *idURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://199.180.255.173/index.php/mobile/isProfessor/%@", [self.userModel getUserName]]];
    
    NSData *userIDData = [NSData dataWithContentsOfURL:idURL];
    NSString *boolcheck = [[NSString alloc] initWithData:userIDData encoding:NSASCIIStringEncoding];
    if([boolcheck isEqualToString:@"false"])
        [self.userModel setUserType:1];
    if([boolcheck isEqualToString:@"true"])
        [self.userModel setUserType:2];
    
    
    for (int i = 0; i< [[userInfoDictionary valueForKey:@"sectionID"] count]; i++)
    {
        [self.userModel.listOfSections addObject:[[userInfoDictionary valueForKey:@"sectionID"] objectAtIndex:i]];
    }
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [segue.identifier isEqualToString:@"goStudentHome"] && [self.userModel getUserType] == 1)   //this is the segue name that you can change from story board.
    {
        
        StudentHomeViewController *viewCont = segue.destinationViewController;
        viewCont.userModel = self.userModel;
    }
}
@end
