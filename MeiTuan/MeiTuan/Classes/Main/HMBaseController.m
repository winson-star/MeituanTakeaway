//
//  HMBaseController.m
//  MeiTuan
//
//  Created by mac on 2017/7/31.
//  Copyright © 2017年 Wan Yuansun. All rights reserved.
//

#import "HMBaseController.h"
#import "HMNavigationBar.h"
@interface HMBaseController ()

@end

@implementation HMBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    //把导航条添加到控制器的view上
    [self.view addSubview:_navBar];
    //设置约束
    [_navBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        make.height.offset(64);
    }];
    
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        //为每个控制器添加一个导航条
        HMNavigationBar *navBar = [[HMNavigationBar alloc] init];
        //为导航条添加UINavigationItem
        UINavigationItem *navItem = [[UINavigationItem alloc] init];
        //建立关系 把UINavigationItem设置到导航条上
        [navBar setItems:@[navItem]];
        //赋值
        _navBar = navBar;
        _navItem = navItem;
    }
    return self;
}

- (void)setStatusBarStyle:(UIStatusBarStyle)statusBarStyle {
    _statusBarStyle = statusBarStyle;
    //重新调用设置状态栏
    [self setNeedsStatusBarAppearanceUpdate];
}

//设置状态栏样式
- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return self.statusBarStyle;
}

//处理内存警告
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    if (self.isViewLoaded && self.view.window == nil) {
        
        self.view = nil;
    }
}



@end
