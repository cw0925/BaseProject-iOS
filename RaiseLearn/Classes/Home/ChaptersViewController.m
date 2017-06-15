//
//  ChaptersViewController.m
//  RaiseLearn
//
//  Created by afarsoft on 2017/6/15.
//  Copyright © 2017年 afarsoft. All rights reserved.
//

#import "ChaptersViewController.h"
#import "ChapterModel.h"
#import "ContentViewController.h"

@interface ChaptersViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,copy)NSMutableArray *dataArr;
@end

@implementation ChaptersViewController
{
    UITableView *chapterTable;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
    [self sendRequestChaptersData];
}
- (void)initUI{
    chapterTable = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    chapterTable.delegate = self;
    chapterTable.dataSource = self;
    [self.view addSubview:chapterTable];
    
    [chapterTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"chapterCell"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"chapterCell" forIndexPath:indexPath];
    ChapterModel *model = _dataArr[indexPath.row];
    cell.textLabel.text = model.name;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ContentViewController *contentVC = [[ContentViewController alloc]init];
    contentVC.name = _novelName;
    ChapterModel *model = _dataArr[indexPath.row];
    contentVC.chapterID = model.ID;
    PushController(contentVC)
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sendRequestChaptersData{
    NSDictionary *param = @{@"key":APPKEY,@"comicName":_novelName};
    [AFNetHelper POST:ChapterURL parameters:param success:^(id responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if ([[dic[@"error_code"] stringValue] isEqualToString:@"200"]) {
            NSArray *chapterList = dic[@"result"][@"chapterList"];
            for (NSDictionary *item in chapterList) {
                ChapterModel *model = [[ChapterModel alloc]init];
                [model setValuesForKeysWithDictionary:item];
                [self.dataArr addObject:model];
            }
            [chapterTable reloadData];
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
