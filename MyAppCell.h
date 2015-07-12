//
//  MyAppCell.h
//  ling
//
//  Created by lb on 15/6/29.
//  Copyright (c) 2015年 凌兵. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyAppModel.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"


@interface MyAppCell : UITableViewCell
{
    double _str;
    double _str1;
}
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *pubDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *strLabel;

@property (weak, nonatomic) IBOutlet UIImageView *strImageView;
@property (weak, nonatomic) IBOutlet UIImageView *picImageView;
@property(nonatomic)NSMutableArray *dataArr;

@property (nonatomic, retain) MyAppModel * model;
-(void)showDataWithModel:(MyAppModel *)model;
-(void)showLabelWithModel:(NSString*)content;
-(void)showPicWithModel:(NSString*)pics;
-(void)showImageWithModel:(NSString*)content;
@property (nonatomic, copy) NSString * strHeight;
@property (nonatomic, copy) NSString * strEight;
@property(nonatomic)double str;
@property(nonatomic)double str1;


@end
