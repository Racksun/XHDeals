//
//  XHCityGroup.h
//  XHDeals
//
//  Created by 00 on 15/7/8.
//  Copyright (c) 2015年 wxh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XHCityGroup : NSObject
@property (strong, nonatomic) NSArray *cities;
@property (strong, nonatomic) NSString *title;

+(instancetype)parseCityGroupData:(NSDictionary *)dict;
@end
