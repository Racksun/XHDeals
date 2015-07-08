//
//  XHSort.m
//  XHDeals
//
//  Created by 00 on 15/7/8.
//  Copyright (c) 2015年 wxh. All rights reserved.
//

#import "XHSort.h"

@implementation XHSort
+(instancetype)parseSortData:(NSDictionary *)dict{
    return [[self alloc] initWithDictionary:dict];
}

-(instancetype)initWithDictionary:dict{
    if (self == [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
