//
//  XHMetaDataTool.h
//  XHDeals
//
//  Created by 00 on 15/7/7.
//  Copyright (c) 2015年 wxh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XHMetaDataTool : NSObject
//返回所有城市
+(NSArray *)citys;

//返回分类组
+(NSArray *)categories;

//返回排序组
+(NSArray *)sorts;

//返回城市组
+(NSArray *)cityGroups;
+(NSArray *)regionsByCityName:(NSString *)cityName;

@end
