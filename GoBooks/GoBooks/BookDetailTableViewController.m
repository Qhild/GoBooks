//
//  BookDetailTableViewController.m
//  GoBooks
//
//  Created by Q on 16/4/22.
//  Copyright © 2016年 GBSeventh. All rights reserved.
//

#import "BookDetailTableViewController.h"
#import "ParallaxHeaderView.h"
#import "StoryCommentCell.h"

@interface BookDetailTableViewController ()

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;


@property (nonatomic) NSDictionary *story;

@end

@implementation BookDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIButton *backHbc = [[UIButton alloc]init];
//    backHbc.frame = CGRectMake(10, 10, 50, 50);
//    [backHbc setTitle:@"返回上一页" forState:UIControlStateNormal];
//    UIImage *imageHbc = [UIImage imageNamed:@"backHbc.png"];
//    [backHbc setBackgroundImage:imageHbc forState:UIControlStateHighlighted];
//    backHbc.font = [UIButton systemFontOfSize:30];
//    [backHbc addTarget:self action:@selector(backHbcClick:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:backHbc];
    
    _mainTableView.tableFooterView = [[UIView alloc]init];
    [StoryCommentCell setTableViewWidth:self.mainTableView.frame.size.width];


//  self.navigationController.navigationBarHidden=YES;
    ParallaxHeaderView *headerView = [ParallaxHeaderView parallaxHeaderViewWithCGSize:CGSizeMake(self.mainTableView.frame.size.width, 180)];
    
//    ParallaxHeaderView *headerView =  [[ParallaxHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.mainTableView.frame.size.width, 180)];

    
//    ParallaxHeaderView *headerView = [[ParallaxHeaderView alloc] initWithFrame:CGRectMake(0, 0,self.mainTableView.frame.size.width, 180)];
//    [headerView initialSetup];
//    return headerView;
    
    
    headerView.headerTitleLabel.text = self.story[@"story"];
    headerView.headerImage = [UIImage imageNamed:@"武侠"];
    
    [self.mainTableView setTableHeaderView:headerView];
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
    NSInteger numOfRows = [self.story[kCommentsKey] count];
    return numOfRows;
}

//

#pragma mark -
#pragma mark UISCrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.mainTableView)
    {
        // pass the current offset of the UITableView so that the ParallaxHeaderView layouts the subViews.
        [(ParallaxHeaderView *)self.mainTableView.tableHeaderView layoutHeaderViewForScrollViewOffset:scrollView.contentOffset];
    }
}

#pragma mark -
#pragma mark UITableViewDatasource


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [self customCellForIndex:indexPath];
    NSDictionary *comment = self.story[kCommentsKey][indexPath.row];
    [(StoryCommentCell *)cell  configureCommentCellForComment:comment];
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cellHeight = 0.0;
    NSDictionary *commentDetails = self.story[kCommentsKey][indexPath.row];
    NSString *comment = commentDetails[kCommentKey];
    
    cellHeight += [StoryCommentCell cellHeightForComment:comment];
    return cellHeight;
}

- (UITableViewCell *)customCellForIndex:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    NSString * detailId = kCellIdentifier;
    cell = [self.mainTableView dequeueReusableCellWithIdentifier:detailId];
    if (!cell)
    {
        cell = [StoryCommentCell storyCommentCellForTableWidth:self.mainTableView.frame.size.width];
    }
    return cell;
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
