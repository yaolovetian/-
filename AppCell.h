//
//  AppCell.h
//  ling
//
//  Created by lb on 15/6/27.
//  Copyright (c) 2015年 凌兵. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppModel.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
@interface AppCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic ,retain)AppModel *model;
@property (nonatomic, copy) NSString * catetorys;
-(void)showDataWithModel:(AppModel *)model indexPath:(NSIndexPath *)indexPath;
@end
