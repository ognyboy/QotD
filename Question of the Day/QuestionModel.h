//
//  QuestionModel.h
//  Question of the Day
//
//  Created by Ogny on 3/17/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionModel : NSObject

@property (strong, nonatomic) NSString *topic;
@property (strong, nonatomic) NSString *prompt;
@property (strong, nonatomic) NSString *a;
@property (strong, nonatomic) NSString *b;
@property (strong, nonatomic) NSString *c;
@property (strong, nonatomic) NSString *d;
@property (strong, nonatomic) NSString *correct;
@property (strong, nonatomic) NSString *hint;
@property (strong, nonatomic) NSString *explanation;
@property (nonatomic) int questionID;


-(void) setTopic:(NSString *)top;
-(void) setPrompt:(NSString *)pro;
-(void) setA:(NSString *) aa;
-(void) setB:(NSString *)bb;
-(void) setC:(NSString *)cc;
-(void) setD:(NSString *)dd;
-(void) setCorrect:(NSString *)cor;
-(void) setHint:(NSString *)hin;
-(void) setExplanation:(NSString *)exp;
-(void) setQuestionID:(int)que;

-(NSString *) getTopic;
-(NSString *) getPrompt;
-(NSString *) getA;
-(NSString *) getB;
-(NSString *) getC;
-(NSString *) getD;
-(NSString *) getHint;
-(NSString *) getCorrect;
-(NSString *) getExplanation;
-(int) getQuestionID;

@end
