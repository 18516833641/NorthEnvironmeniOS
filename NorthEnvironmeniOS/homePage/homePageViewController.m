//
//  homePageViewController.m
//  NorthEnvironmeniOS
//
//  Created by mac on 2020/8/11.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

#import "homePageViewController.h"
#import "oneViewController.h"
#import "twoViewController.h"
#import "threeViewController.h"
#import "fourViewController.h"
#import "fiveViewController.h"
#import "sixViewController.h"

@interface homePageViewController ()

@end

@implementation homePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"首页";
    
    [self httpService];
}

-(void)httpService{

        NSDictionary * dict=@{
    //                          @"username":@"inter",
    //                          @"password": @"123456",
                              };
        [SVProgressHUD show];

        NSString *urlString = [NSString stringWithFormat:@"%@",Url_SeverLogin];
        NSLog(@"---%@",urlString);

             //请求数据
           [PostService AFHTTPSessionManager:urlString method:@"POST" params:dict WithBlock:^(id  _Nonnull responseObject, NSError * _Nonnull error) {

               [SVProgressHUD dismiss];
               if (error) {
                   [SVProgressHUD showErrorWithStatus:@"网络请求失败，请重新尝试"];
               }else{

                   NSLog(@"---%@",[PostService DataTOjsonString:responseObject]);

                NSUserDefaults *userDefaultsUid = [NSUserDefaults standardUserDefaults];

                [userDefaultsUid setObject:responseObject[@"attributes"][@"id"] forKey:@"user_id"];
                [userDefaultsUid setObject:responseObject[@"attributes"][@"token"] forKey:@"token"];

               }

           }];
}


- (IBAction)zeroAction:(id)sender {
    NSLog(@"----");
}

- (IBAction)oneButAction:(id)sender {
    
    oneViewController *vc= [[oneViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    vc.title=@"公司简介";
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (IBAction)twoButAction:(id)sender {
    
       twoViewController *vc= [[twoViewController alloc]init];
       vc.hidesBottomBarWhenPushed = YES;
       vc.title=@"资质荣誉";
       [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)threeButAction:(id)sender {
    
       threeViewController *vc= [[threeViewController alloc]init];
       vc.hidesBottomBarWhenPushed = YES;
       vc.title=@"主营业务";
       [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)fourButAction:(id)sender {
    
       fourViewController *vc= [[fourViewController alloc]init];
       vc.hidesBottomBarWhenPushed = YES;
       vc.title=@"主导技术";
       [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)fiveButAction:(id)sender {
    
       fiveViewController *vc= [[fiveViewController alloc]init];
       vc.hidesBottomBarWhenPushed = YES;
       vc.title=@"行业应用";
       [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)sixButAction:(id)sender {
    
       sixViewController *vc= [[sixViewController alloc]init];
       vc.hidesBottomBarWhenPushed = YES;
       vc.title=@"工程案例";
       [self.navigationController pushViewController:vc animated:YES];
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
