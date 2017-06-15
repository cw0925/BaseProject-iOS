//
//  HomeCell.h
//  RaiseLearn
//
//  Created by afarsoft on 2017/6/15.
//  Copyright © 2017年 afarsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookListModel.h"


@interface HomeCell : UITableViewCell
- (void)configCell:(BookListModel *)model;
@end
