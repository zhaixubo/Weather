//
//  MenuViewController.h
//  4.天气预报
//
//  Created by 翟旭博 on 2022/8/3.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MenuViewController : ViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *temperatureArray;
@property (nonatomic, strong) NSMutableArray *nameArray;
@property (nonatomic, strong) UIAlertController * alertController;
//@property (nonatomic, strong) NSMutableArray *timearray;
@end

NS_ASSUME_NONNULL_END
