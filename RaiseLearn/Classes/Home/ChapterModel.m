//
//  ChapterModel.m
//  RaiseLearn
//
//  Created by afarsoft on 2017/6/15.
//  Copyright © 2017年 afarsoft. All rights reserved.
//

#import "ChapterModel.h"

@implementation ChapterModel
- (void)setValue:(id)value forKey:(NSString *)key{
    
    //手动处理description
    if ([key isEqualToString: @"id"]) {
        
        _ID = value;
    }else{
        
        //调用父类方法，保证其他属性正常加载
        [super setValue:value forKey:key];
    }
}
@end
