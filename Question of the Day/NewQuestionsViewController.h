//
//  NewQuestionsViewController.h
//  Question of the Day
//
//  Created by Ogny on 3/22/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentHomeViewController.h"
#import "UserModel.h"
#import "QuestionModel.h"

@interface NewQuestionsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *questionsLabel;
@property (strong, nonatomic) UserModel *userModel;
@property (strong, nonatomic) QuestionModel *questionModel;
@property (weak, nonatomic) IBOutlet UITableView *questionsTablew;
@property (weak, nonatomic) IBOutlet UILabel *aaaa;

@end
