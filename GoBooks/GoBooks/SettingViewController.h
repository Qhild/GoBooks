//
//  SettingViewController.h
//  GoBooks
//
//  Created by xu on 16/4/19.
//  Copyright © 2016年 GBSeventh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingViewController : UIViewController
- (IBAction)touxiangAction:(UIButton *)sender forEvent:(UIEvent *)event;
@property (weak, nonatomic) IBOutlet UIImageView *photoIV;
- (IBAction)pickAction:(UITapGestureRecognizer *)sender;

@end
