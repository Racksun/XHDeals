//
//  XHNaviItemView.m
//  XHDeals
//
//  Created by 00 on 15/7/7.
//  Copyright (c) 2015年 wxh. All rights reserved.
//

#import "XHNaviItemView.h"

@interface XHNaviItemView()
@property (weak, nonatomic) IBOutlet UIButton *itemButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;

@end

@implementation XHNaviItemView

-(void)setTitle:(NSString *)title{
    _title = title;
    self.titleLabel.text = title;
}

-(void)setSubtitle:(NSString *)subtitle{
    _subtitle = subtitle;
    self.subTitleLabel.text = subtitle;
}

-(void)setIcon:(NSString *)icon highIcon:(NSString *)highIcon{
    [self.itemButton setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [self.itemButton setImage:[UIImage imageNamed:highIcon] forState:UIControlStateHighlighted];
}


-(void)addTarget:(id)target action:(SEL)action{
    [self.itemButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

+(instancetype)item{
    return [[[NSBundle mainBundle] loadNibNamed:@"XHNaviItemView" owner:nil options:nil] lastObject];
}

@end
