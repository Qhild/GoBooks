//
//  zhaoViewController.h
//  GoBooks
//
//  Created by xu on 16/4/17.
//  Copyright © 2016年 GBSeventh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface zhaoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameTF;
- (IBAction)xiayibuAction:(UIButton *)sender forEvent:(UIEvent *)event;
@property (weak, nonatomic) IBOutlet UITextField *emailTF;

@end
