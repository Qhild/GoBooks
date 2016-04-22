//
//  zhao2ViewController.h
//  GoBooks
//
//  Created by xu on 16/4/18.
//  Copyright © 2016年 GBSeventh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface zhao2ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UITextField *confirmPwdTF;
- (IBAction)zhaoAction:(UIButton *)sender forEvent:(UIEvent *)event;

@end
