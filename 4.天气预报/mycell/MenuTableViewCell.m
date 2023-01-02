//
//  MenuTableViewCell.m
//  4.天气预报
//
//  Created by 翟旭博 on 2022/8/3.
//

#import "MenuTableViewCell.h"

#define width [UIScreen mainScreen].bounds.size.width
#define height [UIScreen mainScreen].bounds.size.height

@implementation MenuTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.imageview = [[UIImageView alloc] init];
    [self.contentView addSubview:_imageview];
    
    /*self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.font = [UIFont systemFontOfSize:22];
    self.timeLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.timeLabel];*/
    
    self.cityLabel = [[UILabel alloc] init];
    self.cityLabel.font = [UIFont systemFontOfSize:50];
    self.cityLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.cityLabel];
    
    self.temperatureLabel = [[UILabel alloc] init];
    self.temperatureLabel.font = [UIFont systemFontOfSize:50];
    self.temperatureLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.temperatureLabel];
    
    
    
    return self;
}
- (void)layoutSubviews {
    //self.timeLabel.frame = CGRectMake(15, 5, 100, 30);
    self.cityLabel.frame = CGRectMake(10, 10, 200, 80);
    self.temperatureLabel.frame = CGRectMake(width - 220, 10, 200, 80);
    self.imageview.frame = CGRectMake(0, 0, width, 100);
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
