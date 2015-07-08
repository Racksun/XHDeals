//
//  XHCity.m
//  XHDeals
//
//  Created by 00 on 15/7/8.
//  Copyright (c) 2015年 wxh. All rights reserved.
//

#import "XHCity.h"

@implementation XHCity
+(id)parseCityData:(NSDictionary *)dataDic{
    return [[self alloc] initWithDictionary:dataDic];
}

-(instancetype)initWithDictionary:dataDic{
    if (self == [super init]) {
        [self setValuesForKeysWithDictionary:dataDic];
    }
    return self;
}
@end
