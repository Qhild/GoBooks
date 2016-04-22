//
//  SettingViewController.h
//  GoBooks
//
//  Created by xu on 16/4/22.
//  Copyright © 2016年 GBSeventh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingViewController : UIViewController
- (IBAction)pickAction:(UITapGestureRecognizer *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *photoIV;
- (IBAction)portraitAction:(UIButton *)sender forEvent:(UIEvent *)event;

@end
