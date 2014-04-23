//
//  TopicHomeViewController.h
//  Question of the Day
//
//  Created by Ogny on 4/21/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"
#import "SectionModel.h"
#import "QuestionModel.h"
#import "QuestionDetailViewController.h"

@interface TopicHomeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *topicTable;
@property (strong, nonatomic) UserModel *userModel;
@property (strong, nonatomic) SectionModel *sectionModel;
@property (strong, nonatomic) QuestionModel *questionModel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) NSString *topic;
@end
