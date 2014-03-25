//
//  StudentHomeViewController.h
//  Question of the Day
//
//  Created by Ogny on 3/20/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"
#import "StatisticsViewController.h"
#import "QuestionsViewController.h"
#import "MenuViewController.h"
#import "NewQuestionsViewController.h"

@interface StudentHomeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *studentHomeText;
@property (strong, nonatomic) UserModel *userModel;

@property (weak, nonatomic) IBOutlet UIButton *questionsButton;
@property (weak, nonatomic) IBOutlet UIButton *statisticsButton;
@property (weak, nonatomic) IBOutlet UIButton *settingsButton;

@property (weak, nonatomic) IBOutlet UILabel *theNewLabel;

@end
