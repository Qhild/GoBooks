//
//  HomeViewController.m
//  GoBooks
//
//  Created by xu on 16/4/17.
//  Copyright © 2016年 GBSeventh. All rights reserved.
//

#import "HomeViewController.h"
#import "SDCycleScrollView.h"

@interface HomeViewController ()<SDCycleScrollViewDelegate>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.



//    self.view.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:0.99];
//    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"005.jpg"]];
//    backgroundView.frame = self.view.bounds;
//    [self.view addSubview:backgroundView];
//
//    UIScrollView *demoContainerView = [[UIScrollView alloc] initWithFrame:self.view.frame];
//    demoContainerView.contentSize = CGSizeMake(self.view.frame.size.width, 1200);
//    [self.view addSubview:demoContainerView];

//    self.title = @"轮播Demo";

    // 情景一：采用本地图片实现
    NSArray *imageNames = @[@"h1.jpg",@"h2.jpg",@"h3.jpg",@"h4.jpg"];

    // 情景三：图片配文字
    NSArray *titles = @[@"阅读让生活充实💪🏼",@"书是人类进步的阶梯",@"腹有诗书气自华",@"悠闲读书 意在怡情 情之所致"];

    CGFloat w = self.view.frame.size.width;

    // 本地加载 --- 创建不带标题的图片轮播器
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 44, w, 160) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
    //轮播点动画
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;

    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;

    cycleScrollView.titlesGroup = titles;
    [_CarouselView addSubview:cycleScrollView];
    cycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
}

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    
    [self.navigationController pushViewController:[NSClassFromString(@"DemoVCWithXib") new] animated:YES];
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


//当键盘右下角的按钮按了以后执行这个方法
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
//点击屏幕让键盘收回
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (IBAction)homebtn1:(UIButton *)sender forEvent:(UIEvent *)event {
}

- (IBAction)homebtn2:(UIButton *)sender forEvent:(UIEvent *)event {
}
- (IBAction)homebtn3:(UIButton *)sender forEvent:(UIEvent *)event {
}

- (IBAction)homebtn4:(UIButton *)sender forEvent:(UIEvent *)event {
}
@end
