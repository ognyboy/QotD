//
//  MenuViewController.h
//  Question of the Day
//
//  Created by Ogny on 3/21/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentHomeViewController.h"
#import "UserModel.h"

@interface MenuViewController : UIViewController

@property (strong, nonatomic) UserModel *userModel;
@property (weak, nonatomic) IBOutlet UIButton *emailsButton;

@property (weak, nonatomic) IBOutlet UIButton *notificationButton;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIButton *changePassword;
@end
