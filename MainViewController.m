//
//  MainViewController.m
//  ling
//
//  Created by lb on 15/6/26.
//  Copyright (c) 2015年 凌兵. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self firstView];
    [self creatTableView];
    [self dataInit];
    [self creatRefreshView];
    [self creatRefreshView];
    [self firstDownload];
  
    
}
- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}
-(void)firstView{
    
    self.navigationController.navigationBar.barTintColor =[UIColor redColor];
    self.navigationController.navigationBar.translucent = NO;
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item1;
    
    UIImage *image =[[UIImage imageNamed:@"setting@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIButton *button =[UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 0, 30, 30);
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item =[[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem =item;
    
    
    
}
-(void)btnClick:(UIButton *)button{
    SettingViewController *svc =[[SettingViewController alloc]init];
    [self.navigationController pushViewController:svc animated:YES];
    
}
-(void)dataInit{
    _manager = [AFHTTPRequestOperationManager manager];
    _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    _dataArr =[[NSMutableArray alloc]init];
}
-(void)firstDownload{
    self.currentPage = 1;
    self.isLoadMoring = NO;
    self.isRefreshing = NO;
    UIApplication *app = [UIApplication sharedApplication];
    AppDelegate *appDelegate = app.delegate;
    self.categorys =appDelegate.categorys;

        [self.tableView registerNib:[UINib nibWithNibName:@"MyCell" bundle:nil] forCellReuseIdentifier:@"MyCell"];
        [self.view addSubview:self.tableView];
        NSLog(@"%@",self.categorys);
        NSString *url =[NSString stringWithFormat:kUrl,self.categorys,self.currentPage];
//        NSLog(@"%@ %ld",self.categorys,self.currentPage);
//        NSLog(@"99999999%@",url);
        [self addTaskUrl:url isRefresh:YES];
    NSLog(@"%@",url);
        
   // }
    
}

-(void)addTaskUrl:(NSString *)url isRefresh:(BOOL)isRefresh{
    __weak typeof(self)weakSelf =self;
    [_manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (responseObject) {
            
            if (weakSelf.currentPage ==1) {
                [weakSelf.dataArr removeAllObjects];
            }
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            
            NSArray *itemArr =dict[@"item"];
            //  NSLog(@"****itemArr: %@",itemArr);
            for (NSDictionary *dictItem in itemArr) {
                AppModel *model =[[AppModel alloc]init];
                [model setValuesForKeysWithDictionary:dictItem];
                [weakSelf.dataArr addObject:model];
                
                
            }
            
            [weakSelf.tableView reloadData];
            [weakSelf endRefreshing];
            
            
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [weakSelf endRefreshing];
        
    }];
    
}
-(void)creatRefreshView{
    __weak typeof(self) weakSelf= self;
    [self.tableView addRefreshHeaderViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        if (weakSelf.isRefreshing) {
            return ;
        }
        weakSelf.currentPage =1;
        weakSelf.isRefreshing =YES;
        [weakSelf addTaskUrl:[NSString stringWithFormat:kUrl,weakSelf.categorys,weakSelf.currentPage] isRefresh:YES];
       
    }];
    [self.tableView addRefreshFooterViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        if (weakSelf.isLoadMoring) {
            return ;
        }
        weakSelf.isLoadMoring = YES;
        weakSelf.currentPage++;
        
        [weakSelf addTaskUrl:[NSString stringWithFormat:kUrl,weakSelf.categorys,weakSelf.currentPage] isRefresh:YES];
//        NSLog(@"##########%ld",weakSelf.currentPage);
        
        // NSLog(@"*******%@",weakSelf.requestUrl);
    }];
    
}
- (void)endRefreshing{
    if (self.isRefreshing) {
        self.isRefreshing = NO;
        [self.tableView headerEndRefreshingWithResult:JHRefreshResultSuccess];
    }
    if (self.isLoadMoring) {
        self.isLoadMoring = NO;
        [self.tableView footerEndRefreshing];
    }
}




-(void)creatTableView{
    self.dataArr =[[NSMutableArray alloc]init];
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenSize.width, kScreenSize.height-64) style:UITableViewStylePlain];
    self.tableView.dataSource =self;
    self.tableView.delegate =self;
    self.tableView.rowHeight =100;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell" forIndexPath:indexPath];
    AppModel *model =_dataArr[indexPath.row];
    
    [cell showDataWithModel:model indexPath:indexPath];
    return cell;
    
    
}
#pragma 要点
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AppModel*model = self.dataArr[indexPath.row];
 
    WebViewController *web =[[WebViewController alloc]init];
    web.url =[NSString stringWithFormat:kWebUrl,model.aid];
   // web.webUrl=[NSString stringWithFormat:kWebUrl,model.link];
    web.aid =model.aid;
//
//    NSLog(@"000000000%@",web.url);
    
    [self.navigationController pushViewController:web animated:YES];
    
}- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
