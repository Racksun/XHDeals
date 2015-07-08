//
//  XHSortViewController.m
//  XHDeals
//
//  Created by 00 on 15/7/8.
//  Copyright (c) 2015年 wxh. All rights reserved.
//

#import "XHSortViewController.h"
#import "XHMetaDataTool.h"
#import "XHSort.h"

@interface XHSortViewController ()

@end

@implementation XHSortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *sortArray = [XHMetaDataTool sorts];
    
    CGFloat buttonHeight = 30;
    CGFloat buttonWidth = 100;
    
    CGFloat buttonX = 15;
    CGFloat buttonY = 15;
    
    CGFloat buttonMargin = 15;
    
    for (NSUInteger i = 0; i < sortArray.count; ++i) {
        XHSort *sort = sortArray[i];
        
        UIButton *button = [[UIButton alloc] init];
        button.frame = CGRectMake(buttonX, buttonY + i * (buttonHeight + buttonMargin), buttonWidth, buttonHeight);
        [button setTitle:sort.label forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        
        [button setBackgroundImage:[UIImage imageNamed:@"btn_filter_normal"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"btn_filter_selected"] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
        [self.view addSubview:button];
    }
    
    self.preferredContentSize = CGSizeMake((buttonWidth + 2 * buttonMargin),(buttonHeight + buttonMargin) * sortArray.count + buttonY);
}

-(void)buttonClick:(UIButton *)button{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SortDidChange" object:nil userInfo:@{@"XHSelectedSort":[XHMetaDataTool sorts][button.tag]}];
}




@end
