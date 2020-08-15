//
//  RootTabBarViewController.m
//  HourseManage
//
//  Created by mac on 2019/11/4.
//  Copyright © 2019 jietingzhang. All rights reserved.
//

#import "RootTabBarViewController.h"
#import "RootNavigationController.h"
#import "homePageViewController.h"
#import "personalViewController.h"
#import "setUpViewController.h"


@interface RootTabBarViewController ()

@end

@implementation RootTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tabBar.barTintColor = Color_Base(26, 35, 49);
    [self creatTabBarItem];
}


-(void)creatTabBarItem
{
    RootNavigationController *homePage = [self tabBarWithController:[[homePageViewController alloc]init] andTitle:@"首页" andNormalImage:@"home" andSelectImage:@"homeSelect"];

    RootNavigationController *persona = [self tabBarWithController:[[personalViewController alloc]init] andTitle:@"个人中心" andNormalImage:@"person" andSelectImage:@"personSelect"];
    
     RootNavigationController *setup = [self tabBarWithController:[[setUpViewController alloc]init] andTitle:@"设置" andNormalImage:@"setUp" andSelectImage:@"setUpSelect"];
    
    self.viewControllers = @[homePage,persona,setup];
}

- (RootNavigationController *)tabBarWithController:(UIViewController *)controller andTitle:(NSString *)title andNormalImage:(NSString *)normalImage andSelectImage:(NSString *)selectImage{

    RootNavigationController *nc = [[RootNavigationController alloc]initWithRootViewController:controller];

    UIImage *normal = [[UIImage imageNamed:normalImage] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
// normalimageViewsetContentMode:UIViewContentModeScaleAspectFill];
//    [normal imageWithRenderingMode:UIViewContentModeCenter];
    UIImage *select = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];

    controller.tabBarItem = [[UITabBarItem alloc]initWithTitle:title image:normal selectedImage:select];

    self.tabBar.tintColor = Color_Base(30, 243, 254);
    return nc;
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
