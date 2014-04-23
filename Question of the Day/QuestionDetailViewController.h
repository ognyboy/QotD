//
//  QuestionDetailViewController.h
//  Question of the Day
//
//  Created by Ogny on 4/21/14.
//  Copyright (c) 2014 dognean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"
#import "SectionModel.h"
#import "QuestionModel.h"

@interface QuestionDetailViewController : UIViewController

@property (strong, nonatomic) UserModel *userModel;
@property (strong, nonatomic) SectionModel *sectionModel;
@property (strong, nonatomic) QuestionModel *questionModel;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollStuff;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@property (strong, nonatomic) IBOutlet UIView *topView;

@property (weak, nonatomic) IBOutlet UILabel *topicDetail;
@property (weak, nonatomic) IBOutlet UILabel *promptDetail;
@property (weak, nonatomic) IBOutlet UILabel *aDetail;
@property (weak, nonatomic) IBOutlet UILabel *bDetail;
@property (weak, nonatomic) IBOutlet UILabel *cDetail;
@property (weak, nonatomic) IBOutlet UILabel *dDetail;
@property (weak, nonatomic) IBOutlet UILabel *correctDetail;
@property (weak, nonatomic) IBOutlet UILabel *hintDetail;
@property (weak, nonatomic) IBOutlet UILabel *explanationDetail;
@property (weak, nonatomic) IBOutlet UILabel *titleDetail;
@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UILabel *t;
@property (weak, nonatomic) IBOutlet UILabel *p;
@property (weak, nonatomic) IBOutlet UILabel *a;
@property (weak, nonatomic) IBOutlet UILabel *b;
@property (weak, nonatomic) IBOutlet UILabel *c;
@property (weak, nonatomic) IBOutlet UILabel *d;
@property (weak, nonatomic) IBOutlet UILabel *co;
@property (weak, nonatomic) IBOutlet UILabel *hi;
@property (weak, nonatomic) IBOutlet UILabel *e;
@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@end
