//
//  AppDelegate.m
//  ling
//
//  Created by lb on 15/6/25.
//  Copyright (c) 2015年 凌兵. All rights reserved.
//

#import "AppDelegate.h"
#import "DDMenuController.h"
#import "MainViewController.h"
#import "LeftViewController.h"
#import "SettingViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize window = _window;
@synthesize menuController = _menuController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    MainViewController *main=[[MainViewController alloc]init];
    self.categorys = @"0";
    main.title =@"头条精选";
    UINavigationController *nav =[[UINavigationController alloc]initWithRootViewController:main];
    
    DDMenuController *rootController = [[DDMenuController alloc]initWithRootViewController:nav];
    _menuController =rootController;
    LeftViewController *left =[[LeftViewController alloc]init];
    rootController.leftViewController =left;
    //SettingViewController *setting =[[SettingViewController alloc]init];
    //rootController.rightViewController = setting;
    self.window.rootViewController =rootController;
    
    
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
