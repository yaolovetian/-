//
//  MyAppModel.h
//  ling
//
//  Created by lb on 15/6/27.
//  Copyright (c) 2015年 凌兵. All rights reserved.
//

#import "MyModel.h"

@interface MyAppModel : MyModel
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong)NSArray *content ;
@property(nonatomic,strong)NSArray *pics;
@property (nonatomic, strong) NSString * pubDate;
@property (nonatomic, strong) NSString * link;
@property (nonatomic) NSString * description;
@end
