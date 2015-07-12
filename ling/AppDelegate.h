//
//  AppDelegate.h
//  ling
//
//  Created by lb on 15/6/25.
//  Copyright (c) 2015年 凌兵. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DDMenuController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,strong)DDMenuController *menuController;
@property (nonatomic, copy) NSString * categorys;
@property(nonatomic)double harry;
@property(nonatomic)double harry1;
@end

