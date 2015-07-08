//
//  XHCity.h
//  XHDeals
//
//  Created by 00 on 15/7/8.
//  Copyright (c) 2015年 wxh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XHCity : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *pinYin;
@property (nonatomic, copy) NSString *pinYinHead;
@property (nonatomic, strong) NSArray *regions;

+(id)parseCityData:(NSDictionary *)dataDic;
@end
