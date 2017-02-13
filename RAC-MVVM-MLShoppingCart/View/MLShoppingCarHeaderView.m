//
//  MLShoppingCarHeaderView.m
//  Medicine
//
//  Created by Visoport on 20/1/17.
//  Copyright © 2017年 Visoport. All rights reserved.
//

#import "MLShoppingCarHeaderView.h"
//#import "MLDrugstoreMessageViewController.h"
#import "MLShoppingHeaderModel.h"

@interface MLShoppingCarHeaderView ()

@property (nonatomic, strong) UIButton *selectButton;
@property (nonatomic, strong) UIButton *titleButton;
@property (nonatomic, strong) UIButton *editButton;

@end

@implementation MLShoppingCarHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithViewModel:(id<MLBaseViewModelProtocol>)viewModel
{
    self.viewModel = (MLShoppingCarHeaderViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}


- (void)ml_setupViews
{
    self.backgroundColor = [UIColor colorWithHexCD:@"#F6F6F6"];
    
    MLShoppingHeaderModel *model = self.viewModel.dataArray[self.viewModel.section];
    self.currenSection = self.viewModel.section;
    self.selectButton.selected = model.sectionSelect;
    self.editButton.selected = model.sectionEdit;
    
    [self.titleButton setTitle:model.title forState:UIControlStateNormal];
    [self addSubview:self.selectButton];
    [self addSubview:self.titleButton];
    [self addSubview:self.editButton];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}



- (void)updateConstraints
{
    [self.selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(8));
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [self.titleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.selectButton.mas_right).offset(8);
    }];
    
    [self.editButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(@(-8));
    }];
    
    [super updateConstraints];
}

- (UIButton *)selectButton
{
    if (!_selectButton) {
        _selectButton = [[UIButton alloc] init];
        [_selectButton setImage:[UIImage imageNamed:@"ico_check_nomal"] forState:UIControlStateNormal];
        [_selectButton setImage:[UIImage imageNamed:@"ico_check_select"] forState:UIControlStateSelected];
        [_selectButton addTarget:self action:@selector(selectButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectButton;
}

- (UIButton *)titleButton
{
    if (!_titleButton) {
        _titleButton = [[UIButton alloc] init];
        _titleButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_titleButton addTarget:self action:@selector(titleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _titleButton;
}

- (UIButton *)editButton
{
    if (!_editButton) {
        _editButton = [[UIButton alloc] init];
        _editButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_editButton addTarget:self action:@selector(editButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_editButton setTitle:@"编辑" forState:UIControlStateNormal];
        [_editButton setTitle:@"完成" forState:UIControlStateSelected];
        [_editButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _editButton;
}

- (void)selectButtonAction:(UIButton *)button
{
    button.selected = !button.selected;
    
    [self.viewModel.selectClickSubject sendNext:@{@"section":[NSString stringWithFormat:@"%ld", self.currenSection], @"select":@(button.selected)}];
}

- (void)titleButtonAction:(UIButton *)button
{
//    [MLCommonTool showSuccesWithStatus:@"进入药店..."];
}

- (void)editButtonAction:(UIButton *)button
{
    button.selected = !button.selected;
    
    [self.viewModel.editClickSubject sendNext:@{@"section":[NSString stringWithFormat:@"%ld", self.currenSection], @"select":@(button.selected)}];
}

@end
