//
//  MenuViewController.m
//  4.天气预报
//
//  Created by 翟旭博 on 2022/8/3.
//

#import "MenuViewController.h"
#import "MenuTableViewCell.h"
#import "ButtonTableViewCell.h"
#include "SearchViewController.h"
#include "MainViewController.h"
#define width [UIScreen mainScreen].bounds.size.width
#define height [UIScreen mainScreen].bounds.size.height

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIColor *newblue = [UIColor colorWithRed:(109.0f / 255.0f) green:(181.0f / 255.0f)blue:(237.0f / 255.0f) alpha:1.0f];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 50)];
    view.backgroundColor = newblue;
    [self.view addSubview:view];
    
   //_timearray = [[NSMutableArray alloc] init];
    _nameArray = [NSMutableArray arrayWithObject:@"西安"];
    _temperatureArray = [[NSMutableArray alloc] init];
    [self creatUrl];
    
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, width, height - 50) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[MenuTableViewCell class] forCellReuseIdentifier:@"menu"];
    [self.tableView registerClass:[ButtonTableViewCell class] forCellReuseIdentifier:@"button"];
    
    //注册观察者用于接收通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notice:) name:@"1" object:nil];
}
- (void)notice:(NSNotification *) sender {

    [_nameArray addObject:sender.userInfo[@"key1"]];
    [_temperatureArray addObject:sender.userInfo[@"key2"]];
    [_tableView reloadData];
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _nameArray.count + 1;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == _nameArray.count) {
        ButtonTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"button" forIndexPath:indexPath];
        [cell.button addTarget:self action:@selector(pressgo) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    } else {
        
        MenuTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"menu" forIndexPath:indexPath];
        if (indexPath.row % 2 == 0) {
            [cell.imageview setImage:[UIImage imageNamed:@"p1.png"]];
        } else {
            [cell.imageview setImage:[UIImage imageNamed:@"p2.png"]];
        }
        cell.cityLabel.text = _nameArray[indexPath.row];
        if (indexPath.row < _temperatureArray.count) {
            cell.temperatureLabel.text = _temperatureArray[indexPath.row];
            //cell.timeLabel.text = _timearray[indexPath.row];
        }
        //cell.temperatureLabel.text = _temperatureArray[indexPath.row];
        //cell.timeLabel.text = _timearray[indexPath.row];
        return cell;
    }
    
}
- (void)pressgo {
    SearchViewController *vc = [[SearchViewController alloc] init];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    vc.nameArray = _nameArray;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)creatUrl {
    for (int i = 0; i < _nameArray.count; i++) {
        NSString *urlString = [NSString stringWithFormat:@"https://v0.yiketianqi.com/api?unescape=1&version=v91&appid=43656176&appsecret=I42og6Lm&ext=&cityid=&city=%@", _nameArray[i]];
        //处理字符
        urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        //创建URL
        NSURL *url = [NSURL URLWithString:urlString];
        
        NSURLSession *session1 = [NSURLSession sharedSession];
        
        NSURLSessionTask *task1 = [session1 dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (!error) {
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                
                NSMutableString *stringOne = [NSMutableString stringWithFormat:@"%@",dic[@"city"]];
                NSMutableString *stringTwo = [NSMutableString stringWithFormat:@"%@°C",dic[@"data"][0][@"tem"]];
                //NSLog(@"%@",stringTwo);
                //NSLog(@"%@",stringOne);
                NSDate *timeDate = [NSDate date];
                NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                [dateFormatter setDateFormat:@"HH:mm"];
                NSString *locationString = [dateFormatter stringFromDate:timeDate];
                if (i != 0) {
                    [_nameArray addObject:stringOne];
                }
                [_temperatureArray addObject:stringTwo];
                //[_timearray addObject:locationString];
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    [self->_tableView reloadData];
                }];
            }
        }];
        [task1 resume];
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row < _nameArray.count) {
        MainViewController *viewcontroller = [[MainViewController alloc] init];
        viewcontroller.modalPresentationStyle = UIModalPresentationFullScreen;
        viewcontroller.nameArray = _nameArray;
        viewcontroller.nowplace = indexPath.row;
        [self presentViewController:viewcontroller animated:YES completion:nil];
    }
    
    
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
