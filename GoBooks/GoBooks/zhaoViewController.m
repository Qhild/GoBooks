//
//  zhaoViewController.m
//  GoBooks
//
//  Created by xu on 16/4/17.
//  Copyright © 2016年 GBSeventh. All rights reserved.
//

#import "zhaoViewController.h"

@interface zhaoViewController ()

@end

@implementation zhaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)xiayibuAction:(UIButton *)sender forEvent:(UIEvent *)event {
    NSString *username = _usernameTF.text;
    NSString *email = _emailTF.text;
    /*if (username.length == 0 || email.length == 0) {
        [Utilities popUpAlertViewWithMsg:@"请填写所有信息" andTitle:nil onView:self];
        return;
    }
    
    //让导航条失去交互能力
    self.navigationController.view.userInteractionEnabled = NO;
    //菊花转啊转
    UIActivityIndicatorView *avi = [Utilities getCoverOnView:self.view];
    */
}
@end
