//
//  QuestionListViewController.h
//  Question of the Day
//
//  Created by Ogny on 4/23/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"
#import "SectionModel.h"
#import "SectionHomeViewController.h"
#import "ViewDetailsViewController.h"

@interface QuestionListViewController : UIViewController

@property (strong, nonatomic) UserModel *userModel;
@property (strong, nonatomic) SectionModel *sectionModel;
@property (strong, nonatomic) QuestionModel *questionModel;
@property (weak, nonatomic) IBOutlet UITableView *questionsTable;

@property (strong, nonatomic) NSString *topic;

@end
