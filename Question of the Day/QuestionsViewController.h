//
//  QuestionsViewController.h
//  Question of the Day
//
//  Created by Ogny on 3/21/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentHomeViewController.h"
#import "UserModel.h"
#import "QuestionModel.h"

@interface QuestionsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *questionsText;
@property (strong, nonatomic) UserModel *userModel;
@property (strong, nonatomic) QuestionModel *questionModel;
@property (weak, nonatomic) IBOutlet UITableView *questionsTableView;
@property (weak, nonatomic) IBOutlet UILabel *aaaa;

@end
