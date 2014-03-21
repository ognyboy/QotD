//
//  UserModel.h
//  Question of the Day
//
//  Created by Ogny on 3/17/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *eMail;
@property (nonatomic) int userType;
@property (nonatomic) int userID;
@property (nonatomic, strong, readonly) NSMutableArray *listOfSections;

-(void) setEMail:(NSString *) mail;
-(void) setUserName:(NSString *) userName;
-(void) setFirstName:(NSString *) first;
-(void) setLastName:(NSString *) last;
-(void) setUserType:(int) type;
-(void) setUserID:(int)userD;

-(NSString *) getEmail;
-(NSString *) getUserName;
-(NSString *) getFirstName;
-(NSString *) getLastName;
-(int) getUserID;
-(int) getUserType;
-(NSMutableArray *) getListOfSections;

@end
