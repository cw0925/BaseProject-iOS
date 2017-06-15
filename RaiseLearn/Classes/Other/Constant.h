//
//  Constant.h
//  RaiseLearn
//
//  Created by afarsoft on 2017/6/15.
//  Copyright © 2017年 afarsoft. All rights reserved.
//

#ifndef Constant_h
#define Constant_h
//接口appkey
#define APPKEY @"7c6c5c86819d0805f5dfa912342346bc"
//接口地址
//首页
#define HomeURL @"http://japi.juhe.cn/comic/book"
//章节列表
#define ChapterURL @"http://japi.juhe.cn/comic/chapter"
//内容
#define ContentURL @"http://japi.juhe.cn/comic/chapterContent"
/**屏幕参数*/
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ViewWidth  self.view.frame.size.width
#define ViewHeight self.view.frame.size.height
/**Color(有参数)*/
#define RGBColor(R,G,B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1]
#define RGBAColor(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
/**PushController*/
#define PushController(controller) [self.navigationController pushViewController:controller animated:YES];
#endif /* Constant_h */
