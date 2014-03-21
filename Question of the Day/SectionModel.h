//
//  SectionModel.h
//  Question of the Day
//
//  Created by Ogny on 3/17/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SectionModel : NSObject


@property (strong, nonatomic) NSString *sectionID;
@property (strong, nonatomic) NSString *courseID;
@property (strong, nonatomic) NSString *semester;
@property (strong, nonatomic) NSString *time;
@property (strong, nonatomic) NSString *title;
@property (nonatomic) int meetSunday;
@property (nonatomic) int meetSaturday;
@property (nonatomic) int meetFriday;
@property (nonatomic) int meetThursday;
@property (nonatomic) int meetWednesday;
@property (nonatomic) int meetTuesday;
@property (nonatomic) int meetMonday;
@property (nonatomic) int canDrop;
@property (nonatomic) int sendingQuestions;
@property (nonatomic) int timeLimit;
@property (nonatomic) int sendToProf;
@property (nonatomic) int professorID;


-(void) setSectionID:(NSString *) sec;
-(void) setCourseID:(NSString *) cou;
-(void) setSemester:(NSString *) sem;
-(void) setTime:(NSString *)tim;
-(void) setTitle:(NSString *)tit;
-(void) setMeetFriday:(int)meet;
-(void) setMeetSaturday:(int)meet;
-(void) setMeetSunday:(int)meet;
-(void) setMeetMonday:(int)meet;
-(void) setMeetTuesday:(int)meet;
-(void) setMeetWednesday:(int)meet;
-(void) setMeetThursday:(int)meet;
-(void) setTimeLimit:(int)tim;
-(void) setCanDrop:(int)can;
-(void) setSendingQuestions:(int)sen;
-(void) setSendToProf:(int)sen;
-(void) setProfessorID:(int)pro;

-(NSString *) getSectionID;
-(NSString *) getCourseID;
-(NSString *) getSemester;
-(NSString *) getTime;
-(NSString *) getTitle;
-(int) getMeetMonday;
-(int) getMeetTuesday;
-(int) getMeetWednesday;
-(int) getMeetThursday;
-(int) getMeetFriday;
-(int) getMeetSatruday;
-(int) getMeetSunday;
-(int) getTimeLimit;
-(int) getCanDrop;
-(int) getSendingQuestions;
-(int) getSendToProf;
-(int) getProfessorID;

@end
