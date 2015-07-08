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
#import "XHSortViewController.h"
#import "XHSort.h"

@interface XHHomeCVC ()
//导航栏控件
@property (weak, nonatomic)XHNaviItemView *sortItemView;
@property (weak, nonatomic)XHNaviItemView *categoryItemView;

//弹出控制器
@property (nonatomic, strong) UIPopoverController *categoryPopover;
@property (nonatomic, strong) UIPopoverController *districtPopover;
@property (nonatomic, strong) UIPopoverController *sortPopover;


@end

@implementation XHHomeCVC

-(UIPopoverController *)sortPopover{
    if (!_sortPopover) {
        XHSortViewController *sortViewController = [[XHSortViewController alloc] init];
        self.sortPopover = [[UIPopoverController alloc] initWithContentViewController:sortViewController];
    }
    return _sortPopover;
}

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
    [self setUpListenEvent];
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
    self.categoryItemView = [XHNaviItemView item];
    self.categoryItemView.title = @"全部分类";
    self.categoryItemView.subtitle = @"全部";
    [self.categoryItemView setIcon:@"icon_category_-1" highIcon:@"icon_category_highlighted_-1"];
    [self.categoryItemView addTarget:self action:@selector(clickCategory)];
    UIBarButtonItem *categoryItem = [[UIBarButtonItem alloc] initWithCustomView:self.categoryItemView];
    
    //place
    XHNaviItemView *districtItemView = [XHNaviItemView item];
    districtItemView.title = @"深圳 － 全部";
    districtItemView.subtitle = @"全部";
    [districtItemView setIcon:@"icon_district" highIcon:@"icon_district_highlighted"];
    [districtItemView addTarget:self action:@selector(clickDistrict)];
    UIBarButtonItem *districtItem = [[UIBarButtonItem alloc] initWithCustomView:districtItemView];
    
    //sort
    self.sortItemView = [XHNaviItemView item];
    self.sortItemView.title = @"排序";
    self.sortItemView.subtitle = @"默认排序";
    [self.sortItemView addTarget:self action:@selector(clickSort)];
    UIBarButtonItem *sortItem = [[UIBarButtonItem alloc] initWithCustomView:self.sortItemView];
    
    
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
    [self.sortPopover presentPopoverFromBarButtonItem:self.navigationItem.leftBarButtonItems[3] permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];

}


#pragma mark -- 创建监听

-(void)setUpListenEvent{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(categoryDidChange:) name:@"CategoryDidChange" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(regionDidChange:) name:@"RegionDidChange" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sortDidChange:) name:@"SortDidChange" object:nil];
}

#pragma mark -- 监听出发方法
-(void)categoryDidChange:(NSNotification *)notification{
    NSString *selectedCategory = notification.userInfo[@"categoryName"];
    NSString *selectedSubCategory = notification.userInfo[@"subcategory"];
    self.categoryItemView.title = selectedCategory;
    self.categoryItemView.subtitle = selectedSubCategory;
    [self.categoryPopover dismissPopoverAnimated:YES];
}

-(void)regionDidChange:(NSNotification *)notification{
    
    
}

-(void)sortDidChange:(NSNotification *)notification{
    XHSort *selectedSort = notification.userInfo[@"XHSelectedSort"];
    self.sortItemView.subtitle = selectedSort.label;
    
    [self.sortPopover dismissPopoverAnimated:YES];
}

@end
