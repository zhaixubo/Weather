//
//  MenuTableViewCell.h
//  4.天气预报
//
//  Created by 翟旭博 on 2022/8/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MenuTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *cityLabel;
@property (nonatomic, strong) UILabel *temperatureLabel;
@property (nonatomic, strong) UIImageView *imageview;

@end

NS_ASSUME_NONNULL_END
