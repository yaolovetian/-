//
//  WebViewController.h
//  ling
//
//  Created by lb on 15/6/27.
//  Copyright (c) 2015年 凌兵. All rights reserved.
//

#import "BaseViewController.h"
#import "MyAppModel.h"
#import "UIWebView+AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "AFNetworking.h"
#import "MyAppCell.h"
@class MyAppCell;
@interface WebViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    AFHTTPRequestOperationManager *_manager;
    //NSMutableArray *_dataArr;
    UITableView *_tableView;
    double _str;
    double _str1;
}
@property (nonatomic) UITableView * tableView;
@property (nonatomic) NSString * url;
- (void)downloadWebViewDataWithUrl:(NSString *)url;
@property (nonatomic) NSString * webUrl;
@property (nonatomic) NSString * aid;

@property (nonatomic,strong) NSMutableArray *dataArr;
@property (nonatomic) MyAppModel * model;
@property(nonatomic)double str;
@property(nonatomic)double str1;
@end
