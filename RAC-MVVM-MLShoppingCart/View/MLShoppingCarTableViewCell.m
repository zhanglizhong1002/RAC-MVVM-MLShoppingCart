//
//  MLShoppingCarTableViewCell.m
//  Medicine
//
//  Created by Visoport on 20/1/17.
//  Copyright © 2017年 Visoport. All rights reserved.
//

#import "MLShoppingCarTableViewCell.h"

@interface MLShoppingCarTableViewCell ()

@property (nonatomic, strong) UIButton *selectButton;
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UILabel *pricelLabel;
@property (nonatomic, strong) UILabel *numberLabel;

@property (nonatomic, strong) UIView *editView;
@property (nonatomic, strong) UIButton *reduceButton;
@property (nonatomic, strong) UIButton *addButton;
//@property (nonatomic, strong) UILabel *editNumLabel;
@property (nonatomic, strong) UIButton *editsetButton;
@property (nonatomic, strong) UIButton *deleteButton;

@end

@implementation MLShoppingCarTableViewCell

- (void)setViewModel:(MLShoppingCarTableViewCellViewModel *)viewModel
{
    if (!viewModel) {
        return;
    }
    _viewModel = viewModel;
    
    [self my_ml_setupViews];
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:@"http://img.mukewang.com/55962a450001a55e06000375.jpg"] placeholderImage:nil];
    self.titleLabel.text = viewModel.goodName;
    self.detailLabel.text = viewModel.standard;
    self.pricelLabel.text = viewModel.goodPrice;
    self.numberLabel.text = viewModel.quantity;
    
    
    
    self.selectButton.selected = viewModel.btnSelected;
    self.editView.hidden = !viewModel.isEdit;
    self.editNumLabel.text = viewModel.countNum;
}

- (void)my_ml_setupViews
{
    [self.contentView addSubview:self.selectButton];
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.detailLabel];
    [self.contentView addSubview:self.pricelLabel];
    [self.contentView addSubview:self.numberLabel];
    
    [self.contentView addSubview:self.editView];
    [self.editView addSubview:self.addButton];
    [self.editView addSubview:self.reduceButton];
    [self.editView addSubview:self.editNumLabel];
    [self.editView addSubview:self.editsetButton];
    [self.editView addSubview:self.deleteButton];
    
    
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
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(8));
        make.bottom.equalTo(@(-8));
        make.left.equalTo(self.selectButton.mas_right).offset(8);
        make.size.mas_equalTo(CGSizeMake(84, 84));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(8));
        make.right.equalTo(@(-8));
        make.left.equalTo(self.iconImageView.mas_right).offset(8);
    }];
    
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(8);
        make.left.equalTo(self.iconImageView.mas_right).offset(8);
    }];
    
    [self.pricelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.detailLabel.mas_bottom).offset(8);
        make.left.equalTo(self.iconImageView.mas_right).offset(8);
    }];
    
    [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(@(-16));
    }];
    
    
    [self.editView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(self);
        make.left.mas_equalTo(self.iconImageView.mas_right);
    }];
    
    [self.deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(self.editView);
        make.size.mas_equalTo(CGSizeMake(75, 45));
    }];
    
    [self.reduceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(self.editView);
        make.size.mas_equalTo(CGSizeMake(60, 45));
    }];
    
    [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.editView);
        make.right.mas_equalTo(self.deleteButton.mas_left);
        make.size.mas_equalTo(CGSizeMake(60, 45));
    }];
    
    [self.editNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.editView);
        make.left.mas_equalTo(self.reduceButton.mas_right);
        make.right.mas_equalTo(self.addButton.mas_left);
        make.height.equalTo(@(45));
    }];
    
    
    [self.editsetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.addButton.mas_bottom).offset(1);
        make.left.bottom.right.mas_equalTo(self.editView);
    }];
    
    [super updateConstraints];
}

- (UILabel *)numberLabel
{
    if (!_numberLabel) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.font = [UIFont systemFontOfSize:14];
    }
    return _numberLabel;
}

- (UILabel *)pricelLabel
{
    if (!_pricelLabel) {
        _pricelLabel = [[UILabel alloc] init];
        _pricelLabel.textColor = [UIColor orangeColor];
        _pricelLabel.font = [UIFont systemFontOfSize:16];
    }
    return _pricelLabel;
}

- (UILabel *)detailLabel
{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.textColor = [UIColor darkGrayColor];
        _detailLabel.font = [UIFont systemFontOfSize:12];
    }
    return _detailLabel;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
    }
    return _iconImageView;
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

- (UIView *)editView
{
    if (!_editView) {
        _editView = [[UIView alloc] init];
        _editView.backgroundColor = [UIColor lightGrayColor];
    }
    return _editView;
}

- (UIButton *)addButton
{
    if (!_addButton) {
        _addButton = [[UIButton alloc] init];
        _addButton.backgroundColor = [UIColor blueColor];
        [_addButton setTitle:@"+" forState:UIControlStateNormal];
        [_addButton addTarget:self action:@selector(editAddButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addButton;
}

- (UIButton *)reduceButton
{
    if (!_reduceButton) {
        _reduceButton = [[UIButton alloc] init];
        _reduceButton.backgroundColor = [UIColor blueColor];
        [_reduceButton setTitle:@"-" forState:UIControlStateNormal];
        [_reduceButton addTarget:self action:@selector(editReduceButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _reduceButton;
}

- (UILabel *)editNumLabel
{
    if (!_editNumLabel) {
        _editNumLabel = [[UILabel alloc] init];
        _editNumLabel.font = [UIFont systemFontOfSize:14];
        _editNumLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _editNumLabel;
}

- (UIButton *)editsetButton
{
    if (!_editsetButton) {
        _editsetButton = [[UIButton alloc] init];
        _editsetButton.backgroundColor = [UIColor blueColor];
        _editsetButton.titleLabel.font = [UIFont systemFontOfSize:12];
//        _editsetButton.titleLabel.textAlignment = UITextAlignmentLeft;
        [_editsetButton setTitle:@"规格分类: 大包50g" forState:UIControlStateNormal];
        [_editsetButton addTarget:self action:@selector(editsetButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _editsetButton;
}

- (UIButton *)deleteButton
{
    if (!_deleteButton) {
        _deleteButton = [[UIButton alloc] init];
        _deleteButton.backgroundColor = [UIColor redColor];
        [_deleteButton setTitle:@"删除" forState:UIControlStateNormal];
        [_deleteButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_deleteButton addTarget:self action:@selector(editDeleteButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteButton;
}

- (void)editAddButtonAction
{
    NSInteger account = [self.editNumLabel.text integerValue];
    account++;
    self.editNumLabel.text = [NSString stringWithFormat:@"%ld",(long)account];
    
    [self.viewModel.addBtnClickSubject sendNext:self];
}

- (void)editReduceButtonAction:(UIButton *)button
{
    NSInteger account = [self.editNumLabel.text integerValue];
    
    if (account>1) {
        account--;
    }
    self.editNumLabel.text = [NSString stringWithFormat:@"%ld",(long)account];
    
    [self.viewModel.reduceBtnClickSubject sendNext:self];
}

- (void)editsetButtonAction
{
    [self.viewModel.editsetBtnClickSubject sendNext:self];
}

- (void)editDeleteButtonAction
{
    [self.viewModel.deleteBtnClickSubject sendNext:self];
}

- (void)selectButtonAction:(UIButton *)button
{
    button.selected = !button.selected;
    [self.viewModel.selectBtnClickSubject sendNext:self];
}

@end
