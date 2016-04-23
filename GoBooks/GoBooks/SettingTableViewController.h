//
//  SettingTableViewController.h
//  GoBooks
//
//  Created by xu on 16/4/23.
//  Copyright © 2016年 GBSeventh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UITableViewCell *pickAction;
@property (weak, nonatomic) IBOutlet UIImageView *logo;

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *sex;

@end
