//
//  HomeCell.m
//  RaiseLearn
//
//  Created by afarsoft on 2017/6/15.
//  Copyright © 2017年 afarsoft. All rights reserved.
//

#import "HomeCell.h"

@interface HomeCell ()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *desc;

@end
@implementation HomeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)configCell:(BookListModel *)model{
    [_icon sd_setImageWithURL:[NSURL URLWithString:model.coverImg] placeholderImage:[UIImage imageNamed:@""]];
    _name.text = model.name;
    _desc.text = model.des;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
