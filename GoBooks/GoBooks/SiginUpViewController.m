//
//  SiginUpViewController.m
//  GoBooks
//
//  Created by xu on 16/4/17.
//  Copyright © 2016年 GBSeventh. All rights reserved.
//

#import "SiginUpViewController.h"

@interface SiginUpViewController ()

@end

@implementation SiginUpViewController

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
- (IBAction)siginUpAction:(UIButton *)sender forEvent:(UIEvent *)event {
    NSString *username = _usernameTF.text;
    NSString *email = _emailTF.text;
    NSString *password = _passwordTF.text;
    NSString *confirmPwd = _confirmPwdTF.text;
    if (username.length == 0 || email.length == 0 || password.length == 0 || confirmPwd.length == 0) {
        [Utilities popUpAlertViewWithMsg:@"请填写所有信息" andTitle:nil onView:self];
        return;
    }
    if (![password isEqualToString:confirmPwd]) {
        [Utilities popUpAlertViewWithMsg:@"确认密码保持一致" andTitle:nil onView:self];
        return;
    }
    
    //在Parse自带的User表中新建一行
    PFUser *user = [PFUser user];
    //设置用户名，邮箱和密码
    user.username = username;
    user.email = email;
    user.password = password;
    
    //让导航条失去交互能力
    self.navigationController.view.userInteractionEnabled = NO;
    //菊花转啊转
    UIActivityIndicatorView *avi = [Utilities getCoverOnView:self.view];
    //开始注册
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        //注册完成后的回调
        //让导航条恢复交互能力
        self.navigationController.view.userInteractionEnabled = YES;
        //菊花停转
        [avi stopAnimating];
        //判断注册是否成功
        if (succeeded) {
            NSLog(@"注册成功");
            //先将SignUpSuccessfully这个在单例化全局变量中的flag删除以保证该flag的唯一性
            [[StorageMgr singletonStorageMgr]removeObjectForKey:@"SignUpSuccessfully"];
            //然后将这个flag设置为YES来表示注册成功了
            [[StorageMgr singletonStorageMgr] addKey:@"SignUpSuccessfully" andValue:@YES];
            //在单例化全局变量中保存用户名和密码以供登录页面自动登录使用
            [[StorageMgr singletonStorageMgr] addKey:@"Username" andValue:username];
            [[StorageMgr singletonStorageMgr] addKey:@"Password" andValue:password];
            //将文本输入框中的内容清掉
            _passwordTF.text = @"";
            _confirmPwdTF.text = @"";
            _usernameTF.text = @"";
            _emailTF.text = @"";
            //回到登录页面
            [self.navigationController popToRootViewControllerAnimated:YES];
        }else{
            switch (error.code) {
                case 202:
                    [Utilities popUpAlertViewWithMsg:@"该用户名已被使用"andTitle:nil onView:self];
                    break;
                case 203:
                    [Utilities popUpAlertViewWithMsg:@"该电子邮箱已被使用"andTitle:nil onView:self];
                    break;
                case 100:
                    [Utilities popUpAlertViewWithMsg:@"网络不给力，请稍后再试"andTitle:nil onView:self];
                    break;
                case 125:
                    [Utilities popUpAlertViewWithMsg:@"该电子邮箱地址不存在"andTitle:nil onView:self];
                    break;
                default:
                    [Utilities popUpAlertViewWithMsg:@"服务器正在维护，请稍候再试"andTitle:nil onView:self];
                    break;
            }
        }
    }];
}

//当键盘右下角的按钮按了以后执行这个方法
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
//点击屏幕让键盘收回
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
@end

