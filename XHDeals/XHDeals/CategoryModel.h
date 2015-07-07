//
//  CategoryModel.h
//  XHDeals
//
//  Created by 00 on 15/7/7.
//  Copyright (c) 2015年 wxh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSArray *subcategories;

@property (nonatomic, copy) NSString *highlighted_icon;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *small_highlighted_icon;
@property (nonatomic, copy) NSString *small_icon;
@property (nonatomic, copy) NSString *map_icon;

+(instancetype)parseCategoryData:(NSDictionary *)dict;
@end
