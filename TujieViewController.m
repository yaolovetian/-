//
//  TujieViewController.m
//  ling
//
//  Created by lb on 15/6/28.
//  Copyright (c) 2015年 凌兵. All rights reserved.
//

#import "TujieViewController.h"

@interface TujieViewController ()
{
    UICollectionView *_collectionView;
    NSMutableArray *_dataArr;
    AFHTTPRequestOperationManager *_manager;
}
@property(nonatomic,copy)UICollectionView *collectionView;
@property(nonatomic,copy)NSMutableArray *dataArr;
@property(nonatomic)NSInteger currentPage;
@property (nonatomic)BOOL isRefreshing;
@property (nonatomic)BOOL isLoadMoring;
@property (nonatomic,copy)NSString *categorys;

@end

@implementation TujieViewController
- (void)viewDidLoad {
    [super viewDidLoad];
 
    
}
-(void)first{
    self.dataArr = [[NSMutableArray alloc]init];
    _manager =[AFHTTPRequestOperationManager manager];
    _manager.responseSerializer =[AFHTTPResponseSerializer serializer];
    [self firstDownload];
    [self creatCollectionView];
}
-(void)firstDownload{
    self.currentPage = 1;
    self.isRefreshing = NO;
    self.isLoadMoring = NO;
    self.categorys =@"26";
    [self addTaskUrl:[NSString stringWithFormat:kUrl,self.categorys,self.currentPage]isRefresh:NO];
    
}
- (void)creatCollectionView {
    _dataArr = [[NSMutableArray alloc]init];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    self.collectionView.backgroundColor = [UIColor yellowColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, kScreenSize.width, kScreenSize.height-64) collectionViewLayout:layout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"AppCell" bundle:nil] forCellWithReuseIdentifier:@"AppCell"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    AppCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AppCell" forIndexPath:indexPath];
    AppModel *model = _dataArr[indexPath.row];
    [cell showDataWithModel:model indexPath:indexPath];
    NSLog(@"**********%@",cell);
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((kScreenSize.width-10)/2, 100);
}
-(void)addTaskUrl:(NSString *)url isRefresh:(BOOL)isRefresh{
    NSString *newUrl =[NSString stringWithFormat:kUrl,self.categorys,self.currentPage];
    __weak typeof(self)weakSelf =self;
    [_manager GET:newUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (responseObject) {
            if (weakSelf.currentPage ==1) {
                [weakSelf.dataArr removeAllObjects];
            }
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSArray *itemArr =dict[@"item"];
            for (NSDictionary *dictItem in itemArr) {
                AppModel *model =[[AppModel alloc]init];
                [model setValuesForKeysWithDictionary:dictItem];
                [weakSelf.dataArr addObject:model];
                
                
            }
            [weakSelf.collectionView reloadData];
            [weakSelf endRefreshing];
            
            
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [weakSelf endRefreshing];
        
    }];
    
}
#pragma mark -  创建刷新视图


- (void)creatRefreshView {
    __weak typeof(self)mySelf = self;
    [self.collectionView addRefreshHeaderViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        if (mySelf.isRefreshing) {
            return ;
        }
        mySelf.currentPage = 1;
        mySelf.isRefreshing = YES;
        [mySelf addTaskUrl:mySelf.requestUrl isRefresh:YES];
    }];
    [self.collectionView addRefreshFooterViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        if (mySelf.isLoadMoring) {
            return ;
        }
        mySelf.isLoadMoring = YES;
        mySelf.currentPage ++;
        [mySelf addTaskUrl:mySelf.requestUrl isRefresh:YES];
    }];
}
#pragma mark - 结束刷新

-(void)endRefreshing {
    if (self.isRefreshing) {
        self.isRefreshing = NO;
        [self.collectionView headerEndRefreshingWithResult:JHRefreshResultSuccess];
    }
    if (self.isLoadMoring) {
        self.isLoadMoring = NO;
        [self.collectionView footerEndRefreshing];
    }
}


@end
