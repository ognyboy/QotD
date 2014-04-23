//
//  CreateQuestionViewController.h
//  Question of the Day
//
//  Created by Ogny on 4/20/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"
#import "SectionModel.h"
#import "QuestionModel.h"
#import "RosterViewController.h"
#import "CreateQuestionViewController.h"
#import "SearchQuestionViewController.h"
#import "ManageQuestionViewController.h"
#import "SendByTopicViewController.h"
#import "StatsByNameViewController.h"
#import "StatsByTopicViewController.h"

@interface CreateQuestionViewController : UIViewController <UIAlertViewDelegate>

@property (strong, nonatomic) UserModel *userModel;
@property (strong, nonatomic) SectionModel *sectionModel;
@property (strong, nonatomic) QuestionModel *questionModel;
@property bool edit;

@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *createButton;
@property (weak, nonatomic) IBOutlet UITextField *topicField;
@property (weak, nonatomic) IBOutlet UITextField *promptField;
@property (weak, nonatomic) IBOutlet UITextField *aField;
@property (weak, nonatomic) IBOutlet UITextField *bField;
@property (weak, nonatomic) IBOutlet UITextField *cField;
@property (weak, nonatomic) IBOutlet UITextField *dField;
@property (weak, nonatomic) IBOutlet UITextField *correctField;
@property (weak, nonatomic) IBOutlet UITextField *hintField;
@property (weak, nonatomic) IBOutlet UITextField *explanationField;
@end
