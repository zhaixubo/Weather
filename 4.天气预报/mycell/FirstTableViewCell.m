//
//  FirstTableViewCell.m
//  4.天气预报
//
//  Created by 翟旭博 on 2022/8/4.
//

#import "FirstTableViewCell.h"
#define width [UIScreen mainScreen].bounds.size.width
#define height [UIScreen mainScreen].bounds.size.height
@implementation FirstTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.FirstLabel = [[UILabel alloc] init];
    [self.contentView addSubview: _FirstLabel];
    
    self.SecondLabel = [[UILabel alloc] init];
    [self.contentView addSubview: _SecondLabel];
    
    self.ThirdLabel = [[UILabel alloc] init];
    [self.contentView addSubview: _ThirdLabel];
    
    return self;
}
- (void)layoutSubviews {
    _FirstLabel.frame = CGRectMake(120, 70, 200, 50);
    _SecondLabel.frame = CGRectMake(120, 120, 200, 40);
    _ThirdLabel.frame = CGRectMake(120, 180, 200, 50);
    _FirstLabel.textColor = [UIColor whiteColor];
    _SecondLabel.textColor = [UIColor whiteColor];
    _ThirdLabel.textColor = [UIColor whiteColor];
    _FirstLabel.font = [UIFont systemFontOfSize:50];
    _SecondLabel.font = [UIFont systemFontOfSize:25];
    _ThirdLabel.font = [UIFont systemFontOfSize:70];
    _FirstLabel.textAlignment = NSTextAlignmentCenter;
    _SecondLabel.textAlignment = NSTextAlignmentCenter;
    _ThirdLabel.textAlignment = NSTextAlignmentCenter;
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
