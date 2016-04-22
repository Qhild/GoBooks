//
//  SiginViewController.m
//  GoBooks
//
//  Created by xu on 16/4/17.
//  Copyright © 2016年 GBSeventh. All rights reserved.
//

#import "SiginViewController.h"
#import "TabViewController.h"
@interface SiginViewController ()


@end

@implementation SiginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[StorageMgr singletonStorageMgr] addKey:@"SignUpSuccessfully" andValue:@NO];
}

//每一次这个页面出现的时候都会调用这个方法，并且时机点是页面将要出现之前
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //判断是否记忆了用户名
    if (![[Utilities getUserDefaults:@"Username"] isKindOfClass:[NSNull class]]) {
        //如果有记忆就把记忆显示在用户名文本输入框中
        _usernameTF.text = [Utilities getUserDefaults:@"Username"];
    }
}
//每一次这个页面出现的时候都会调用这个方法，并且时机点是页面已然出现以后
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidLoad];
    //判断是否是从注册页面注册成功后回到的这个登录页面
    if ([[[StorageMgr singletonStorageMgr]objectForKey:@"SignUpSuccessfully"] boolValue]) {
        //在自动登录前flag恢复为默认的NO
        [[StorageMgr singletonStorageMgr]removeObjectForKey:@"SignUpSuccessfully"];
        [[StorageMgr singletonStorageMgr] addKey:@"SignUpSuccessfully" andValue:@NO];
        //从单例化全局变量中提取用户名和密码
        NSString *username = [[StorageMgr singletonStorageMgr]objectForKey:@"Username"];
        NSString *password = [[StorageMgr singletonStorageMgr]objectForKey:@"Password"];
        //清除用完的用户名和密码
        [[StorageMgr singletonStorageMgr]removeObjectForKey:@"Username"];
        [[StorageMgr singletonStorageMgr]removeObjectForKey:@"Password"];
        //执行自动登录
        [self signInWithUsername:username andPassword:password];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)popUpHome {
    //根据故事版的名称和故事版中页面的名称获得这个页面
    
    TabViewController *tabVC = [Utilities getStoryboardInstance:@"Main" byIdentity:@"Tab"];
    [self presentViewController:tabVC animated:YES completion:nil];
    
    
}
/*

 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
//封装登录操作
-(void)signInWithUsername:(NSString *)username andPassword:(NSString *)password{
    UIActivityIndicatorView *avi = [Utilities getCoverOnView:self.view];
    //开始登录
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error){
        //登录完成的回调
        [avi stopAnimating];
        //判断登录是否完成
        if (user) {
            NSLog(@"登录成功");
            //记忆用户名
            [Utilities setUserDefaults:@"Username" content:username];
            //将密码文本输入框中的内容清掉
            _passwordTF.text = @"";
            //跳转到首页
            [self popUpHome];
        }else{
            switch (error.code) {
                case 101:
                    [Utilities popUpAlertViewWithMsg:@"用户名或密码错误" andTitle:nil onView:self];
                    break;
                case 100:
                    [Utilities popUpAlertViewWithMsg:@"网络不给力，请稍后再试" andTitle:nil onView:self];
                    break;
                default:
                    [Utilities popUpAlertViewWithMsg:@"服务器正在维护，请稍候再试"andTitle:nil onView:self];
                    break;
            }
        }
    }];
    
}


- (IBAction)siginAction:(UIButton *)sender forEvent:(UIEvent *)event {
    NSString *username = _usernameTF.text;
    NSString *password = _passwordTF.text;
    if (username.length == 0 || password.length == 0) {
        [Utilities popUpAlertViewWithMsg:@"请填写所有信息" andTitle:nil onView:self];
        return;
    }
    //执行登录
    [self signInWithUsername:username andPassword:password];
}

- (IBAction)backAction:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
