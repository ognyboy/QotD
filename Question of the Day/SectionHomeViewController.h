//
//  SectionHomeViewController.h
//  Question of the Day
//
//  Created by Ogny on 4/14/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoursePropertiesViewController.h"
#import "UserModel.h"
#import "SectionModel.h"
#import "RosterViewController.h"
#import "CreateQuestionViewController.h"
#import "SearchQuestionViewController.h"
#import "ManageQuestionViewController.h"
#import "SendByTopicViewController.h"
#import "StatsByNameViewController.h"
#import "StatsByTopicViewController.h"

@interface SectionHomeViewController : UIViewController <UIAlertViewDelegate>

@property (strong, nonatomic) UserModel *userModel;
@property (strong, nonatomic) SectionModel *sectionModel;
@property (weak, nonatomic) IBOutlet UILabel *courseLabel;
@property (weak, nonatomic) IBOutlet UILabel *codeLabel;
@property (weak, nonatomic) IBOutlet UILabel *sectionLabel;
@property (weak, nonatomic) IBOutlet UILabel *meetLabel;
@property (weak, nonatomic) IBOutlet UILabel *professorLabel;
@property (weak, nonatomic) IBOutlet UILabel *semesterLabel;
@property (weak, nonatomic) IBOutlet UILabel *sendProf;
@property (weak, nonatomic) IBOutlet UILabel *timeLimit;
@property (weak, nonatomic) IBOutlet UILabel *sendQuestion;
@property (weak, nonatomic) IBOutlet UILabel *dropSecion;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end
