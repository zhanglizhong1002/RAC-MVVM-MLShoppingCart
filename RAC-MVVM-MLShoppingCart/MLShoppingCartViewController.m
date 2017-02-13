//
//  MLShoppingCartViewController.m
//  Medicine
//
//  Created by Visoport on 17/1/17.
//  Copyright © 2017年 Visoport. All rights reserved.
//

#import "MLShoppingCartViewController.h"
#import "MLShoppingCarTableView.h"
#import "MLShoppingCarTableViewModel.h"
//#import "MLConfirmOrderTableViewController.h"

@interface MLShoppingCartViewController ()

@property (nonatomic, strong) MLShoppingCarTableView *tableView;
@property (nonatomic, strong) MLShoppingCarTableViewModel *viewModel;

@end

@implementation MLShoppingCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self hideTabBar:NO animated:YES];
}

- (void)ml_addSubviews
{
    [self.view addSubview:self.tableView];
    
    [self updateViewConstraints];
}

- (void)ml_bindViewModel
{
    [[self.viewModel.cellClickSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id x) {

    }];
    
    [[self.viewModel.bottomClearingClickSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id x) {
//        MLConfirmOrderTableViewController *vc = [MLConfirmOrderTableViewController instance];
//        vc.title = @"确认订单";
//        [self.navigationController pushViewController:vc animated:YES];
    }];
    
    
#pragma mark - 在有tabbar的情况下监听  项目需求   demo就不演示了
    //
//    [[self.viewModel.hiddenTabbar takeUntil:self.rac_willDeallocSignal] subscribeNext:^(NSNumber *x) {
//        if ([x  isEqual: @(1)]) {
//            [self hideTabBar:YES animated:YES];
//        }
//        else
//        {
//            [self hideTabBar:NO animated:NO];
//        }
//    }];
}

- (void)updateViewConstraints {
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [super updateViewConstraints];
}


- (MLShoppingCarTableView *)tableView
{
    if (!_tableView) {
        _tableView = [[MLShoppingCarTableView alloc] initWithViewModel:self.viewModel];
    }
    return _tableView;
}

- (MLShoppingCarTableViewModel *)viewModel
{
    if (!_viewModel) {
        _viewModel = [[MLShoppingCarTableViewModel alloc] init];
    }
    return _viewModel;
}

@end
