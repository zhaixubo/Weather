//
//  SearchViewController.h
//  4.天气预报
//
//  Created by 翟旭博 on 2022/8/3.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchViewController : ViewController <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource, NSURLSessionDelegate>
@property (nonatomic, strong) NSMutableArray *nameArray;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSMutableArray *cityArray;
@property (nonatomic, strong) NSMutableData *data;
@property (nonatomic, strong) NSMutableArray *xianshiArray;

@end

NS_ASSUME_NONNULL_END
