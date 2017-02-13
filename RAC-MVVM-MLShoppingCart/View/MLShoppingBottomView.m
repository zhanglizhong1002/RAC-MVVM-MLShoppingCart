//
//  MLShoppingBottomView.m
//  Medicine
//
//  Created by Visoport on 7/2/17.
//  Copyright © 2017年 Visoport. All rights reserved.
//

#import "MLShoppingBottomView.h"

@interface MLShoppingBottomView ()

//@property (nonatomic, strong) UIButton *checkAllButton;
@property (nonatomic, strong) UILabel *totalLabel;
@property (nonatomic, strong) UILabel *freightLabel;


@end

@implementation MLShoppingBottomView

- (instancetype)initWithViewModel:(id<MLBaseViewModelProtocol>)viewModel
{
    self.viewModel = (MLShoppingBottomViewModel *)viewModel;
    
    return [super initWithViewModel:viewModel];
}

- (void)ml_setupViews
{
    self.backgroundColor = [UIColor colorWithHexCD:@"#F6F6F6"];
    
    [self addSubview:self.checkAllButton];
    [self addSubview:self.totalLabel];
    [self addSubview:self.moneyLabel];
    [self addSubview:self.freightLabel];
    [self addSubview:self.clearingButton];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

- (void)updateConstraints
{
    [self.checkAllButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.equalTo(self);
        make.width.equalTo(@(90));
    }];

    [self.totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.checkAllButton.mas_right).offset(20);
        make.top.bottom.equalTo(self);
        make.width.equalTo(@(40));
    }];
//
    [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.totalLabel.mas_right).offset(0);
        make.top.bottom.equalTo(self);
        make.width.equalTo(@(80));
    }];
//
    [self.clearingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(self);
        make.width.equalTo(@(90));
    }];
    
    [self.freightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.clearingButton.mas_left).offset(-8);
        make.top.bottom.equalTo(self);
        make.width.equalTo(@(60));
    }];
    
    
    [super updateConstraints];
}

- (UIButton *)checkAllButton {
    if (!_checkAllButton) {
        _checkAllButton = [[UIButton alloc] init];
        [_checkAllButton setTitle:@"全选" forState:UIControlStateNormal];
        [_checkAllButton setTitle:@"全选" forState:UIControlStateSelected];
        [_checkAllButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_checkAllButton setImage:[UIImage imageNamed:@"ico_check_nomal"] forState:UIControlStateNormal];
        [_checkAllButton setImage:[UIImage imageNamed:@"ico_check_select"] forState:UIControlStateSelected];
        [_checkAllButton addTarget:self action:@selector(checkAllButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _checkAllButton;
}

- (UILabel *)totalLabel {
    if (!_totalLabel) {
        _totalLabel = [[UILabel alloc] init];
        _totalLabel.font = [UIFont systemFontOfSize:14];
        _totalLabel.text = @"合计: ";
    }
    return _totalLabel;
}

- (UILabel *)moneyLabel {
    if (!_moneyLabel) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.font = [UIFont systemFontOfSize:16];
        _moneyLabel.textColor = [UIColor orangeColor];
        _moneyLabel.text = @"￥0.00";
    }
    return _moneyLabel;
}

- (UILabel *)freightLabel {
    if (!_freightLabel) {
        _freightLabel = [[UILabel alloc] init];
        _freightLabel.font = [UIFont systemFontOfSize:12];
        _freightLabel.textColor = [UIColor darkTextColor];
        _freightLabel.textAlignment = NSTextAlignmentRight;
        _freightLabel.text = @"不含运费";
    }
    return _freightLabel;
}

- (UIButton *)clearingButton {
    if (!_clearingButton) {
        _clearingButton = [[UIButton alloc] init];
        [_clearingButton setTitle:@"结算(0)" forState:UIControlStateNormal];
        _clearingButton.backgroundColor = [UIColor orangeColor];
        _clearingButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_clearingButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_clearingButton addTarget:self action:@selector(clearingButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _clearingButton;
}

- (void)checkAllButtonAction:(UIButton *)button
{
    button.selected = !button.selected;
    [self.viewModel.checkAllClickSubject sendNext:@(button.selected)];
}

- (void)clearingButtonAction
{
    [self.viewModel.clearingClickSubject sendNext:nil];
}

@end
