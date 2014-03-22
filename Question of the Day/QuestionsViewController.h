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

@interface QuestionsViewController : UIViewController

@property (strong, nonatomic) UserModel *userModel;
@property (strong, nonatomic) QuestionModel *questionModel;

@end
