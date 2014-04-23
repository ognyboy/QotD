//
//  TopicHome2ViewController.h
//  Question of the Day
//
//  Created by Ogny on 4/22/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"
#import "SectionModel.h"
#import "QuestionModel.h"
#import "SectionHomeViewController.h"

@interface TopicHome2ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *questionTable;
@property (weak, nonatomic) IBOutlet UITextField *dateField;
@property (strong, nonatomic) UserModel *userModel;
@property (strong, nonatomic) SectionModel *sectionModel;
@property (strong, nonatomic) NSString *topic;
@property (weak, nonatomic) IBOutlet UILabel *topicTitle;

@property (weak, nonatomic) IBOutlet UIButton *MondayButton;
@property (weak, nonatomic) IBOutlet UIButton *tuesdayButton;
@property (weak, nonatomic) IBOutlet UIButton *wednesdayButton;
@property (weak, nonatomic) IBOutlet UIButton *thursdayButton;
@property (weak, nonatomic) IBOutlet UIButton *fridayButton;
@property (weak, nonatomic) IBOutlet UIButton *saturdayButton;
@property (weak, nonatomic) IBOutlet UIButton *sundayButton;

@end
