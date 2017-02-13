//
//  MLBaseTableViewCell.m
//  Medicine
//
//  Created by Visoport on 10/1/17.
//  Copyright © 2017年 Visoport. All rights reserved.
//

#import "MLBaseTableViewCell.h"

@implementation MLBaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self ml_setupViews];
        [self ml_bindViewModel];
    }
    return self;
}

- (void)ml_setupViews{}

- (void)ml_bindViewModel{}

@end
