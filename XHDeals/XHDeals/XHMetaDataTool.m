//
//  XHMetaDataTool.m
//  XHDeals
//
//  Created by 00 on 15/7/7.
//  Copyright (c) 2015年 wxh. All rights reserved.
//

#import "XHMetaDataTool.h"
#import "CategoryModel.h"

static NSArray *_categories = nil;
@implementation XHMetaDataTool
+(NSArray *)categories{
    if (!_categories) {
        _categories = [self getAndParseCategoryFile:@"categories.plist"];
    }
    return _categories;
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
