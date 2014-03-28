//
//  ChangePasswordViewController.h
//  Question of the Day
//
//  Created by Ogny on 3/28/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"

@interface ChangePasswordViewController : UIViewController

@property (strong, nonatomic) UserModel *userModel;
@property (weak, nonatomic) IBOutlet UITextField *confirmPassword;
@property (weak, nonatomic) IBOutlet UITextField *oldPassword;
@property (weak, nonatomic) IBOutlet UITextField *theNewPassword;

@end
