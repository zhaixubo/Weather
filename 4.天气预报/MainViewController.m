//
//  MainViewController.m
//  4.天气预报
//
//  Created by 翟旭博 on 2022/8/5.
//

#import "MainViewController.h"
#import "FirstTableViewCell.h"
#import "SecondTableViewCell.h"
#import "ThirdTableViewCell.h"
#import "FourTableViewCell.h"
#import "FiveTableViewCell.h"
#define width [UIScreen mainScreen].bounds.size.width
#define height [UIScreen mainScreen].bounds.size.height
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *backImage = [UIImage imageNamed:@"bj.jpg"];
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:backImage];
    backImageView.frame = self.view.bounds;
    [self.view insertSubview:backImageView atIndex:0];
    
    _TodayString = [[NSMutableString alloc] init];
    _FirstArray = [[NSMutableArray alloc] init];
    _WeekArray = [[NSMutableArray alloc] init];
    _weekimgArray = [[NSMutableArray alloc] init];
    _smallArray = [[NSMutableArray alloc] init];
    _bigArray = [[NSMutableArray alloc] init];
    _SecondnameArray = [[NSMutableArray alloc] init];
    _FournameArray = [[NSMutableArray alloc] init];
    _hoursTem = [[NSMutableArray alloc] init];
    _hoursnameArray = [[NSMutableArray alloc] init];
    _hoursimgArray = [[NSMutableArray alloc] init];
    _ThirdnameArray = [NSMutableArray arrayWithObjects: @"日落", @"气压", @"能见度", @"风力", nil];
    _FirstnameArray = [NSMutableArray arrayWithObjects:@"日出", @"空气质量", @"湿度", @"风", nil];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    self.scrollView.tag = 666;
    self.scrollView.contentSize = CGSizeMake(width * self.nameArray.count, height);
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsVerticalScrollIndicator = FALSE;
    self.scrollView.showsHorizontalScrollIndicator = FALSE;
    self.scrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.scrollView];
    
    self.pageControl = [[UIPageControl alloc] init];
    self.pageControl.numberOfPages = _nameArray.count;
    self.pageControl.currentPage = _nowplace;
    self.pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    self.pageControl.pageIndicatorTintColor = [UIColor grayColor];
    self.pageControl.frame = CGRectMake(80, height - 70, 250, 32);
    [self.view addSubview:self.pageControl];
    
   // for (int i = 0; i < _nameArray.count; i++) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(width * _nowplace, 0, width, height) style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
       // self.tableView.tag = i;
        self.tableView.backgroundColor = [UIColor clearColor];
        [self.scrollView addSubview:self.tableView];
        [self.tableView registerClass:[FirstTableViewCell class] forCellReuseIdentifier:@"1"];
        [self.tableView registerClass:[SecondTableViewCell class] forCellReuseIdentifier:@"2"];
        [self.tableView registerClass:[ThirdTableViewCell class] forCellReuseIdentifier:@"3"];
        [self.tableView registerClass:[FourTableViewCell class] forCellReuseIdentifier:@"4"];
        [self.tableView registerClass:[FiveTableViewCell class] forCellReuseIdentifier:@"5"];
        [self creatUrl:_nowplace];
    //}
    [self.scrollView setContentOffset:CGPointMake(width * _nowplace, 0)];
    

    _leftbutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _leftbutton.frame = CGRectMake(20, 20, 80, 80);
    [_leftbutton setTitle:@"返回" forState:UIControlStateNormal];
    _leftbutton.titleLabel.font = [UIFont systemFontOfSize:25];
    _leftbutton.tintColor = [UIColor whiteColor];
    [self.view addSubview:_leftbutton];
    [_leftbutton addTarget:self action:@selector(pressback) forControlEvents:UIControlEventTouchUpInside];
}


- (void)pressback {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//获取每组单元格的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 14;
}

//获取单元格高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 300;
    } else if (indexPath.row == 1) {
        return 60;
    } else if (indexPath.row == 2) {
        return 100;
    } else if (indexPath.row >= 3 && indexPath.row <= 8) {
        return 60;
    } else {
        return 100;
    }
}


//创建单元格对象函数
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        FirstTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"1" forIndexPath:indexPath];
        
        if (_FirstArray.count > 1) {
            cell.FirstLabel.text = _nameArray[_nowplace];
            cell.SecondLabel.text = self.FirstArray[0];
            cell.ThirdLabel.text = self.FirstArray[1];
        }
        return cell;
    } else if (indexPath.row == 1) {
        SecondTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"2" forIndexPath:indexPath];
        if (_WeekArray.count > 0 ) {
            cell.FirstLabel.text = self.WeekArray[0];
            cell.SecondLabel.text = self.bigArray[0];
            cell.ThirdLabel.text = self.smallArray[0];
            cell.imageview.image = [UIImage imageNamed:_weekimgArray[0]];
        }
        
        return cell;
    } else if (indexPath.row == 2) {
        ThirdTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"3" forIndexPath:indexPath];
        for (int i = 0; i < _hoursnameArray.count; i++) {
            UILabel *onlabel = [[UILabel alloc] init];
            onlabel.text = _hoursnameArray[i];
            onlabel.frame = CGRectMake(15 + 70 * i, 10, 70, 20);
            onlabel.textColor = [UIColor whiteColor];
            [cell.scrollView addSubview:onlabel];
            
            UIImageView *imageview = [[UIImageView alloc] init];
            [imageview setImage:[UIImage imageNamed:_hoursimgArray[i]]];
            imageview.frame = CGRectMake(15 + 70 * i, 30, 30, 30);
            [cell.scrollView addSubview:imageview];
            
            UILabel *underlabel = [[UILabel alloc] init];
            underlabel.text = _hoursTem[i];
            underlabel.frame = CGRectMake(20 + 70 * i, 65, 70, 20);
            underlabel.textColor = [UIColor whiteColor];
            [cell.scrollView addSubview:underlabel];
        }
        return cell;
    } else if (indexPath.row <= 8 && indexPath.row >= 3) {
        SecondTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"2" forIndexPath:indexPath];
        if (_WeekArray.count > indexPath.row - 2 ) {
            cell.FirstLabel.text = self.WeekArray[indexPath.row - 2];
            cell.SecondLabel.text = self.bigArray[indexPath.row - 2];
            cell.ThirdLabel.text = self.smallArray[indexPath.row - 2];
            cell.imageview.image = [UIImage imageNamed:_weekimgArray[indexPath.row - 2]];
            NSLog(@"%@",self.WeekArray[indexPath.row - 2]);
        }
        return cell;
    } else if (indexPath.row == 9) {
        FourTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"4" forIndexPath:indexPath];
        cell.label.text = _TodayString;
        return cell;
    } else {
        FiveTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"5" forIndexPath:indexPath];
        if (indexPath.row - 10 < _FirstnameArray.count) {
            cell.FirstLabel.text = _FirstnameArray[indexPath.row - 10];
            cell.ThirdLabel.text = _ThirdnameArray[indexPath.row - 10];
            cell.SecondLabel.text = _SecondnameArray[indexPath.row - 10];
            cell.FourLabel.text = _FournameArray[indexPath.row - 10];
        }
        return cell;
    }
    
}

- (void)creatUrl:(int)i{
    
    
    
    NSString *urlString = [NSString stringWithFormat:@"https://tianqiapi.com/api?unescape=1&version=v1&appid=33731491&appsecret=QJlp33ZL&city=%@", _nameArray[i]];
    //处理字符
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    //创建URL
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLSession *session1 = [NSURLSession sharedSession];
    
    NSURLSessionTask *task1 = [session1 dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            //解析数据
            NSDictionary *secondDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            NSMutableArray *hourArray = [[NSMutableArray alloc] init];
            hourArray = secondDictionary[@"data"][0][@"hours"];

                
                [_FirstArray addObject:secondDictionary[@"data"][0][@"wea"]];
                [_FirstArray addObject:secondDictionary[@"data"][0][@"tem"]];
                for (int i = 0; i <= 6; i++) {
                    [_WeekArray addObject:secondDictionary[@"data"][i][@"week"]];
                    [_smallArray addObject:secondDictionary[@"data"][i][@"tem2"]];
                    [_bigArray addObject:secondDictionary[@"data"][i][@"tem1"]];
                    [_weekimgArray addObject:secondDictionary[@"data"][i][@"wea_day_img"]];
                }
                _TodayString = [NSMutableString stringWithFormat:@"今天：%@",secondDictionary[@"data"][0][@"air_tips"]];
                [_SecondnameArray addObject:secondDictionary[@"data"][0][@"sunrise"]];
                [_SecondnameArray addObject:secondDictionary[@"data"][0][@"air"]];
                [_SecondnameArray addObject:secondDictionary[@"data"][0][@"humidity"]];
                [_SecondnameArray addObject:secondDictionary[@"data"][0][@"win"][0]];
                
                [_FournameArray addObject:secondDictionary[@"data"][0][@"sunset"]];
                [_FournameArray addObject:secondDictionary[@"data"][0][@"pressure"]];
                [_FournameArray addObject:secondDictionary[@"data"][0][@"visibility"]];
                [_FournameArray addObject:secondDictionary[@"data"][0][@"win_speed"]];
                
                for (int i = 0; i < hourArray.count; i++) {
                    [_hoursTem addObject:hourArray[i][@"tem"]];
                    [_hoursnameArray addObject:hourArray[i][@"hours"]];
                    [_hoursimgArray addObject:hourArray[i][@"wea_img"]];
                }
                
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                //if (_tableView.tag == (int)_nowplace) {
                    [self->_tableView reloadData];
                //}
                
                
            }];
        }
    }];
    [task1 resume];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.tag == 666) {
        self.pageControl.currentPage = scrollView.contentOffset.x / width;
        
        
    }
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.tag == 666) {
        _nowplace = _scrollView.contentOffset.x / width;
    
        NSLog(@"qqqqq%d",_nowplace);
    
        self.tableView.frame = CGRectMake(scrollView.contentOffset.x, 0, width, height);
        [_FirstArray removeAllObjects];
        [_WeekArray removeAllObjects];
        [_weekimgArray removeAllObjects];
        [_smallArray removeAllObjects];
        [_bigArray removeAllObjects];
        [_SecondnameArray removeAllObjects];
        [_FournameArray removeAllObjects];
        [_hoursTem removeAllObjects];
        [_hoursnameArray removeAllObjects];
        [_hoursimgArray removeAllObjects];
        
        [self creatUrl:_nowplace];
    }
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
