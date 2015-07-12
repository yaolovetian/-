//
//  BaseViewController.m
//  ling
//
//  Created by lb on 15/6/25.
//  Copyright (c) 2015年 凌兵. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self firstView];
    self.view.backgroundColor = [UIColor whiteColor];
}
-(void)firstView{
//    UILabel *title =[[UILabel alloc]initWithFrame:self.view.bounds];
//    title.backgroundColor =[UIColor clearColor];
//    self.navigationItem.titleView =title;
   // [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbar"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barTintColor =[UIColor redColor];
    self.navigationController.navigationBar.translucent = NO;
//    self.extendedLayoutIncludesOpaqueBars = YES;
    //[self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,nil]];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item1;
//    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    UIImage *image =[[UIImage imageNamed:@"seting_btn"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
   
   
   
    button.frame = CGRectMake(0, 0, 50, 30);
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item =[[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem =item;
    
    
    
}
-(void)btnClick:(UIButton *)button{
    SettingViewController *svc =[[SettingViewController alloc]init];
    //[self.navigationController presentViewController:svc animated:YES completion:nil];
    [self.navigationController pushViewController:svc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
