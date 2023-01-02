//
//  FourTableViewCell.m
//  4.天气预报
//
//  Created by 翟旭博 on 2022/8/4.
//

#import "FourTableViewCell.h"

@implementation FourTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.label = [[UILabel alloc] init];
    [self.contentView addSubview: _label];
    return self;
}

- (void)layoutSubviews {
    _label.textColor = [UIColor whiteColor];
    _label.numberOfLines = 3;
    _label.frame = CGRectMake(15, 5, 380, 90);
    _label.font = [UIFont systemFontOfSize:20];
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
