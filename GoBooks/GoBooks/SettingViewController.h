//
//  SettingViewController.h
//  GoBooks
//
//  Created by xu on 16/4/18.
//  Copyright © 2016年 GBSeventh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingViewController : UIViewController
- (IBAction)back1Action:(UIBarButtonItem *)sender;
- (IBAction)pickAction:(UITapGestureRecognizer *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *photoIV;
- (IBAction)pick1Action:(UIButton *)sender forEvent:(UIEvent *)event;


@end
