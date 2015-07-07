//
//  CategoryModel.m
//  XHDeals
//
//  Created by 00 on 15/7/7.
//  Copyright (c) 2015年 wxh. All rights reserved.
//

#import "CategoryModel.h"

@implementation CategoryModel

+(instancetype)parseCategoryData:(NSDictionary *)dict{
    return [[self alloc] initWithDic:dict];
}

-(instancetype)initWithDic:(NSDictionary *)dict{
    if (self == [super init]) {
        self.highlighted_icon = dict[@"highlighted_icon"];
        self.icon = dict[@"icon"];
        self.name = dict[@"name"];
        self.small_highlighted_icon = dict[@"small_highlighted_icon"];
        self.small_icon = dict[@"small_icon"];
        self.subcategories = dict[@"subcategories"];
    }
    return self;
}

@end
