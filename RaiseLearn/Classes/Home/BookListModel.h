//
//  BookListModel.h
//  RaiseLearn
//
//  Created by afarsoft on 2017/6/15.
//  Copyright © 2017年 afarsoft. All rights reserved.
//

#import "BaseModel.h"

@interface BookListModel : BaseModel

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *area;
@property(nonatomic,copy)NSString *des;
@property(nonatomic,copy)NSString *finish;
@property(nonatomic,copy)NSString *lastUpdate;
@property(nonatomic,copy)NSString *coverImg;

@end
