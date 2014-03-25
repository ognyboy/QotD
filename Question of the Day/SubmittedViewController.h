//
//  SubmittedViewController.h
//  Question of the Day
//
//  Created by Ogny on 3/22/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"
#import "QuestionModel.h"

@interface SubmittedViewController : UIViewController

@property (strong, nonatomic) UserModel *userModel;
@property (strong, nonatomic) QuestionModel *questionModel;
@property (strong) NSString *answer;

@property (weak, nonatomic) IBOutlet UILabel *responseText;
@property (weak, nonatomic) IBOutlet UILabel *ExplanationLabel;
@property (weak, nonatomic) IBOutlet UILabel *explanationTitle;
@property (weak, nonatomic) IBOutlet UIButton *retryButton;
@property (weak, nonatomic) IBOutlet UISwitch *switchExp;
@property (weak, nonatomic) IBOutlet UIButton *homeButton;

@end
