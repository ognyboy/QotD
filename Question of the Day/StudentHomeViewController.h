//
//  StudentHomeViewController.h
//  Question of the Day
//
//  Created by Ogny on 3/20/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"

@interface StudentHomeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *studentHomeText;
@property (strong, nonatomic) UserModel *userModel;

@end
