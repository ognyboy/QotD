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

@end
