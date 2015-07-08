//
//  XHCityViewController.m
//  XHDeals
//
//  Created by 00 on 15/7/8.
//  Copyright (c) 2015年 wxh. All rights reserved.
//

#import "XHCityViewController.h"
#import "XHMetaDataTool.h"
#import "XHCityGroup.h"

@interface XHCityViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSArray *cityGroups;
@end

@implementation XHCityViewController

-(NSArray *)cityGroups{
    if (!_cityGroups) {
        _cityGroups = [XHMetaDataTool cityGroups];
    }
    return _cityGroups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark -- tableviewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.cityGroups.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    XHCityGroup *cityGroup = self.cityGroups[section];
    return cityGroup.cities.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"city";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    XHCityGroup *group = self.cityGroups[indexPath.section];
    cell.textLabel.text = group.cities[indexPath.row];
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    XHCityGroup *cityGroup = self.cityGroups[section];
    return cityGroup.title;
}

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return [self.cityGroups valueForKeyPath:@"title"];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -- close
- (IBAction)clickClose:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
