//
//  XHHomeCVC.m
//  XHDeals
//
//  Created by 00 on 15/7/6.
//  Copyright (c) 2015年 wxh. All rights reserved.
//

#import "XHHomeCVC.h"

@interface XHHomeCVC ()

@end

@implementation XHHomeCVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor yellowColor];
    [self setupLeftNav];
    [self setupRightNav];
}

#pragma mark -- 设置导航栏
-(void)setupLeftNav{
    
}

-(void)setupRightNav{
    UIButton *mapButton = [[UIButton alloc] init];
    [mapButton setImage:[UIImage imageNamed:@"icon_map"] forState:UIControlStateNormal];
    [mapButton setImage:[UIImage imageNamed:@"icon_map_highlighted"] forState:UIControlStateHighlighted];
    
    [mapButton addTarget:self action:@selector(clickMap) forControlEvents:UIControlEventTouchUpInside];
    mapButton.frame = CGRectMake(0, 0, 50, 40);
    UIBarButtonItem *mapItem = [[UIBarButtonItem alloc] initWithCustomView:mapButton];
    self.navigationItem.rightBarButtonItem = mapItem;
    
    
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
