//
//  fenleiViewController.m
//  GoBooks
//
//  Created by xu on 16/4/22.
//  Copyright © 2016年 GBSeventh. All rights reserved.
//

#import "fenleiViewController.h"
#import "SCNavTabBarController.h"


@interface fenleiViewController ()

@end

@implementation fenleiViewController
#pragma mark
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIViewController *oneViewController = [[UIViewController alloc] init];
    oneViewController.title = @"图书";
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"IMG_20160419_173842.jpg"]];
    
    
    
    UIViewController *twoViewController = [[UIViewController alloc] init];
    twoViewController.title = @"童书";
    twoViewController.view.backgroundColor = [UIColor lightGrayColor];
    
    
    UIViewController *threeViewController = [[UIViewController alloc] init];
    threeViewController.title = @"幽默";
    threeViewController.view.backgroundColor = [UIColor whiteColor];
    
    UIViewController *fourViewController = [[UIViewController alloc] init];
    fourViewController.title = @"武侠";
    fourViewController.view.backgroundColor = [UIColor blackColor];
    
    UIViewController *fiveViewController = [[UIViewController alloc] init];
    fiveViewController.title = @"言情";
    
    fiveViewController.view.backgroundColor = [UIColor greenColor];
    UIViewController *sixViewController = [[UIViewController alloc] init];
    sixViewController.title = @"政治";
    sixViewController.view.backgroundColor = [UIColor cyanColor];
    
    UIViewController *sevenViewController = [[UIViewController alloc] init];
    sevenViewController.title = @"新闻";
    sevenViewController.view.backgroundColor = [UIColor yellowColor];
    
    UIViewController *eightViewController = [[UIViewController alloc] init];
    eightViewController.title = @"课本";
    eightViewController.view.backgroundColor = [UIColor blueColor];
    
    UIViewController *ninghtViewController = [[UIViewController alloc] init];
    ninghtViewController.title = @"科技";
    ninghtViewController.view.backgroundColor = [UIColor redColor];
    
    SCNavTabBarController *navTabBarController = [[SCNavTabBarController alloc] init];
    navTabBarController.subViewControllers = @[oneViewController, twoViewController, threeViewController, fourViewController, fiveViewController, sixViewController, sevenViewController, eightViewController, ninghtViewController];
    navTabBarController.showArrowButton = YES;
    [navTabBarController addParentController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
