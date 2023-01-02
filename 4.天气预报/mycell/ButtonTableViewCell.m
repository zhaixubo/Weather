//
//  ButtonTableViewCell.m
//  4.天气预报
//
//  Created by 翟旭博 on 2022/8/3.
//

#import "ButtonTableViewCell.h"
#import "SearchViewController.h"
#define width [UIScreen mainScreen].bounds.size.width
#define height [UIScreen mainScreen].bounds.size.height
@implementation ButtonTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.button = [[UIButton alloc] init];
    [self.contentView addSubview:_button];
    return self;
}

- (void)layoutSubviews {
    [_button setImage:[UIImage imageNamed:@"jiahao.png"] forState:UIControlStateNormal];
    _button.frame = CGRectMake(width - 50, 8, 32, 32);
    
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
