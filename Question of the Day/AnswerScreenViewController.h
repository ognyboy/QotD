//
//  AnswerScreenViewController.h
//  Question of the Day
//
//  Created by Ogny on 3/22/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"
#import "QuestionModel.h"
#import "SubmittedViewController.h"

@interface AnswerScreenViewController : UIViewController

@property (strong, nonatomic) UserModel *userModel;
@property (strong, nonatomic) QuestionModel *questionModel;
@property (weak, nonatomic) IBOutlet UILabel *answerText;
@property (weak, nonatomic) IBOutlet UILabel *aAnswer;
@property (weak, nonatomic) IBOutlet UILabel *bAnswer;
@property (weak, nonatomic) IBOutlet UILabel *cAnswer;
@property (weak, nonatomic) IBOutlet UILabel *dAnswer;
@property (weak, nonatomic) IBOutlet UIButton *submit;
@property (weak, nonatomic) IBOutlet UIButton *aButton;
@property (weak, nonatomic) IBOutlet UIButton *bButton;
@property (weak, nonatomic) IBOutlet UIButton *cButton;
@property (weak, nonatomic) IBOutlet UIButton *dButton;


@end
