//
//  SecondTableViewCell.m
//  4.天气预报
//
//  Created by 翟旭博 on 2022/8/4.
//

#import "SecondTableViewCell.h"
#define width [UIScreen mainScreen].bounds.size.width
#define height [UIScreen mainScreen].bounds.size.height
@implementation SecondTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.FirstLabel = [[UILabel alloc] init];
    [self.contentView addSubview: _FirstLabel];
    
    self.SecondLabel = [[UILabel alloc] init];
    [self.contentView addSubview: _SecondLabel];
    
    self.ThirdLabel = [[UILabel alloc] init];
    [self.contentView addSubview: _ThirdLabel];
    
    self.imageview = [[UIImageView alloc] init];
    [self.contentView addSubview: _imageview];
    
    return self;
}

- (void)layoutSubviews {
    _FirstLabel.frame = CGRectMake(15, 5, 200, 50);
    _SecondLabel.frame = CGRectMake(width - 140, 5, 50, 50);
    _ThirdLabel.frame = CGRectMake(width - 70, 5, 50, 50);
    _FirstLabel.textColor = [UIColor whiteColor];
    _SecondLabel.textColor = [UIColor whiteColor];
    _ThirdLabel.textColor = [UIColor whiteColor];
    _FirstLabel.font = [UIFont systemFontOfSize:25];
    _SecondLabel.font = [UIFont systemFontOfSize:20];
    _ThirdLabel.font = [UIFont systemFontOfSize:20];
    _imageview.frame = CGRectMake(185, 15, 35, 35);
    
 
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
