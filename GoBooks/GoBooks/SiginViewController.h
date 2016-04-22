//
//  SiginViewController.h
//  GoBooks
//
//  Created by xu on 16/4/17.
//  Copyright © 2016年 GBSeventh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SiginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
- (IBAction)siginAction:(UIButton *)sender forEvent:(UIEvent *)event;
- (IBAction)backAction:(UIBarButtonItem *)sender;


@end
