//
//  RetrieveViewController.h
//  GoBooks
//
//  Created by xu on 16/4/22.
//  Copyright © 2016年 GBSeventh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RetrieveViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameTF;
@property (weak, nonatomic) IBOutlet UITextField *emailTF;
- (IBAction)xiayibuAction:(UIButton *)sender forEvent:(UIEvent *)event;

@end
