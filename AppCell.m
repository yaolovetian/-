//
//  AppCell.m
//  ling
//
//  Created by lb on 15/6/27.
//  Copyright (c) 2015年 凌兵. All rights reserved.
//

#import "AppCell.h"

@implementation AppCell
{
    AFHTTPRequestOperationManager *_manager;
}
- (void)awakeFromNib {
    
}

-(void)showDataWithModel:(AppModel *)model indexPath:(NSIndexPath *)indexPath{
    self.model = model;
    [self.imageImageView sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:nil];
    self.titleLabel.text = model.title;
}
@end
