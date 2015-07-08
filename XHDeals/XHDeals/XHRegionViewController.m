//
//  XHRegionViewController.m
//  XHDeals
//
//  Created by 00 on 15/7/8.
//  Copyright (c) 2015年 wxh. All rights reserved.
//

#import "XHRegionViewController.h"
#import "XHMetaDataTool.h"
#import "XHRegion.h"
#import "XHCityViewController.h"

@interface XHRegionViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) IBOutlet UITableView *secondTableView;
@property (nonatomic, strong) NSArray *regions;
@end

@implementation XHRegionViewController

-(NSArray *)regions{
    if (!_regions) {
        _regions = [XHMetaDataTool regionsByCityName:@"深圳"];
    }
    return _regions;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.mainTableView) {
        return self.regions.count;
    }else{
        NSIndexPath *selectPath = [self.mainTableView indexPathForSelectedRow];
        XHRegion *region = self.regions[selectPath.row];
        NSArray *subRegions = region.subregions;
        return subRegions.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.mainTableView) {
        static NSString *leftID = @"leftCell";
        UITableViewCell *leftCell = [tableView dequeueReusableCellWithIdentifier:leftID];
        
        if (!leftCell) {
            leftCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:leftID];
        }
        
        UIImageView *bg = [[UIImageView alloc] init];
        bg.image = [UIImage imageNamed:@"bg_dropdown_leftpart"];
        leftCell.backgroundView = bg;
        
        UIImageView *selectedBG = [[UIImageView alloc] init];
        selectedBG.image = [UIImage imageNamed:@"bg_dropdown_left_selected"];
        leftCell.selectedBackgroundView = selectedBG;
        
        
        XHRegion *region = self.regions[indexPath.row];
        leftCell.textLabel.text = region.name;
        
        if (region.subregions.count > 0) {
            leftCell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_cell_righArrow"]];
        }else{
            leftCell.accessoryView = nil;
        }
        return leftCell;
    }else{
        static NSString *rightID = @"rightCell";
        UITableViewCell *rightCell = [tableView dequeueReusableCellWithIdentifier:rightID];
        if (!rightCell) {
            rightCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:rightID];
        }
        
        UIImageView *bg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_dropdown_rightpart"]];
        rightCell.backgroundView = bg;
        
        UIImageView *selectedBG = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_dropdown_right_selected"]];
        rightCell.selectedBackgroundView = selectedBG;
        
        NSIndexPath *selectedIndexPath =[self.mainTableView indexPathForSelectedRow];
        XHRegion *region = self.regions[selectedIndexPath.row];
        
        NSArray *array = region.subregions;
        rightCell.textLabel.text = array[indexPath.row];
        return  rightCell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.mainTableView) {
        [self.secondTableView reloadData];
    }
}
- (IBAction)clickChangeCity:(id)sender {
    XHCityViewController *cityVC = [[XHCityViewController alloc] init];
    cityVC.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:cityVC animated:YES completion:nil];
}

@end
