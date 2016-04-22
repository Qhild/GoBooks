//
//  SCPopView.h
//  GoBooks
//
//  Created by xu on 16/4/22.
//  Copyright © 2016年 GBSeventh. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SCPopViewDelegate <NSObject>

@optional
- (void)viewHeight:(CGFloat)height;
- (void)itemPressedWithIndex:(NSInteger)index;

@end

@interface SCPopView : UIView

@property (nonatomic, weak)     id      <SCPopViewDelegate>delegate;
@property (nonatomic, strong)   NSArray *itemNames;

@end