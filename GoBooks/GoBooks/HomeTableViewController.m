//
//  HomeTableViewController.m
//  GoBooks
//
//  Created by Q on 16/4/23.
//  Copyright © 2016年 GBSeventh. All rights reserved.
//

#import "HomeTableViewController.h"
#import "SDCycleScrollView.h"

@interface HomeTableViewController ()<SDCycleScrollViewDelegate>

@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _homeTableView.tableFooterView = [[UIView alloc]init];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}

- (IBAction)homebtn1:(UIButton *)sender forEvent:(UIEvent *)event {
}

- (IBAction)homebtn2:(UIButton *)sender forEvent:(UIEvent *)event {
}
- (IBAction)homebtn3:(UIButton *)sender forEvent:(UIEvent *)event {
}

- (IBAction)homebtn4:(UIButton *)sender forEvent:(UIEvent *)event {
}

//点击屏幕让键盘收回
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

//当键盘右下角的按钮按了以后执行这个方法
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
