//
//  HMShopController.m
//  MeiTuan
//
//  Created by mac on 2017/7/31.
//  Copyright © 2017年 Wan Yuansun. All rights reserved.
//

#import "HMShopController.h"
#import "HMFoodDetailController.h"
#import "HMNavigationBar.h"

//头部视图的最大和最小高度
#define KShopHeaderViewMaxHeight   180
#define KShopHeaderViewMinHeight   64
@interface HMShopController ()
//头部视图
@property (nonatomic, weak) UIView *shopHeaderView;
//右侧分享按钮
@property (nonatomic, strong) UIBarButtonItem *rightButtonItem;
@end

@implementation HMShopController

- (void)viewDidLoad {
    
    //先添加导航条
    [self setupUI];
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    //设置导航条的标题
    self.navItem.title = @"绝味鸭脖";
    //设置导航条标题文字颜色完全透明
    self.navBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithWhite:0.4 alpha:0]};
    //默认导航条的背景图片完全透明
    self.navBar.bgImageView.alpha = 0;
    //设置导航条右边分享按钮
    _rightButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_share"] style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navItem.rightBarButtonItem = _rightButtonItem;
    self.navBar.tintColor = [UIColor whiteColor];
}

- (void)setupUI {
    
    UIView *shopHeaderView = [[UIView alloc] init];
    shopHeaderView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:shopHeaderView];
    //设置约束
    [shopHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        make.height.offset(KShopHeaderViewMaxHeight);
    }];
    //添加平移手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    [self.view addGestureRecognizer:pan];
    //赋值
    _shopHeaderView = shopHeaderView;
}

- (void)panGesture:(UIPanGestureRecognizer *)pan {
    
    //获取平移的距离
    CGPoint p = [pan translationInView:pan.view];
    //头部视图的高度
    CGFloat shopHeaderViewUpdateHeight = _shopHeaderView.bounds.size.height;
    
    [_shopHeaderView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        if (p.y + shopHeaderViewUpdateHeight < KShopHeaderViewMinHeight) {
            
            make.height.offset(KShopHeaderViewMinHeight);
        } else if (p.y + shopHeaderViewUpdateHeight >= KShopHeaderViewMaxHeight) {
            
            make.height.offset(KShopHeaderViewMaxHeight);
        } else {
            
            make.height.offset(p.y + shopHeaderViewUpdateHeight);
        }
    }];
    //设置导航条背景图片的透明度
    CGFloat alpha = [@(shopHeaderViewUpdateHeight) resultWithValue1:HMValueMake(64, 1) andValue2:HMValueMake(180, 0)];
    self.navBar.bgImageView.alpha = alpha;
    //设置导航条标题文字颜色和导航条背景变化是一样的
    self.navBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithWhite:0.4 alpha:alpha]};
    
    //计算分享按钮的白色值
    CGFloat White = [@(shopHeaderViewUpdateHeight) resultWithValue1:HMValueMake(64, 0.4) andValue2:HMValueMake(180, 1)];
    //设置分享按钮的颜色
    self.navBar.tintColor = [UIColor colorWithWhite:White alpha:1];
    
    // 判断高度值180用白色状态栏否则用黑色
    if (shopHeaderViewUpdateHeight == KShopHeaderViewMaxHeight && self.statusBarStyle != UIStatusBarStyleLightContent) {
        //白色
        self.statusBarStyle = UIStatusBarStyleLightContent;
        
    } else if (shopHeaderViewUpdateHeight == KShopHeaderViewMinHeight && self.statusBarStyle != UIStatusBarStyleDefault){
        //黑色
        self.statusBarStyle = UIStatusBarStyleDefault;
    }
    //恢复到初始值
    [pan setTranslation:CGPointZero inView:pan.view];
}

@end
