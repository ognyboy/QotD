//
//  ProfessorHomeViewController.h
//  Question of the Day
//
//  Created by Ogny on 4/14/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"
#import "SectionHomeViewController.h"

@interface ProfessorHomeViewController : UIViewController

@property (strong, nonatomic) UserModel *userModel;

@property (weak, nonatomic) IBOutlet UITableView *coursesTable;

@end
