//
//  QuestionModel.m
//  Question of the Day
//
//  Created by Ogny on 3/17/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import "QuestionModel.h"

@implementation QuestionModel


@synthesize topic = _topic;
@synthesize prompt = _prompt;
@synthesize a = _a;
@synthesize b = _b;
@synthesize c = _c;
@synthesize d = _d;
@synthesize correct = _correct;
@synthesize hint = _hint;
@synthesize explanation = _explanation;
@synthesize questionID = _questionID;

-(void) setTopic:(NSString *)top
{
    _topic = top;
}
-(void) setPrompt:(NSString *)pro
{
    _prompt = pro;
}
-(void) setA:(NSString *) aa
{
    _a = aa;
}
-(void) setB:(NSString *)bb
{
    _b = bb;
}
-(void) setC:(NSString *)cc
{
    _c = cc;
}
-(void) setD:(NSString *)dd
{
    _d = dd;
}
-(void) setCorrect:(NSString *)cor
{
    _correct = cor;
}
-(void) setHint:(NSString *)hin
{
    _hint = hin;
}
-(void) setExplanation:(NSString *)exp
{
    _explanation = exp;
}
-(void) setQuestionID:(int)que
{
    _questionID = que;
}

-(NSString *) getTopic
{
    return _topic;
}
-(NSString *) getPrompt
{
    return _prompt;
}
-(NSString *) getA
{
    return _a;
}
-(NSString *) getB
{
    return _b;
}
-(NSString *) getC
{
    return _c;
}
-(NSString *) getD
{
    return _d;
}
-(NSString *) getHint
{
    return _hint;
}
-(NSString *) getCorrect
{
    return _correct;
}
-(NSString *) getExplanation
{
    return _explanation;
}
-(int) getQuestionID
{
    return _questionID;
}

@end
