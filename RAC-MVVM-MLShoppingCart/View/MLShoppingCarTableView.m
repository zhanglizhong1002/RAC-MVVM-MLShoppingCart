//
//  MLShoppingCarTableView.m
//  Medicine
//
//  Created by Visoport on 20/1/17.
//  Copyright © 2017年 Visoport. All rights reserved.
//

#import "MLShoppingCarTableView.h"
#import "MLShoppingCarTableViewCell.h"
#import "MLShoppingCarTableViewCellViewModel.h"
#import "MLShoppingCarTableViewModel.h"
#import "MLShoppingCarHeaderView.h"
#import "MLShoppingHeaderModel.h"
#import "MLShoppingBottomView.h"
#import "MLShoppingBottomViewModel.h"
#import "MLHerbsChoseView.h"


@interface MLShoppingCarTableView () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) MLShoppingCarTableViewModel *viewModel;
@property (nonatomic, strong) MLShoppingCarHeaderView *sectionHeaderView;
@property (nonatomic, strong) MLShoppingBottomView *bottomView;
@property (nonatomic, strong) MLShoppingBottomViewModel *bottomViewModel;
@property (nonatomic, strong) MLHerbsChoseView *choseView;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MLShoppingCarTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithViewModel:(id<MLBaseViewModelProtocol>)viewModel
{
    self.viewModel = (MLShoppingCarTableViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}


- (void)ml_setupViews
{
    [self addSubview:self.tableView];
    [self addSubview:self.bottomView];
}

- (void)updateConstraints {
    
    WS(weakSelf)
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(weakSelf);
//        make.bottom.equalTo(@(-44));
    }];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf);
        make.bottom.equalTo(weakSelf);
        make.height.equalTo(@(44));
    }];
    
    [super updateConstraints];
}

- (void)ml_bindViewModel
{
    [self.viewModel.refreshDataCommand execute:nil];
    
    @weakify(self);
    [self.viewModel.refreshEndSubject subscribeNext:^(id x) {
        @strongify(self);
        
        [self.tableView reloadData];
    }];
    
    [[self.viewModel.headerViewModel.selectClickSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(NSDictionary *dict) {

        NSInteger section = [[dict objectForKey:@"section"] integerValue];
        BOOL isSelect = [[dict objectForKey:@"select"] boolValue];

        for (int i = 0; i<[self.viewModel.dataArray[section] count]; i++) {
            MLShoppingCarModel *sectionModel = self.viewModel.dataArray[section][i];
            sectionModel.btnSelected = isSelect;
            
            MLShoppingHeaderModel *model = self.viewModel.headerViewModel.dataArray[section];
            model.sectionSelect = isSelect;
        }
        
        //判断是否全选---
        [self judgeSelectAll];
        [self clearingShop];
        [self.tableView reloadData];
    }];
    
    [[self.viewModel.headerViewModel.editClickSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(NSDictionary *dict) {
        
        NSInteger section = [[dict objectForKey:@"section"] integerValue];
        BOOL isSelect = [[dict objectForKey:@"select"] boolValue];
        
        for (int i = 0; i < [self.viewModel.dataArray[section] count]; i++) {
            MLShoppingCarModel *sectionModel = self.viewModel.dataArray[section][i];
            sectionModel.isEdit = isSelect;
            
            MLShoppingHeaderModel *model = self.viewModel.headerViewModel.dataArray[section];
            model.sectionEdit = isSelect;
        }
        
        //判断是否全选---
//        [self judgeSelectAll];
        [self clearingShop];
        [self.tableView reloadData];
    }];
    
    
    [[self.bottomViewModel.checkAllClickSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id x) {
        
        for (int i = 0; i < self.viewModel.dataArray.count; i ++) {
            for (int j = 0; j < [self.viewModel.dataArray[i] count]; j++) {
                MLShoppingCarModel *sectionModel = self.viewModel.dataArray[i][j];
                sectionModel.btnSelected = [x boolValue];
                
                MLShoppingHeaderModel *model = self.viewModel.headerViewModel.dataArray[i];
                // 编辑状态
                model.sectionSelect = [x boolValue];
            }
        }
        
        [self clearingShop];
        [self.tableView reloadData];
    }];
    
    [[self.bottomViewModel.clearingClickSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id x) {
        [self.viewModel.bottomClearingClickSubject sendNext:self.viewModel.dataArray];
    }];
    
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.viewModel.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.viewModel.dataArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MLShoppingCarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.viewModel = [[MLShoppingCarTableViewCellViewModel alloc] initWithModel:self.viewModel.dataArray[indexPath.section][indexPath.row]];
    
    [self bindTableViewCellViewModel:cell];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.viewModel.cellClickSubject sendNext:@(indexPath.row)];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    self.viewModel.headerViewModel.section = section;
    self.sectionHeaderView = [[MLShoppingCarHeaderView alloc] initWithViewModel:self.viewModel.headerViewModel];
    
    return self.sectionHeaderView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

#pragma mark --- 结算商品个数
-(void)clearingShop{
    
    float money = 0;
    NSInteger count = 0;
    
    for (int i = 0; i < self.viewModel.dataArray.count; i ++) {
        for (int j = 0; j < [self.viewModel.dataArray[i] count]; j++) {
            MLShoppingCarModel *sectionModel = self.viewModel.dataArray[i][j];
            if (sectionModel.btnSelected) {
                count = count + [sectionModel.quantity integerValue];
                
                CGFloat price = [sectionModel.quantity integerValue] * [sectionModel.goodPrice floatValue];
                money = money + price;
            }
        }
    }
    
    self.bottomView.moneyLabel.text = [NSString stringWithFormat:@"¥%.2f",money];
    [self.bottomView.clearingButton setTitle:[NSString stringWithFormat:@"结算(%lu)",(unsigned long)count] forState:UIControlStateNormal];
    
}

#pragma mark - 判断是否全选
- (void)judgeSelectAll
{
    NSInteger count = 0;
    NSInteger allCount = 0;
    for (int i = 0; i < self.viewModel.dataArray.count; i ++) {
        for (int j = 0; j < [self.viewModel.dataArray[i] count]; j++) {
            MLShoppingCarModel *sectionModel = self.viewModel.dataArray[i][j];
            if (sectionModel.btnSelected) {
                count = count + 1;
            }
            
            allCount = allCount + 1;
        }
    }
    
    //        判断是否全选
    if (count == allCount) {
        self.bottomView.checkAllButton.selected = YES;
    }else{
        self.bottomView.checkAllButton.selected = NO;
    }
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[MLShoppingCarTableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView.rowHeight = 100;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (MLShoppingBottomView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[MLShoppingBottomView alloc] initWithViewModel:self.bottomViewModel];
    }
    return _bottomView;
}

- (MLShoppingBottomViewModel *)bottomViewModel {
    if (!_bottomViewModel) {
        _bottomViewModel = [[MLShoppingBottomViewModel alloc] init];
    }
    return _bottomViewModel;
}

- (void)bindTableViewCellViewModel:(MLShoppingCarTableViewCell *)cell {
    
    
    [[cell.viewModel.selectBtnClickSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(MLShoppingCarTableViewCell *myCell) {
        
        NSIndexPath *myIndexPath = [self.tableView indexPathForCell:myCell];
        
        MLShoppingCarModel *sectionModel = self.viewModel.dataArray[myIndexPath.section][myIndexPath.row];
        
        if (sectionModel.btnSelected) {
            sectionModel.btnSelected = NO;
        }
        else
        {
            sectionModel.btnSelected = YES;
        }
        
        //判断是否全选
        [self judgeSelectAll];
        
        NSInteger sectionCount = 0;
        for (int i = 0; i < [self.viewModel.dataArray[myIndexPath.section] count]; i ++) {
            
            MLShoppingCarModel *sectionModel = self.viewModel.dataArray[myIndexPath.section][i];
            if (sectionModel.btnSelected) {
                sectionCount = sectionCount + 1;
            }
        }
        if (sectionCount == [self.viewModel.dataArray[myIndexPath.section] count]) {
            MLShoppingHeaderModel *model = self.viewModel.headerViewModel.dataArray[myIndexPath.section];
            model.sectionSelect = YES;
        }
        else
        {
            MLShoppingHeaderModel *model = self.viewModel.headerViewModel.dataArray[myIndexPath.section];
            model.sectionSelect = NO;
        }
        
        [self clearingShop];
        [self.tableView reloadData];
    }];
    
    
    [[cell.viewModel.addBtnClickSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(MLShoppingCarTableViewCell *myCell) {
        
        NSIndexPath *myIndexPath = [self.tableView indexPathForCell:myCell];
        
        MLShoppingCarModel *model = self.viewModel.dataArray[myIndexPath.section][myIndexPath.row];
        model.quantity = cell.editNumLabel.text;
        
        [self clearingShop];
        [self.tableView reloadData];
    }];
    
    [[cell.viewModel.reduceBtnClickSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(MLShoppingCarTableViewCell *myCell) {
        
        NSIndexPath *myIndexPath = [self.tableView indexPathForCell:myCell];
        
        MLShoppingCarModel *model = self.viewModel.dataArray[myIndexPath.section][myIndexPath.row];
        model.quantity = cell.editNumLabel.text;
        
        [self clearingShop];
        [self.tableView reloadData];
    }];
    
    [[cell.viewModel.deleteBtnClickSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(MLShoppingCarTableViewCell *myCell) {
        
        NSIndexPath *myIndexPath = [self.tableView indexPathForCell:myCell];
        
        if ([self.viewModel.dataArray[myIndexPath.section] count] == 1) {
            [self.viewModel.dataArray removeObjectAtIndex:myIndexPath.section];
            [self.viewModel.headerViewModel.dataArray removeObjectAtIndex:myIndexPath.section];
        }
        else
        {
            [self.viewModel.dataArray[myIndexPath.section] removeObjectAtIndex:myIndexPath.row];
        }
        
        [self clearingShop];
        [self.tableView reloadData];
    }];
    
    [[cell.viewModel.editsetBtnClickSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(MLShoppingCarTableViewCell *myCell) {
        
        [self.viewModel.hiddenTabbar sendNext:@(1)];
        
//        NSIndexPath *myIndexPath = [self.tableView indexPathForCell:myCell];
        
        self.choseView = [[[NSBundle mainBundle] loadNibNamed:@"MLHerbsChoseView" owner:self options:nil] objectAtIndex:0];
        self.choseView.frame = CGRectMake(0, kScreenHeight, kScreenWidth, kScreenHeight);
        self.choseView.backgroundColor = [UIColor clearColor];
        self.choseView.bgView.hidden = YES;
        [self addSubview:self.choseView];
        
        [self.choseView.dismissClickSubject subscribeNext:^(id x) {
            [self dismiss];
        }];
        [self btnselete];
    }];
}

/**
 *  点击按钮弹出
 */
-(void)btnselete
{
    [UIView animateWithDuration: 0.35 animations: ^{
        
        self.choseView.center = self.center;
        self.choseView.frame =CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    } completion:^(BOOL finished) {
        self.choseView.bgView.hidden = NO;
    }];
}

/**
 *  点击半透明部分或者取消按钮，弹出视图消失
 */
-(void)dismiss
{
    self.choseView.bgView.hidden = YES;
    [UIView animateWithDuration: 0.35 animations: ^{
        self.choseView.frame =CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height);
    } completion:^(BOOL finished) {
        [self.choseView removeFromSuperview];
        
        [self.viewModel.hiddenTabbar sendNext:@(0)];
    }];
    
}

@end
