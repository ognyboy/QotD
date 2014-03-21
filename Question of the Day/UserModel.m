//
//  UserModel.m
//  Question of the Day
//
//  Created by Ogny on 3/17/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import "UserModel.h"

@interface UserModel()

@property (nonatomic, strong) NSMutableArray *listOfSections;

@end

@implementation UserModel

@synthesize username = _username;
@synthesize firstName = _firstName;
@synthesize lastName = _lastName;
@synthesize eMail = _eMail;
@synthesize userType = _userType;
@synthesize userID = _userID;
@synthesize listOfSections = _listOfSections;

-(NSArray *)listOfSections
{
    if(_listOfSections == Nil)
    {
        _listOfSections = [[NSMutableArray alloc] init];
    }
    return _listOfSections;
}

-(NSString *) getUserName
{
    return _username;
}

-(NSString *) getFirstName
{
    return _firstName;
}

-(NSString *) getLastName
{
    return _lastName;
}

-(NSString *) getEmail
{
    return _eMail;
}

-(int) getUserType
{
    return _userType;
}

-(int) getUserID
{
    return _userID;
}

-(NSMutableArray *) getListOfSections
{
    return _listOfSections;
}

-(void) setEMail:(NSString *) mail{
    _eMail = mail;
}

-(void) setUserName:(NSString *) userName
{
    _username = userName;
}

-(void) setFirstName:(NSString *) first
{
    _firstName = first;
}

-(void) setLastName:(NSString *) last
{
    _lastName = last;
}

-(void) setUserType:(int) type
{
    _userType = type;
}

-(void) setUserID:(int)userD
{
    _userID = userD;
}



@end
