//
//  RetrieveTwoViewController.h
//  GoBooks
//
//  Created by xu on 16/4/22.
//  Copyright © 2016年 GBSeventh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RetrieveTwoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UITextField *confirmPwdTF;
- (IBAction)xiayibuAction:(UIButton *)sender forEvent:(UIEvent *)event;

@end
