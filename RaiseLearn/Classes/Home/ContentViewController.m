//
//  ContentViewController.m
//  RaiseLearn
//
//  Created by afarsoft on 2017/6/15.
//  Copyright © 2017年 afarsoft. All rights reserved.
//

#import "ContentViewController.h"

@interface ContentViewController ()
@property(nonatomic,copy)NSMutableArray *dataArr;
@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self sendRequestContentData];
    //NSLog(@"%@-%@",_name,_chapterID);
}
- (void)initUI{
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:self.view.frame];
    scroll.contentSize = CGSizeMake(0, ViewHeight*_dataArr.count);
    scroll.pagingEnabled = YES;
    [self.view addSubview:scroll];
    
    for (NSInteger i = 0; i<_dataArr.count; i++) {
        UIImageView *imv = [[UIImageView alloc]initWithFrame:CGRectMake(0, ViewHeight*i, ViewWidth, ViewHeight)];
        [imv sd_setImageWithURL:[NSURL URLWithString:_dataArr[i]] placeholderImage:[UIImage imageNamed:@""]];
        [scroll addSubview:imv];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sendRequestContentData{
    NSDictionary *param = @{@"key":APPKEY,@"comicName":_name,@"id":_chapterID};
    [AFNetHelper POST:ContentURL parameters:param success:^(id responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if ([[dic[@"error_code"] stringValue] isEqualToString:@"200"]) {
            NSArray *imageList = dic[@"result"][@"imageList"];
            for (NSDictionary *item in imageList) {
                NSString *imgUrl = item[@"imageUrl"];
                [self.dataArr addObject:imgUrl];
            }
            [self initUI];
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
