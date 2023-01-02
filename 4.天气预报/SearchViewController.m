//
//  SearchViewController.m
//  4.天气预报
//
//  Created by 翟旭博 on 2022/8/3.
//

#import "SearchViewController.h"
#import "LookViewController.h"
#import "MenuViewController.h"
int hang = 0;
@interface SearchViewController ()

@property (nonatomic, strong) UITableViewCell *cell0;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *backImage = [UIImage imageNamed:@"background1.jpg"];
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:backImage];
    backImageView.frame = self.view.bounds;
    [self.view insertSubview:backImageView atIndex:0];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setImage:[UIImage imageNamed:@"back_img.png"] forState:UIControlStateNormal];
    button.frame = CGRectMake(10, 10, 80, 80);
    [button addTarget:self action:@selector(pressback) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"请输入您要搜索的城市:";
    label.font = [UIFont systemFontOfSize:22];
    label.frame = CGRectMake(50, 85, 300, 40);
    [self.view addSubview:label];
    
    _textField = [[UITextField alloc] init];
    _textField.delegate = self;
    _textField.frame = CGRectMake(50, 120, [UIScreen mainScreen].bounds.size.width - 100, 50);
    _textField.rightView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chazhao.png"]];
    _textField.rightViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_textField];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 180, [UIScreen mainScreen].bounds.size.width, 500) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"111"];
    UIView *view = [[UIView alloc] init];
    _tableView.tableFooterView = view;
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    [self creatUrl];
    _cityArray = [[NSMutableArray alloc] init];
    _xianshiArray = [[NSMutableArray alloc] init];
    return YES;
}

- (void)creatUrl {
    NSString *urlString = [NSString stringWithFormat:@"https://geoapi.heweather.net/v2/city/lookup?location=%@&key=b92646e0f4194731b50870798cfad1d0", _textField.text];
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url = [NSURL URLWithString:urlString];
    //2.创建请求类
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //3.创建会话
    //delegateQueue 表示协议方法在哪个线程中执行
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self  delegateQueue:[NSOperationQueue mainQueue]];
    //4.根据会话创建任务
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request];
    //5.启动任务
    [dataTask resume];
    
    
}
//接收服务器的响应
-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler {
    if(self.data == nil){
        self.data = [[NSMutableData alloc] init];
    } else {
        self.data.length = 0;
    }
    
    completionHandler(NSURLSessionResponseAllow);
}
//接收到数据，该方法会被调用多次
- (void)URLSession:(NSURLSession *)session dataTask:( NSURLSessionDataTask *)dataTask didReceiveData:( NSData *)data {
    [self.data appendData:data];
}
//数据请求完成或者请求出现错误调用的方法
- (void)URLSession:(NSURLSession *)session task:( NSURLSessionTask *)task didCompleteWithError:( NSError *)error {
    if (error == nil) {
        //解析数据
        NSDictionary *secondDictionary = [NSJSONSerialization JSONObjectWithData:_data options:kNilOptions error:nil];
        //NSLog(@"%@",secondDictionary);
        NSMutableArray *timeArray = [[NSMutableArray alloc] init];
        timeArray = secondDictionary[@"location"];
        for (int i = 0; i < timeArray.count; i++) {
            NSMutableString *str = [NSMutableString stringWithFormat:@"%@",secondDictionary[@"location"][i][@"name"]];
            NSMutableString *str2 = [NSMutableString stringWithFormat:@"%@-%@-%@",secondDictionary[@"location"][i][@"adm1"],secondDictionary[@"location"][i][@"adm2"],secondDictionary[@"location"][i][@"name"]];
            [_cityArray addObject: str];
            [_xianshiArray addObject:str2];
        }
    }
    [_tableView reloadData];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"111" forIndexPath:indexPath];
    while ([cell.contentView.subviews lastObject] != nil) {
        [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
    }
    cell.textLabel.text = _xianshiArray[indexPath.row];
    //cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont systemFontOfSize:20];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _cityArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 25;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_textField endEditing:YES];
    [_textField resignFirstResponder];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _textField.text = _cityArray[indexPath.row];
    hang = indexPath.row;
    [self pressgo];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField endEditing:YES];
    return YES;
}

- (void)pressgo {
    LookViewController *lookviewcontroller = [[LookViewController alloc] init];
    lookviewcontroller.modalPresentationStyle = UIModalPresentationFullScreen;
    lookviewcontroller.CityString = _cityArray[hang];
    lookviewcontroller.nameArray = _nameArray;
    [self presentViewController:lookviewcontroller animated:YES completion:nil];
    
}

- (void)pressback {
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
