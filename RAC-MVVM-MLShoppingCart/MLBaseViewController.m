//
//  MLBaseViewController.m
//  Medicine
//
//  Created by Visoport on 11/1/17.
//  Copyright © 2017年 Visoport. All rights reserved.
//

#import "MLBaseViewController.h"


@interface MLBaseViewController ()
//{
//    Reachability *_reachability;
//}
@end

@implementation MLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)initWithViewModel:(id <MLBaseViewModelProtocol>)viewModel {
    
    self = [super init];
    if (self) {
    }
    return self;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    MLBaseViewController *viewController = [super allocWithZone:zone];
    
    @weakify(viewController)
    
    [[viewController rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
        
        @strongify(viewController)
        [viewController ml_addSubviews];
        [viewController ml_bindViewModel];
//        [viewController ml_estimateNetwork];
    }];
    
    [[viewController rac_signalForSelector:@selector(viewWillAppear:)] subscribeNext:^(id x) {
        
        @strongify(viewController)
        viewController.view.backgroundColor = [UIColor whiteColor];
        [viewController ml_getNewData];
    }];
    
    [[viewController rac_signalForSelector:@selector(viewWillDisappear:)] subscribeNext:^(id x) {
        
        @strongify(viewController)
        [viewController ml_dismissHUD];
    }];
    
    return viewController;
}

- (void)ml_bindViewModel{}
- (void)ml_addSubviews{}
- (void)ml_getNewData{}

- (void)ml_dismissHUD
{
//    [MLCommonTool dismissHUD];
}

//- (void)ml_estimateNetwork
//{
//    _reachability = [Reachability reachabilityForInternetConnection];
//    //网络状态改变时调用estimateNetwork方法
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(estimateNetwork) name:kReachabilityChangedNotification object:nil];
//    [_reachability startNotifier];
//    
//    //判断网络状态
////    [self networkNotReachable];
//}
//
//- (void)networkNotReachable
//{
//    MLNetWorkStatus status=[MLReachability networkStatus];
//    switch (status) {
//        case MLNetWorkStatusNotReachable:
//        {
//            [MLCommonTool showSuccesWithStatus:@"当前网络状态不可用"];
//            break;
//        }
//        default:
//            break;
//    }
//}
//
//
///**
// *  判断网络状态：包含2G,Edge,3G,4G可用和wifi可用和网络不可用
// *
// *  @return 网络状态
// */
//-(void)estimateNetwork
//{
//    MLNetWorkStatus status=[MLReachability networkStatus];
//    switch (status) {
//        case MLNetWorkStatus2G:
//        {
//            
//            [MLCommonTool showSuccesWithStatus:@"当前网络状态2G"];
//            break;
//        }
//        case MLNetWorkStatusEdge:
//        {
//            
//            [MLCommonTool showSuccesWithStatus:@"当前网络状态2.75G(Edge)"];
//            break;
//        }
//        case MLNetWorkStatus3G:
//        {
//            
//            [MLCommonTool showSuccesWithStatus:@"当前网络状态3G"];
//            break;
//        }
//        case MLNetWorkStatus4G:
//        {
//            
//            [MLCommonTool showSuccesWithStatus:@"当前网络状态4G"];
//            break;
//        }
//        case MLNetWorkStatusWifi:
//        {
//            
//            [MLCommonTool showSuccesWithStatus:@"当前网络状态wifi"];
//            break;
//        }
//        case MLNetWorkStatusNotReachable:
//        {
//            
//            [MLCommonTool showErrorWithStatus:@"当前网络状态不可用"];
//            break;
//        }
//        default:
//            break;
//    }
//}

- (void)hideTabBar:(BOOL)isHide animated:(BOOL)animated
{
    if (animated) {
        [UIView animateWithDuration:0.25 animations:^{
            self.tabBarController.tabBar.hidden = isHide;
        }];
    }
    else{
        self.tabBarController.tabBar.hidden = isHide;
    }
}


//停止网络状态监听，移除通知
-(void)dealloc
{
//    [_reachability stopNotifier];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
