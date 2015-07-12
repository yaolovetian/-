//
//  WebViewController.m
//  ling
//
//  Created by lb on 15/6/27.
//  Copyright (c) 2015年 凌兵. All rights reserved.
//

#import "WebViewController.h"
#import "MyAppModel.h"
#import "MyAppCell.h"
#import "AppDelegate.h"
@interface WebViewController ()<UIWebViewDelegate>


@property (nonatomic, strong) UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self createWebView];
    [self dataInit];
//    NSLog(@"%@",self.url);
    self.webView.backgroundColor =[UIColor whiteColor];
    [self downloadWebViewDataWithUrl:self.url];
    [self creatTableView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tongzhiClick:) name:@"tongzhi" object:nil];
}
-(void)tongzhiClick:(NSNotificationCenter *)tong{

//    [self.tableView reloadData];

}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}
-(void)dataInit{
    _manager = [AFHTTPRequestOperationManager manager];
    _manager.responseSerializer =[AFHTTPResponseSerializer serializer];
    _dataArr =[[NSMutableArray alloc]init];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}
- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}
//-(void)viewDidAppear:(BOOL)animated{
//    [self.tableView reloadData];
//}
- (void)createWebView {
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.webUrl]];
    [self.webView loadRequest:request];
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
  
}
-(void)downloadWebViewDataWithUrl:(NSString *)url{
   
    [_manager GET:self.url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (responseObject) {
    
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
          
            NSArray *itemArr = dict[_aid];

            for (NSDictionary *dictItem in itemArr) {
                MyAppModel *model =[[MyAppModel alloc]init];
                [model setValuesForKeysWithDictionary:dictItem];
            
                [_dataArr addObject:model];
            }
        }
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
-(void)creatTableView{
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenSize.width, kScreenSize.height-64) style:UITableViewStylePlain];
    self.tableView.dataSource =self;
    self.tableView.delegate =self;
    [self.tableView registerNib:[UINib nibWithNibName:@"MyAppCell" bundle:nil] forCellReuseIdentifier:@"MyAppCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"One" bundle:nil] forCellReuseIdentifier:@"One"];
    [self.tableView registerNib:[UINib nibWithNibName:@"Two" bundle:nil] forCellReuseIdentifier:@"Two"];
    [self.tableView registerNib:[UINib nibWithNibName:@"Three" bundle:nil] forCellReuseIdentifier:@"Three"];
    [self.view addSubview:self.tableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  
    if (((MyAppModel *)self.dataArr.firstObject).pics.count) {
       
//        NSLog(@"*****%lu",((MyAppModel *)self.dataArr.lastObject).content.count+((MyAppModel *)self.dataArr.lastObject).pics.count);
        return ((MyAppModel *)self.dataArr.lastObject).content.count*2;
    }else{
//        NSLog(@"&&&&%lu",(unsigned long)((MyAppModel *)self.dataArr.lastObject).content.count);
        return 1+((MyAppModel *)self.dataArr.lastObject).content.count;
       
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    MyAppModel *model = (MyAppModel *)self.dataArr.lastObject;
  
    if (model.pics ==nil) {
        if (indexPath.row ==0) {
            
            MyAppCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyAppCell" forIndexPath:indexPath];
           
           [cell showDataWithModel:model];
           
           return cell;
        }else{
            
            MyAppCell *cell =[tableView dequeueReusableCellWithIdentifier:@"Three" forIndexPath:indexPath];
            //NSString *str = model.content[indexPath.row-1];
            NSString *str = model.content[indexPath.row-1];
          
                [cell showImageWithModel:str];
            
            return cell;
        }
    }else{

        if (indexPath.row ==0) {
            
            MyAppCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyAppCell" forIndexPath:indexPath];
            [cell showDataWithModel:model];
            
            return cell;
        }else if(indexPath.row%2==1){
            
            MyAppCell *cell = [tableView dequeueReusableCellWithIdentifier:@"One" forIndexPath:indexPath];
            NSString *str = model.content[indexPath.row/2];
            [cell showLabelWithModel:str];
            return cell;
        }else{
            MyAppCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Two" forIndexPath:indexPath];
            NSString *str = model.pics[indexPath.row/2-1];
                [cell showPicWithModel:str];
                return cell;
            
     }

    
 }

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyAppModel *model = (MyAppModel *)self.dataArr.lastObject;
    CGFloat height = 0 ;
    
   
    if (model.pics ==nil) {
        if (indexPath.row ==0) {
            height +=8+[LZXHelper textHeightFromTextString:model.title width:kScreenSize.width-16 fontSize:17];
            height+=8+[LZXHelper textHeightFromTextString:model.pubDate width:kScreenSize.width-16 fontSize:12];
            height += (8+32+8);
            
            return height;
        }else{
            
            if (!self.str) {
                return 300;
            }
            UIApplication *important =[UIApplication sharedApplication];
            AppDelegate *weDelegate =important.delegate;
            self.str = weDelegate.harry;
            height +=8+ (kScreenSize.width-16)*self.str;
            height +=8+32+8;
            
            return height;
      }

    }else{
        
        if (indexPath.row ==0) {
            height +=8+[LZXHelper textHeightFromTextString:model.title width:kScreenSize.width-16 fontSize:17];
            height+=8+[LZXHelper textHeightFromTextString:model.pubDate width:kScreenSize.width-16 fontSize:12];
            height+=8+32+8;
            return height;
            
            }else if(indexPath.row%2==1){
                if (indexPath.row/2 < model.content.count) {
                    height+=8+[LZXHelper textHeightFromTextString:model.content[indexPath.row/2] width:kScreenSize.width-16 fontSize:17];
                    height+=8+32+8;
                    return height;
                }
                return 0;
        }else{
            if (indexPath.row/2-1<model.content.count) {
                height+=240;
                return height;
            }
//            UIApplication *important1 =[UIApplication sharedApplication];
//            AppDelegate *weDelegate1 =important1.delegate;
//            self.str1 = weDelegate1.harry1;
//            NSLog(@"%f",self.str1);
//            NSLog(@"%f",weDelegate1.harry1);
//            height +=8+ (kScreenSize.width-16)*self.str1 ;
//              NSLog(@"%f",height);
//            height +=8+32+8;
//              NSLog(@"%f",height);
//            return height;
            return 0;
        }
    }
    
  
}



@end
