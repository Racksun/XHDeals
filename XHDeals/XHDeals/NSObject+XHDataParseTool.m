//
//  NSObject+XHDataParseTool.m
//  XHDeals
//
//  Created by 00 on 15/7/7.
//  Copyright (c) 2015年 wxh. All rights reserved.
//

#import "NSObject+XHDataParseTool.h"

@implementation NSObject (XHDataParseTool)

+(instancetype)objectWithFilename:(NSString *)filename{
    NSString *file = [[NSBundle mainBundle] pathForResource:filename ofType:nil];
    return [self objectWithFile:file];
}

+(instancetype)objectWithFile:(NSString *)file{
    NSDictionary *keyValues = [NSDictionary dictionaryWithContentsOfFile:file];
    return [self objectWithKeyValues:keyValues];
}

+(instancetype)objectWithKeyValues:(NSDictionary *)keyValues{

    id model = [[self alloc] init];
    //[model setKeyValues:keyValues];
    return model;
}

//+(instancetype)setKeyValues:(NSDictionary *)keyValues{
//   
//}

@end
