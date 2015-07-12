//
//  MainViewController.h
//  ling
//
//  Created by lb on 15/6/26.
//  Copyright (c) 2015年 凌兵. All rights reserved.
//

#import "BaseViewController.h"
#import "AFNetworking.h"
#import "MyCell.h"
#import "AppCell.h"
#import "AppModel.h"
#import "MyAppModel.h"
#import "WebViewController.h"
#import "JHRefresh.h"
@interface MainViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectionView;
    UITableView *_tableView;
    NSMutableArray *_dataArr;

    AFHTTPRequestOperationManager *_manager;
    NSInteger _currentPage;
    BOOL _isRefreshing;
    BOOL _isLoadMoring;

    
}
@property(nonatomic)UICollectionView *collectionView;
@property (nonatomic, strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic)BOOL isRefreshing;
@property(nonatomic)BOOL isLoadMoring;

@property (nonatomic, copy) NSString * requestUrl;
@property (nonatomic, copy) NSString * count;
@property (nonatomic) NSInteger currentPage;
@property (nonatomic, copy) NSString * categorys;
-(void)firstDownload;
- (void)addTaskUrl:(NSString *)url isRefresh:(BOOL)isRefresh;

//刷新
- (void)creatRefreshView;

//结束刷新
- (void)endRefreshing;

//- (void)loadDataPage:(NSInteger)page count:(NSInteger)count;
@end
