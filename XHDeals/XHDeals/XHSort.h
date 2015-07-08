//
//  XHSort.h
//  XHDeals
//
//  Created by 00 on 15/7/8.
//  Copyright (c) 2015年 wxh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XHSort : NSObject
@property (nonatomic, copy) NSString *label;
@property (nonatomic, strong) NSNumber *value;

+(instancetype)parseSortData:(NSDictionary *)dict;
@end
