//
//  AdaptiveTableViewCell.m
//  AdaptiveXIBCell
//
//  Created by bnysc on 2016/12/6.
//  Copyright © 2016年 HB. All rights reserved.
//

#import "AdaptiveTableViewCell.h"
#import "AdaptiveModel.h"

@interface AdaptiveTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel; // 姓名
@property (weak, nonatomic) IBOutlet UILabel *text_Label; // 正文
@property (weak, nonatomic) IBOutlet UIImageView *picthreView; // 图片

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pictureHeight; // 图片高度约束

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pictureBottom; // 图片底部约束

@end

@implementation AdaptiveTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// 重写setter方法
- (void)setModel:(AdaptiveModel *)model {
    if (_model != model) {
        _model = model;
    }
    
    self.nameLabel.text = model.name;
    self.text_Label.text = model.text;
    
    if (model.picture) { // 有图片
        self.picthreView.hidden = NO;
        self.picthreView.image = [UIImage imageNamed:model.picture];
        self.pictureHeight.constant = 100;
        self.pictureBottom.constant = 10;
    } else { // 没有图片
        self.picthreView.hidden = YES;
        self.pictureHeight.constant = 0;
        self.pictureBottom.constant = 0;
    }
}

@end
