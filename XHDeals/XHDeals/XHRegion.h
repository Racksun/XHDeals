//
//  XHRegion.h
//  XHDeals
//
//  Created by 00 on 15/7/8.
//  Copyright (c) 2015年 wxh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XHRegion : NSObject
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSArray * subregions;

+(instancetype)parseRegionData:(NSDictionary *)dict;
@end
