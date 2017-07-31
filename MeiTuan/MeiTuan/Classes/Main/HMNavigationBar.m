//
//  HMNavigationBar.m
//  MeiTuan
//
//  Created by mac on 2017/7/31.
//  Copyright © 2017年 Wan Yuansun. All rights reserved.
//

#import "HMNavigationBar.h"

@implementation HMNavigationBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //设置导航条彻底透明并且没有阴影线
        [self setShadowImage:[UIImage new]];
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        
        UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_navigationBar_white"]];
        [self addSubview:bgImageView];
        
        [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.offset(0);
        }];
        
        _bgImageView = bgImageView;
        
    }
    return self;
}



@end
