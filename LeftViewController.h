//
//  LeftViewController.h
//  ling
//
//  Created by lb on 15/6/25.
//  Copyright (c) 2015年 凌兵. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "DDMenuController.h"
#import "MainViewController.h"
@interface LeftViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_dataArr;
    NSMutableArray *_pictureArr;
    NSMutableArray *_pictureArr2;
    NSMutableArray *_categorysArr;
    NSInteger _space;
}
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic)NSInteger space;

@end
