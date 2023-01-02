//
//  FiveTableViewCell.m
//  4.天气预报
//
//  Created by 翟旭博 on 2022/8/5.
//

#import "FiveTableViewCell.h"
#define width [UIScreen mainScreen].bounds.size.width
#define height [UIScreen mainScreen].bounds.size.height
@implementation FiveTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.FirstLabel = [[UILabel alloc] init];
    [self.contentView addSubview: _FirstLabel];
    
    self.SecondLabel = [[UILabel alloc] init];
    [self.contentView addSubview: _SecondLabel];
    
    self.ThirdLabel = [[UILabel alloc] init];
    [self.contentView addSubview: _ThirdLabel];
    
    self.FourLabel = [[UILabel alloc] init];
    [self.contentView addSubview: _FourLabel];
    
    return self;
}

- (void)layoutSubviews {
    _FirstLabel.frame = CGRectMake(15, 5, 100, 20);
    _FirstLabel.font = [UIFont systemFontOfSize:18];
    _FirstLabel.textColor = [UIColor whiteColor];
    
    _SecondLabel.frame = CGRectMake(15, 30, 100, 50);
    _SecondLabel.font = [UIFont systemFontOfSize:28];
    _SecondLabel.textColor = [UIColor whiteColor];
    
    _ThirdLabel.frame = CGRectMake(width / 2 + 50, 5, 100, 20);
    _ThirdLabel.font = [UIFont systemFontOfSize:18];
    _ThirdLabel.textColor = [UIColor whiteColor];
    
    _FourLabel.frame = CGRectMake(width / 2 + 50, 30, 100, 50);
    _FourLabel.font = [UIFont systemFontOfSize:28];
    _FourLabel.textColor = [UIColor whiteColor];
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
