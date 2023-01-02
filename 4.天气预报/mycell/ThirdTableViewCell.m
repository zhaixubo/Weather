//
//  ThirdTableViewCell.m
//  4.天气预报
//
//  Created by 翟旭博 on 2022/8/4.
//

#import "ThirdTableViewCell.h"
#define width [UIScreen mainScreen].bounds.size.width
#define height [UIScreen mainScreen].bounds.size.height
@implementation ThirdTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.scrollEnabled = YES;
    self.scrollView.showsVerticalScrollIndicator = FALSE;
    self.scrollView.showsHorizontalScrollIndicator = FALSE;
    self.scrollView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_scrollView];
    return self;
}

- (void)layoutSubviews {
    self.scrollView.frame = CGRectMake(0, 0, width, 120);
    self.scrollView.contentSize = CGSizeMake(width * 4, 120);
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
