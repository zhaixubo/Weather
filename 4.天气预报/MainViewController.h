//
//  MainViewController.h
//  4.天气预报
//
//  Created by 翟旭博 on 2022/8/5.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : ViewController<UIScrollViewDelegate, UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *nameArray;
@property (nonatomic, assign) NSInteger nowplace;
@property (nonatomic, strong) UIButton *leftbutton;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *FirstArray;
@property (nonatomic, strong) NSMutableArray *WeekArray;
@property (nonatomic, strong) NSMutableArray *weekimgArray;
@property (nonatomic, strong) NSMutableArray *bigArray;
@property (nonatomic, strong) NSMutableArray *smallArray;
@property (nonatomic, strong) NSMutableString *TodayString;
@property (nonatomic, strong) NSMutableArray *FirstnameArray;
@property (nonatomic, strong) NSMutableArray *ThirdnameArray;
@property (nonatomic, strong) NSMutableArray *SecondnameArray;
@property (nonatomic, strong) NSMutableArray *FournameArray;
@property (nonatomic, strong) NSMutableArray *hoursnameArray;
@property (nonatomic, strong) NSMutableArray *hoursTem;
@property (nonatomic, strong) NSMutableArray *hoursimgArray;
@end

NS_ASSUME_NONNULL_END
