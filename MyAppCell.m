//
//  MyAppCell.m
//  ling
//
//  Created by lb on 15/6/29.
//  Copyright (c) 2015年 凌兵. All rights reserved.
//

#import "MyAppCell.h"
#import "UIImageView+WebCache.h"

@implementation MyAppCell
{
    AFHTTPRequestOperationManager *_manager;
}
- (void)awakeFromNib {
    self.selectionStyle =UITableViewCellSelectionStyleNone;
    
}

-(void)showDataWithModel:(MyAppModel *)model{
    self.model = model;
    self.titleLabel.text = model.title;
//    NSLog(@"%@",self.titleLabel);
//    NSLog(@"%@",self.model.pics);
//    NSLog(@"%@",self.model.content);
    self.pubDateLabel.text =model.pubDate;
  
    
}

-(void)showImageWithModel:(NSString*)content{
//           [self.picImageView sd_setImageWithURL:[NSURL URLWithString:content]placeholderImage:nil];
    [self.picImageView sd_setImageWithURL:[NSURL URLWithString:content] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.str =image.size.height/image.size.width;
        UIApplication *important =[UIApplication sharedApplication];
        AppDelegate *weDelegate =important.delegate;
        weDelegate.harry =self.str;
//        NSLog(@"%f",weDelegate.harry);
    
       
        
        
    }];
// NSLog(@"%@",self.imageView);

    
}
-(void)showLabelWithModel:(NSString*)content{
    self.strLabel.text = content;
//    NSLog(@"*******打印 我的######%@",self.textLabel);
 
}
-(void)showPicWithModel:(NSString *)pics{
    //[self.strImageView sd_setImageWithURL:[NSURL URLWithString:pics]placeholderImage:nil];
    [self.strImageView sd_setImageWithURL:[NSURL URLWithString:pics] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.str1 =image.size.height/image.size.width;
        UIApplication *important1 =[UIApplication sharedApplication];
        AppDelegate *weDelegate1 =important1.delegate;
        weDelegate1.harry1 =self.str1;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"tongzhi" object:nil userInfo:nil];
//        NSLog(@"%f",weDelegate1.harry1);
        
    }];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end

