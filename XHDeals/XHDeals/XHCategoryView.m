//
//  XHCategoryView.m
//  XHDeals
//
//  Created by 00 on 15/7/7.
//  Copyright (c) 2015年 wxh. All rights reserved.
//

#import "XHCategoryView.h"
#import "CategoryModel.h"
#import "XHMetaDataTool.h"
@interface XHCategoryView()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) IBOutlet UITableView *secondTableView;
@property (strong, nonatomic) NSArray *categoryArray;
@end
@implementation XHCategoryView

-(NSArray *)categoryArray{
    if (!_categoryArray) {
        self.categoryArray = [XHMetaDataTool categories];
    }
    return _categoryArray;
}

+(instancetype)view{
    return [[[NSBundle mainBundle] loadNibNamed:@"XHCategoryView" owner:nil options:nil] lastObject];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.mainTableView) {
        return self.categoryArray.count;
    }else{
        NSIndexPath *selectedIndexPath = [self.mainTableView indexPathForSelectedRow];
        CategoryModel *selectedCategory = self.categoryArray[selectedIndexPath.row];
        return selectedCategory.subcategories.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.mainTableView) {
        static NSString *leftCellID = @"leftCell";
        
        UITableViewCell *leftCell = [tableView dequeueReusableCellWithIdentifier:leftCellID];
        
        if (!leftCell) {
            leftCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:leftCellID];
        }
        
        UIImageView *bg = [[UIImageView alloc] init];
        bg.image = [UIImage imageNamed:@"bg_dropdown_leftpart"];
        leftCell.backgroundView = bg;
        UIImageView *selectedBg = [[UIImageView alloc] init];
        selectedBg.image = [UIImage imageNamed:@"bg_dropdown_left_selected"];
        leftCell.selectedBackgroundView = selectedBg;
        
        CategoryModel *category = self.categoryArray[indexPath.row];
        leftCell.textLabel.text = category.name;
        
        if (category.small_icon) {
            leftCell.imageView.image = [UIImage imageNamed:category.small_icon];
        }
        if (category.small_highlighted_icon) {
            leftCell.imageView.image = [UIImage imageNamed:category.small_highlighted_icon];
        }
        
        if (category.subcategories.count > 0) {
            leftCell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_cell_rightArrow"]];
        }else{
            leftCell.accessoryView = nil;
        }
        return leftCell;
    }else{
        static NSString *rightCellID = @"rightCell";
        UITableViewCell *rightCell = [tableView dequeueReusableCellWithIdentifier:rightCellID];
        
        if (!rightCell) {
            rightCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:rightCellID
                         ];
        }
        
        UIImageView *bg = [[UIImageView alloc] init];
        bg.image = [UIImage imageNamed:@"dg_dropdown_leftpart"];
        rightCell.backgroundView = bg;
        
        NSIndexPath *index = [self.mainTableView indexPathForSelectedRow];
        CategoryModel *category = self.categoryArray[index.row];
        
        NSArray *subArray = category.subcategories;
        rightCell.textLabel.text = subArray[indexPath.row];
        
        UIImageView *selectBG = [[UIImageView alloc] init];
        selectBG.image = [UIImage imageNamed:@"bg_dropdown_left_selected"];
        rightCell.selectedBackgroundView = selectBG;
        return rightCell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (tableView == self.mainTableView) {
        [self.secondTableView reloadData];
    }else{
        NSIndexPath *mainSelectedIndex  = [self.mainTableView indexPathForSelectedRow];
        NSIndexPath *secondSelectedIndex = [self.secondTableView indexPathForSelectedRow];
        
        CategoryModel *category = self.categoryArray[mainSelectedIndex.row];
        NSString *subcategory = category.subcategories[secondSelectedIndex.row];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"CategoryDidChange" object:nil userInfo:@{@"categoryName" : category.name,@"subcategory" : subcategory}];
        
    }
}

@end
