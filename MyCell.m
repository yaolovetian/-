//
//  MyCell.m
//  ling
//
//  Created by lb on 15/6/27.
//  Copyright (c) 2015年 凌兵. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell
{
    NSInteger count;
    AFHTTPRequestOperationManager *_manager;
}
- (void)awakeFromNib {
    [self dataInit];
}
-(void)dataInit{
    _manager = [AFHTTPRequestOperationManager manager];
    _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    

}
-(void)showDataWithModel:(AppModel *)model indexPath:(NSIndexPath *)indexPath{
    self.model =model;
    [self.imageImageView sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:nil];
    self.titleLabel.text =model.title;
    self.descriptionLabel.text = model.description;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
