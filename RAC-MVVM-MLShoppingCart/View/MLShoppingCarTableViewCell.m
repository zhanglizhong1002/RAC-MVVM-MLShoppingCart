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
@property (nonatomic, strong) UIButton *editsetButton;
@property (nonatomic, strong) UIButton *deleteButton;

@property (nonatomic, strong) UIView *acrossLineView;
@property (nonatomic, strong) UIView *leftVerLineView;
@property (nonatomic, strong) UIView *rightVerLineView;

@end

@implementation MLShoppingCarTableViewCell

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self.viewModel.editTextFieldSubject sendNext:self];
}

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
    self.editNumTextField.text = viewModel.countNum;
}

- (void)my_ml_setupViews
{
    self.contentView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    
    [self.contentView addSubview:self.selectButton];
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.detailLabel];
    [self.contentView addSubview:self.pricelLabel];
    [self.contentView addSubview:self.numberLabel];
    
    [self.contentView addSubview:self.bottomLineView];
    
    [self.contentView addSubview:self.editView];
    [self.editView addSubview:self.addButton];
    [self.editView addSubview:self.reduceButton];
    [self.editView addSubview:self.editNumTextField];
    [self.editView addSubview:self.editsetButton];
    [self.editView addSubview:self.deleteButton];
    [self.editView addSubview:self.acrossLineView];
    [self.editView addSubview:self.leftVerLineView];
    [self.editView addSubview:self.rightVerLineView];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

- (void)updateConstraints
{
    if (self.contentView.bounds.size.height == 100) {
        self.bottomLineView.hidden = YES;
    }
    else
    {
        self.bottomLineView.hidden = NO;
    }
    
    [self.selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(8));
        make.top.equalTo(@(35));
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(8));
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
    
    
    
    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.contentView);
        make.height.equalTo(@(5));
    }];
    
    
    
    [self.editView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(self);
        make.left.mas_equalTo(self.iconImageView.mas_right);
        make.height.equalTo(@(100));
    }];
    
    [self.deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(self.editView);
        make.size.mas_equalTo(CGSizeMake(75, 45));
    }];
    
    [self.reduceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(self.editView);
        make.size.mas_equalTo(CGSizeMake(60, 44));
    }];
    
    [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.editView);
        make.right.mas_equalTo(self.deleteButton.mas_left);
        make.size.mas_equalTo(CGSizeMake(60, 44));
    }];
    
    [self.leftVerLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.reduceButton.mas_right);
        make.top.mas_equalTo(self.editView).offset(5);
        make.size.mas_equalTo(CGSizeMake(1, 35));
    }];
    
    [self.rightVerLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.addButton.mas_left);
        make.top.mas_equalTo(self.editView).offset(5);
        make.size.mas_equalTo(CGSizeMake(1, 35));
    }];
    
    [self.editNumTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.editView);
        make.left.mas_equalTo(self.reduceButton.mas_right);
        make.right.mas_equalTo(self.addButton.mas_left);
        make.height.equalTo(@(44));
    }];
    
    [self.acrossLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.addButton.mas_bottom);
        make.left.mas_equalTo(self.editView);
        make.right.mas_equalTo(self.deleteButton.mas_left);
        make.height.equalTo(@(1));
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
        _addButton.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
        [_addButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_addButton setTitle:@"+" forState:UIControlStateNormal];
        [_addButton addTarget:self action:@selector(editAddButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addButton;
}

- (UIButton *)reduceButton
{
    if (!_reduceButton) {
        _reduceButton = [[UIButton alloc] init];
        _reduceButton.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
        [_reduceButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_reduceButton setTitle:@"-" forState:UIControlStateNormal];
        [_reduceButton addTarget:self action:@selector(editReduceButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _reduceButton;
}

- (UITextField *)editNumTextField {
    if (!_editNumTextField) {
        _editNumTextField = [[UITextField alloc] init];
        _editNumTextField.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
        _editNumTextField.font = [UIFont systemFontOfSize:14];
        _editNumTextField.textAlignment = NSTextAlignmentCenter;
        _editNumTextField.keyboardType = UIKeyboardTypeNumberPad;
        _editNumTextField.delegate = self;
    }
    return _editNumTextField;
}

- (UIButton *)editsetButton
{
    if (!_editsetButton) {
        _editsetButton = [[UIButton alloc] init];
        _editsetButton.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
        _editsetButton.titleLabel.font = [UIFont systemFontOfSize:14];
        _editsetButton.titleLabel.textAlignment = NSTextAlignmentLeft;
        [_editsetButton setTitle:@"规格分类: 大包50g" forState:UIControlStateNormal];
        [_editsetButton setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        [_editsetButton addTarget:self action:@selector(editsetButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _editsetButton;
}

- (UIButton *)deleteButton
{
    if (!_deleteButton) {
        _deleteButton = [[UIButton alloc] init];
        _deleteButton.backgroundColor = [UIColor orangeColor];
        [_deleteButton setTitle:@"删除" forState:UIControlStateNormal];
        [_deleteButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_deleteButton addTarget:self action:@selector(editDeleteButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteButton;
}

- (UIView *)acrossLineView {
    if (!_acrossLineView) {
        _acrossLineView = [[UIView alloc] init];
        _acrossLineView.backgroundColor = [UIColor whiteColor];
    }
    return _acrossLineView;
}

- (UIView *)leftVerLineView {
    if (!_leftVerLineView) {
        _leftVerLineView = [[UIView alloc] init];
        _leftVerLineView.backgroundColor = [UIColor whiteColor];
    }
    return _leftVerLineView;
}

- (UIView *)rightVerLineView {
    if (!_rightVerLineView) {
        _rightVerLineView = [[UIView alloc] init];
        _rightVerLineView.backgroundColor = [UIColor whiteColor];
    }
    return _rightVerLineView;
}

- (UIView *)bottomLineView {
    if (!_bottomLineView) {
        _bottomLineView = [[UIView alloc] init];
        _bottomLineView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomLineView;
}

- (void)editAddButtonAction
{
    NSInteger account = [self.editNumTextField.text integerValue];
    account++;
    self.editNumTextField.text = [NSString stringWithFormat:@"%ld",(long)account];
    [self.viewModel.editTextFieldSubject sendNext:self];
}

- (void)editReduceButtonAction:(UIButton *)button
{
    NSInteger account = [self.editNumTextField.text integerValue];
    if (account>1) {
        account--;
    }
    self.editNumTextField.text = [NSString stringWithFormat:@"%ld",(long)account];
    [self.viewModel.editTextFieldSubject sendNext:self];
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
