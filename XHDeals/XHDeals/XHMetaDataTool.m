//
//  XHMetaDataTool.m
//  XHDeals
//
//  Created by 00 on 15/7/7.
//  Copyright (c) 2015年 wxh. All rights reserved.
//

#import "XHMetaDataTool.h"
#import "CategoryModel.h"
#import "XHCity.h"
#import "XHRegion.h"
#import "XHCityGroup.h"


@implementation XHMetaDataTool
static dispatch_once_t once;

static NSArray *_cityGroups = nil;
//城市分组相关
+(NSArray *)cityGroups{
    static dispatch_once_t once2;
    dispatch_once(&once2, ^{
        _cityGroups = [[self alloc] getAndParseCityGroups:@"cityGroups.plist"];
    });
    return [_cityGroups copy];
}

-(NSArray *)getAndParseCityGroups:(NSString *)fileName{
    NSString *cityGroupsPath = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    NSArray *dataArray = [NSArray arrayWithContentsOfFile:cityGroupsPath];
    NSMutableArray *mutArray = [NSMutableArray new];
    
    for (NSDictionary *dataDic in dataArray) {
        XHCityGroup *cityGroup = [XHCityGroup parseCityGroupData:dataDic];
        [mutArray addObject:cityGroup];
    }
    return [mutArray copy];
}
//城市相关
static NSArray* _citys = nil;
+(NSArray *)citys{
    
    dispatch_once(&once, ^{
        _citys = [[self alloc] getAndParseCityFile:@"cities.plist"];
    });
    return [_citys copy];
}

-(NSArray *)getAndParseCityFile:(NSString *)fileName{
    NSString *cityFilePath = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    NSArray *dataArray = [NSArray arrayWithContentsOfFile:cityFilePath];
    
    NSMutableArray *mutArray = [NSMutableArray new];
    
    for (NSDictionary *cityDic in dataArray) {
        XHCity *city = [XHCity parseCityData:cityDic];
        [mutArray addObject:city];
    }
    return [mutArray copy];
}


//分类相关
static NSArray *_categories = nil;
+(NSArray *)categories{
    if (!_categories) {
        _categories = [self getAndParseCategoryFile:@"categories.plist"];
    }
    return _categories;
}

//返回某个城市的所有区域
+(NSArray *)regionsByCityName:(NSString *)cityName{
    if(cityName.length == 0){
        return nil;
    }
    XHCity *city = [self cityByName:cityName];
    
    NSMutableArray *dataMutableArray = [NSMutableArray new];
    
    for (NSDictionary *regionDic in city.regions) {
        XHRegion *region = [XHRegion parseRegionData:regionDic];
        [dataMutableArray addObject:region];
    }
    return [dataMutableArray copy];
}

+(XHCity *)cityByName:(NSString *)cityName{
    if (cityName.length == 0) {
        return nil;
    }
    for (XHCity *city in self.citys) {
        if ([city.name isEqualToString:cityName]) {
            return city;
        }
    }
    return nil;
}


+(NSArray *)getAndParseCategoryFile:(NSString *)fileName{
    NSString *categoryFilePath = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    NSArray *dataArray = [NSArray arrayWithContentsOfFile:categoryFilePath];
    NSMutableArray *mutArray = [NSMutableArray new];
    
    for (NSDictionary *categoryDic in dataArray) {
        CategoryModel *category = [CategoryModel parseCategoryData:categoryDic];
        [mutArray addObject:category];
    }
    return [mutArray copy];
}
@end
