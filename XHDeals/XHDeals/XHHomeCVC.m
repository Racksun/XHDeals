//
//  XHHomeCVC.m
//  XHDeals
//
//  Created by 00 on 15/7/6.
//  Copyright (c) 2015年 wxh. All rights reserved.
//

#import "XHHomeCVC.h"
#import "XHNaviItemView.h"
#import "XHCategoryController.h"
#import "XHRegionViewController.h"

@interface XHHomeCVC ()
//弹出控制器
@property (nonatomic, strong) UIPopoverController *categoryPopover;
@property (nonatomic, strong) UIPopoverController *districtPopover;
@end

@implementation XHHomeCVC

-(UIPopoverController *)categoryPopover{
    if (!_categoryPopover) {
        XHCategoryController *categoryViewController = [[XHCategoryController alloc] init];
        self.categoryPopover = [[UIPopoverController alloc] initWithContentViewController:categoryViewController];
    }
    return _categoryPopover;
}

-(UIPopoverController *)districtPopover{
    if (!_districtPopover) {
        XHRegionViewController *regionViewController = [[XHRegionViewController alloc] init];
        _districtPopover = [[UIPopoverController alloc] initWithContentViewController:regionViewController];
    }
    return _districtPopover;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor yellowColor];
    [self setupLeftNav];
    [self setupRightNav];
}

#pragma mark -- 设置导航栏
-(void)setupRightNav{
    
 
    //mapButton
    UIButton *mapButton = [[UIButton alloc] init];
    [mapButton setImage:[UIImage imageNamed:@"icon_map"] forState:UIControlStateNormal];
    [mapButton setImage:[UIImage imageNamed:@"icon_map_highlighted"] forState:UIControlStateHighlighted];
    
    [mapButton addTarget:self action:@selector(clickMap) forControlEvents:UIControlEventTouchUpInside];
    mapButton.frame = CGRectMake(0, 0, 50, 40);
    UIBarButtonItem *mapItem = [[UIBarButtonItem alloc] initWithCustomView:mapButton];

    
    //searchButton
    UIButton *searchButton = [[UIButton alloc] init];
    [searchButton setImage:[UIImage imageNamed:@"icon_search"] forState:UIControlStateNormal];
    [searchButton setImage:[UIImage imageNamed:@"icon_search_highlighted"] forState:UIControlStateHighlighted];
    
    [searchButton addTarget:self action:@selector(clickSearch) forControlEvents:UIControlEventTouchUpInside];
    searchButton.frame = CGRectMake(0, 0, 50, 40);
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc] initWithCustomView:searchButton];
    
    
    
    self.navigationItem.rightBarButtonItems = @[mapItem,searchItem];
    
    
    
}

-(void)setupLeftNav{
  
    
    UIBarButtonItem *logoItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_meituan_logo"] style:UIBarButtonItemStyleDone target:nil action:nil];
    logoItem.enabled = NO;
    
    
    //category
    XHNaviItemView *categoryItemView = [XHNaviItemView item];
    categoryItemView.title = @"全部分类";
    categoryItemView.subtitle = @"全部";
    [categoryItemView setIcon:@"icon_category_-1" highIcon:@"icon_category_highlighted_-1"];
    [categoryItemView addTarget:self action:@selector(clickCategory)];
    UIBarButtonItem *categoryItem = [[UIBarButtonItem alloc] initWithCustomView:categoryItemView];
    
    //place
    XHNaviItemView *districtItemView = [XHNaviItemView item];
    districtItemView.title = @"深圳 － 全部";
    districtItemView.subtitle = @"全部";
    [districtItemView setIcon:@"icon_district" highIcon:@"icon_district_highlighted"];
    [districtItemView addTarget:self action:@selector(clickDistrict)];
    UIBarButtonItem *districtItem = [[UIBarButtonItem alloc] initWithCustomView:districtItemView];
    
    //sort
    XHNaviItemView *sortItemView = [XHNaviItemView item];
    sortItemView.title = @"排序";
    sortItemView.subtitle = @"默认排序";
    [sortItemView addTarget:self action:@selector(clickSort)];
    UIBarButtonItem *sortItem = [[UIBarButtonItem alloc] initWithCustomView:sortItemView];
    
    
    self.navigationItem.leftBarButtonItems = @[logoItem, categoryItem,districtItem,sortItem];
    
}

#pragma mark -- BarButtonItem click
-(void)clickMap{
    
}

-(void)clickSearch{
    

}
-(void)clickCategory{
    [self.categoryPopover presentPopoverFromBarButtonItem:self.navigationItem.leftBarButtonItems[1] permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];

}

-(void)clickDistrict{
    [self.districtPopover presentPopoverFromBarButtonItem:self.navigationItem.leftBarButtonItems[2] permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

-(void)clickSort{

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
