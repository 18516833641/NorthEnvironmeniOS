//
//  AppDelegate.m
//  NorthEnvironmeniOS
//
//  Created by mac on 2020/8/11.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

#import "AppDelegate.h"

#import "loginViewController.h"
#import "RootNavigationController.h"
#import "IQKeyboardManager.h"
#import "homePageViewController.h"

#import "RootTabBarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:YES];
    
    
    
    //这里记录是不是第一次登录 保存用户信息 跳转RootVC
    NSUserDefaults *des = [NSUserDefaults standardUserDefaults];
    
    NSString * frist=[des objectForKey:@"ISFrist"];
    
    NSLog(@"--=--=-%@",frist);
    
    if ([frist intValue]==1) {
        
        self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        self.window.backgroundColor = [UIColor whiteColor];
        RootTabBarViewController*Root=[[RootTabBarViewController alloc]init];
        self.window.rootViewController=Root;
        
        [self.window makeKeyAndVisible];
        
    }else{
    UITabBarController *tabBarController = [[UITabBarController alloc] init];

    [tabBarController.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbarBackiamge"]];
        self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        self.window.backgroundColor = [UIColor whiteColor];
        loginViewController *Root=[[loginViewController alloc]init];
        
        self.window.rootViewController=Root;
        
        [self.window makeKeyAndVisible];
        
    }
    return YES;
}


@end
