//
//  LeftViewController.m
//  ling
//
//  Created by lb on 15/6/25.
//  Copyright (c) 2015年 凌兵. All rights reserved.
//

#import "LeftViewController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dataInit];
    [self creatTableView];
//    [self createLabel];
    
}
//-(void)createLabel{
//    UIView *view1 =[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenSize.width, 15)];
//    view1.backgroundColor =[UIColor redColor];
//    UIView *view =[[UIView alloc]initWithFrame:CGRectMake(0, 10, kScreenSize.width, 54)];
//    view.backgroundColor =[UIColor redColor];
//    UILabel *label =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 160, 64)];
//    label.text =@"军闻天下";
//    label.font = [UIFont boldSystemFontOfSize:17];
//    //label.textAlignment = NSTextAlignmentNatural;
//    label.textAlignment =NSTextAlignmentCenter;
//    [view1 addSubview:label];
//    [view addSubview:label];
//    [self.view addSubview:view];
//    [self.view addSubview:view1];
//
//}

-(void)dataInit{
    self.space =(kScreenSize.height-10*44-22)/2;
    _dataArr =[[NSMutableArray alloc]init];
    _pictureArr = [[NSMutableArray alloc]init];
    _pictureArr2 = [[NSMutableArray alloc]init];
    _categorysArr =[[NSMutableArray alloc]init];
    NSArray *titles = @[@"头条精选",@"今日头条",@"空穴来风",@"网友原创",@"独家原创",@"海外看中国",@"图解军事",@"名家专栏",@"军事热图",@"军事纵横"];
    NSArray *pictures= @[@"toutiaojingxuan",@"toutiao",@"kongxuelaifeng",@"wangyou",@"dujiayuanchuang",@"haiwaikanzhongguo",@"tujiejunshi",@"mingjiazhuanlan",@"junshiretu",@"junshizongheng"];
    NSArray *pictures2= @[@"toutiaojingxuan_selected",@"toutiao_selected",@"kongxuelaifeng_selected",@"wangyou_selected",@"dujiayuanchuang_selected",@"haiwaikanzhongguo_selected",@"tujiejunshi_selected",@"mingjiazhuanlan_selected",@"junshiretu_selected",@"junshizongheng_selected"];
    NSArray *categorys = @[kToutiaojinxuan,kJinritoutiao,kKongxuelaifeng,kWangyouyuanchuang,kDujiayuanchuang,kHaiwaikanzhongguo,kTujiejunshi,kMingjiazhuanlan,kJunshiretu,kJunshizhongheng];
        [_dataArr addObjectsFromArray:titles];
    [_pictureArr addObjectsFromArray:pictures];
    [_pictureArr2 addObjectsFromArray:pictures2];
    [_categorysArr addObjectsFromArray:categorys];
}
-(void)creatTableView{
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate =self;
    self.tableView.dataSource =self;
    self.tableView.scrollEnabled = NO;
//    self.tableView.rowHeight = 40;
    self.tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    self.tableView.contentInset=UIEdgeInsetsMake(self.space, 0, 0, 0);
    [self.view addSubview:self.tableView];
   
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellId =@"Cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
        
    }
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(40, 15, 20, 20)];
    image.image =[UIImage imageNamed:_pictureArr[indexPath.row]];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(70, 15, 100, 20)];
    label.text =_dataArr[indexPath.row];
    label.textColor = [UIColor redColor];
    [cell addSubview:image];
    [cell addSubview:label];
    cell.backgroundColor =[UIColor clearColor];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
     MainViewController*main=[[MainViewController alloc]init];
    NSString *str=_dataArr[indexPath.row];
    main.title=str;
    NSString *categorys =_categorysArr[indexPath.row];
    NSLog(@"%@",categorys);
    UIApplication *app = [UIApplication sharedApplication];
    AppDelegate *appDelegate =app.delegate;
    appDelegate.categorys=categorys;
    NSLog(@"*********%@",appDelegate.categorys);
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:main];
    [menuController setRootController:nav animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
//-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
