//
//  HMNavigationController.m
//  MeiTuan
//
//  Created by mac on 2017/7/31.
//  Copyright © 2017年 Wan Yuansun. All rights reserved.
//
#import "HMNavigationController.h"
#import "HMBaseController.h"
@interface HMNavigationController ()

@end

@implementation HMNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //隐藏导航控制器自带的导航条
    self.navigationBar.hidden = YES;
}


- (void)pushViewController:(HMBaseController *)viewController animated:(BOOL)animated {
    [super pushViewController:viewController animated:animated];
    
    //给导航根控制器以外的控制器添加左边返回按钮
    if (self.childViewControllers.count > 1) {
        
        viewController.navItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_backItem"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    }
}

//监听方法 点击返回
- (void)back {
    [self popViewControllerAnimated:YES];
}

//实现此方法让子控制器去设置状态栏的样式
- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}




@end
