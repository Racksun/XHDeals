//
//  NaviC.m
//  XHDeals
//
//  Created by 00 on 15/7/6.
//  Copyright (c) 2015年 wxh. All rights reserved.
//

#import "NaviC.h"

@interface NaviC ()

@end

@implementation NaviC


+(void)initialize{
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"bg_navigationBar"] forBarMetrics:UIBarMetricsDefault];
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:21/255.0 green:188/255.0 blue:173/255.0 alpha:1]} forState:UIControlStateNormal];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateDisabled];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}




@end
