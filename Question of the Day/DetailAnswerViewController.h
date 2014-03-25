//
//  DetailAnswerViewController.h
//  Question of the Day
//
//  Created by Ogny on 3/24/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"
#import "QuestionModel.h"

@interface DetailAnswerViewController : UIViewController

@property (strong, nonatomic) UserModel *userModel;
@property (strong, nonatomic) QuestionModel *questionModel;

@end
