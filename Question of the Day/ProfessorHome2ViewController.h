//
//  ProfessorHome2ViewController.h
//  Question of the Day
//
//  Created by Ogny on 4/19/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"
#import "SectionHomeViewController.h"
#import "SectionModel.h"

@interface ProfessorHome2ViewController : UIViewController

@property (strong, nonatomic) UserModel *userModel;
@property (strong, nonatomic) SectionModel *sectionModel;
@property (strong, nonatomic) NSString *course;
@property (weak, nonatomic) IBOutlet UITableView *sectionsTable;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end
