//
//  HomeViewController.m
//  RaiseLearn
//
//  Created by afarsoft on 2017/6/15.
//  Copyright © 2017年 afarsoft. All rights reserved.
//

#import "HomeViewController.h"
#import "BookListModel.h"
#import "HomeCell.h"
#import "ChaptersViewController.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,copy)NSMutableArray *dataArr;

@end

@implementation HomeViewController
{
    UITableView *homeTable;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
    [self sendRequestHomeData];
}
- (void)initUI{
    homeTable = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    homeTable.delegate = self;
    homeTable.dataSource = self;
    homeTable.rowHeight = 100;
    [self.view addSubview:homeTable];
    
    [homeTable registerNib:[UINib nibWithNibName:@"HomeCell" bundle:nil] forCellReuseIdentifier:@"homeCell"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"homeCell" forIndexPath:indexPath];
    BookListModel *model = _dataArr[indexPath.row];
    [cell configCell:model];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChaptersViewController *chapterVC = [[ChaptersViewController alloc]init];
    chapterVC.hidesBottomBarWhenPushed = YES;
    BookListModel *model = _dataArr[indexPath.row];
    chapterVC.novelName = model.name;
    PushController(chapterVC)
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)sendRequestHomeData{
    NSDictionary *param = @{@"key":APPKEY};
    [AFNetHelper POST:HomeURL parameters:param success:^(id responseObject) {
        NSData *data = (NSData *)responseObject;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        if ([[dic[@"error_code"] stringValue] isEqualToString:@"200"]) {
            NSArray *bookList = dic[@"result"][@"bookList"];
            for (NSDictionary *item in bookList) {
                BookListModel *model = [[BookListModel alloc]init];
                [model setValuesForKeysWithDictionary:item];
                [self.dataArr addObject:model];
            }
            [homeTable reloadData];
        }
    } failure:^(NSError *error) {
        
    }];
}
- (NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
@end
