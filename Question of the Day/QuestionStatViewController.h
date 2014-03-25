//
//  QuestionStatViewController.h
//  Question of the Day
//
//  Created by Ogny on 3/24/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"
#import "QuestionModel.h"

@interface QuestionStatViewController : UIViewController

@property (strong, nonatomic) UserModel *userModel;
@property (strong, nonatomic) QuestionModel *questionModel;
@property (weak, nonatomic) IBOutlet UIButton *questionBut;
@property (weak, nonatomic) IBOutlet UITableView *attemptTableView;
@property (weak, nonatomic) IBOutlet UILabel *yourAnswer;
@property (weak, nonatomic) IBOutlet UILabel *correctLabel;
@property (weak, nonatomic) IBOutlet UILabel *attempts;

@end
