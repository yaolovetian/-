//
//  Define.h
//  ling
//
//  Created by lb on 15/6/26.
//  Copyright (c) 2015年 凌兵. All rights reserved.
//

#ifndef ling_Define_h
#define ling_Define_h
#define kScreenSize [UIScreen mainScreen].bounds.size
#import "LZXHelper.h"

#define kToutiaojinxuan @"0"
#define kJinritoutiao @"1"
#define kKongxuelaifeng @"2"
#define kWangyouyuanchuang @"4"
#define kDujiayuanchuang @"5"
#define kHaiwaikanzhongguo @"6"
#define kTujiejunshi @"20"
#define kMingjiazhuanlan @"25"
#define kJunshiretu @"26"
#define kJunshizhongheng @"27"
#define kUrl @"http://app.milnews.com/?app=ifapp&controller=index&action=new_app_list&classid=%@&page=%ld"
#define kWebUrl @"http://app.milnews.com/?app=ifapp&controller=index&action=get&id=%@"
#ifndef __UpLine__

#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#endif
#endif












