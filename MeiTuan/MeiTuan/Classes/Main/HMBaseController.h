//
//  HMBaseController.h
//  MeiTuan
//
//  Created by mac on 2017/7/31.
//  Copyright © 2017年 Wan Yuansun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMNavigationBar;

@interface HMBaseController : UIViewController
//导航条
@property (nonatomic, strong, readonly) HMNavigationBar *navBar;
//模型属性navItem
@property (nonatomic, strong, readonly) UINavigationItem *navItem;
//状态栏样式
@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;

@end
