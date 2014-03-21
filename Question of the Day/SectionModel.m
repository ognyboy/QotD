//
//  SectionModel.m
//  Question of the Day
//
//  Created by Ogny on 3/17/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import "SectionModel.h"

@implementation SectionModel

@synthesize sectionID = _sectionID;
@synthesize courseID = _courseID;
@synthesize semester = _semester;
@synthesize time = _time;
@synthesize title = _title;
@synthesize meetFriday = _meetFriday;
@synthesize meetMonday = _meetMonday;
@synthesize meetTuesday = _meetTuesday;
@synthesize meetWednesday = _meetWednesday;
@synthesize meetThursday = _meetThursday;
@synthesize meetSaturday = _meetSaturday;
@synthesize meetSunday = _meetSunday;
@synthesize timeLimit =_timeLimit;
@synthesize canDrop = _canDrop;
@synthesize sendingQuestions = _sendingQuestions;
@synthesize sendToProf =_sendToProf;



-(NSString *) getSectionID
{
    return _sectionID;
}
-(NSString *) getCourseID
{
    return _courseID;
}
-(NSString *) getSemester
{
    return _semester;
}
-(NSString *) getTime
{
    return _time;
}
-(NSString *) getTitle
{
    return _title;
}
-(int) getMeetMonday
{
    return _meetMonday;
}
-(int) getMeetTuesday
{
    return _meetTuesday;
}
-(int) getMeetWednesday
{
    return _meetWednesday;
}
-(int) getMeetThursday
{
    return _meetThursday;
}
-(int) getMeetFriday
{
    return _meetFriday;
}
-(int) getMeetSatruday
{
    return _meetSaturday;
}
-(int) getMeetSunday
{
    return _meetSunday;
}

-(int) getTimeLimit
{
    return _timeLimit;
}
-(int) getCanDrop
{
    return _canDrop;
}
-(int) getSendingQuestions
{
    return _sendingQuestions;
}
-(int) getSendToProf
{
    return _sendToProf;
}
-(int) getProfessorID
{
    return _professorID;
}

-(void) setSectionID:(NSString *) sec
{
    _sectionID = sec;
}
-(void) setCourseID:(NSString *) cou
{
    _courseID = cou;
}
-(void) setSemester:(NSString *) sem
{
    _semester = sem;
}
-(void) setTime:(NSString *)tim
{
    _time = tim;
}
-(void) setTitle:(NSString *)tit
{
    _title = tit;
}
-(void) setMeetFriday:(int)meet
{
    _meetFriday = meet;
}
-(void) setMeetSaturday:(int)meet
{
    _meetSaturday = meet;
}
-(void) setMeetSunday:(int)meet
{
    _meetSunday = meet;
}
-(void) setMeetMonday:(int)meet
{
    _meetMonday = meet;
}
-(void) setMeetTuesday:(int)meet
{
    _meetTuesday = meet;
}
-(void) setMeetWednesday:(int)meet
{
    _meetWednesday = meet;
}
-(void) setMeetThursday:(int)meet
{
    _meetThursday = meet;
}
-(void) setTimeLimit:(int)tim
{
    _timeLimit = tim;
}
-(void) setCanDrop:(int)can
{
    _canDrop = can;
}
-(void) setSendingQuestions:(int)sen
{
    _sendingQuestions = sen;
}
-(void) setSendToProf:(int)sen
{
    _sendToProf = sen;
}
-(void) setProfessorID:(int)pro
{
    _professorID = pro;
}
@end
