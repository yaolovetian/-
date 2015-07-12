//
//  SettingViewController.m
//  ling
//
//  Created by lb on 15/6/28.
//  Copyright (c) 2015年 凌兵. All rights reserved.
//

#import "SettingViewController.h"
#import "SDImageCache.h"
@interface SettingViewController ()<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
}
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showUI];
    
}
- (void)showUI {
    //分组样式表格
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
    //设置数据源
    _dataArray = [[NSMutableArray alloc] init];
    NSArray *pushArray = [[NSArray alloc] initWithObjects:@"系统设置",@"清除缓存", nil];
    [_dataArray addObject:pushArray];
    
    NSArray *infoArray = [[NSArray alloc] initWithObjects:@"关于应用",@"版本 V1.0",@"感谢使用", nil];
    [_dataArray addObject:infoArray];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataArray[section]count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"SettingCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    NSString *str = _dataArray[indexPath.section][indexPath.row];
    cell.textLabel.text = str;
    

    return cell;
}


#pragma mark - 获取缓存大小
- (CGFloat)getCachSize {
 
    NSUInteger imageCacheSize = [[SDImageCache sharedImageCache] getSize];
  
    
    NSString *myCachePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/MyCaches"];
    NSDirectoryEnumerator *enumerator = [[NSFileManager defaultManager] enumeratorAtPath:myCachePath];
    __block NSUInteger count = 0;
 
    for (NSString *fileName in enumerator) {
        NSString *path = [myCachePath stringByAppendingPathComponent:fileName];
        NSDictionary *fileDict = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil];
        count += fileDict.fileSize;//自定义所有缓存大小
    }
   
    CGFloat totalSize = ((CGFloat)imageCacheSize+count)/1024/1024;
    return totalSize;
}

//cell被选择
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        //0分区
        switch (indexPath.row) {
            case 1://清除缓存
            {
                UIAlertController *sheet = [UIAlertController alertControllerWithTitle:@"清除缓存" message:[NSString stringWithFormat:@"总共有%.5fM缓存",[self getCachSize]] preferredStyle:UIAlertControllerStyleActionSheet];
                //增加按钮
                [sheet addAction:[UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
                    //删除
                    //删除两部分
                    //1.删除 sd 图片缓存
                    //先清除内存中的图片缓存
                    [[SDImageCache sharedImageCache] clearMemory] ;
                    //清除磁盘的缓存
                    [[SDImageCache sharedImageCache] clearDisk];
                    
                    //2.删除自己缓存
                    NSString *myCachePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/MyCaches"];
                    [[NSFileManager defaultManager] removeItemAtPath:myCachePath error:nil];
                    
                    
                    
                }]];
                [sheet addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                    //取消
                }]];
                //跳转
                
                [self.view.window.rootViewController presentViewController:sheet animated:YES completion:nil];
                
            }
                break;
                
            default:
                break;
        }
        
    }else {
 
        switch (indexPath.row) {
            case 0://邮箱推荐
            {
                
            }
                break;
            case 1://AppStore地址(官方推荐)
            {
//                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/cn/app/ai-xian-mian-re-men-ying-yong/id468587292?mt=8"]];
            }
                break;
            case 2://官方微博
            {
//                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://weibo.com/jsttw"]];
            }
                break;
                
            default:
                break;
        }
    }
}
@end
