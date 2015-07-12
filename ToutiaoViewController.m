//
//  ToutiaoViewController.m
//  ling
//
//  Created by lb on 15/6/26.
//  Copyright (c) 2015年 凌兵. All rights reserved.
//

#import "ToutiaoViewController.h"

@interface ToutiaoViewController ()

@end

@implementation ToutiaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self firstDownload];
    
    
}
-(void)firstDownload{
    self.currentPage = 1;
    self.isLoadMoring = NO;
    self.isRefreshing = NO;
    UIApplication *app = [UIApplication sharedApplication];
    AppDelegate *appDelegate = app.delegate;
    self.categorys =appDelegate.categorys;
    NSLog(@"%@",self.categorys);
    NSString *url =[NSString stringWithFormat:kUrl,self.categorys,self.currentPage];
    NSLog(@"%@ %ld",self.categorys,self.currentPage);
    NSLog(@"%@",url);
    [self addTaskUrl:url isRefresh:YES];
    
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
