//
//  HomeViewController.h
//  GoBooks
//
//  Created by xu on 16/4/17.
//  Copyright © 2016年 GBSeventh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISearchBar *searchFiled;
@property (weak, nonatomic) IBOutlet UIScrollView *CarouselView;
- (IBAction)homebtn1:(UIButton *)sender forEvent:(UIEvent *)event;
- (IBAction)homebtn2:(UIButton *)sender forEvent:(UIEvent *)event;
- (IBAction)homebtn3:(UIButton *)sender forEvent:(UIEvent *)event;
- (IBAction)homebtn4:(UIButton *)sender forEvent:(UIEvent *)event;

@end
