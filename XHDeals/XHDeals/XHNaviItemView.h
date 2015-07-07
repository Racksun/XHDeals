//
//  XHNaviItemView.h
//  XHDeals
//
//  Created by 00 on 15/7/7.
//  Copyright (c) 2015年 wxh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XHNaviItemView : UIView

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

-(void)setIcon:(NSString *)icon highIcon:(NSString *)highIcon;
-(void)addTarget:(id)target action:(SEL)action;
+(instancetype)item;
@end
