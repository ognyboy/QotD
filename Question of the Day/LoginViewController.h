//
//  QotDViewController.h
//  Question of the Day
//
//  Created by Ogny on 3/17/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"
#import "StudentHomeViewController.h"

@interface LoginViewController : UIViewController

@property (strong, nonatomic) UserModel *userModel;
@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

@end
