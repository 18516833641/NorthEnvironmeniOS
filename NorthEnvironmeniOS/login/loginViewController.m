//
//  loginViewController.m
//  NorthEnvironmeniOS
//
//  Created by mac on 2020/8/11.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

#import "loginViewController.h"
#import "RootTabBarViewController.h"

@interface loginViewController ()

@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    Color_Base(36, 100, 123);
}

- (IBAction)forgetAction:(id)sender {
    
}

- (IBAction)loginAction:(id)sender {
    
    _userNameText.text = @"inter";
    _userNameText.text = @"123456";

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

//               NSLog(@"----===%@",responseObject);
               NSLog(@"---%@",[PostService DataTOjsonString:responseObject]);
//                NSLog(@"----===%@",jsonData);
            NSUserDefaults *userDefaultsUid = [NSUserDefaults standardUserDefaults];

            [userDefaultsUid setObject:responseObject[@"attributes"][@"id"] forKey:@"user_id"];
            [userDefaultsUid setObject:responseObject[@"attributes"][@"token"] forKey:@"token"];

            __unsafe_unretained __typeof(self) weakSelf = self;
            RootTabBarViewController *tab = [[RootTabBarViewController alloc]init];
            weakSelf.view.window.rootViewController = tab;
            [userDefaultsUid setObject:responseObject[@"attributes"][@"token"] forKey:@"ISFrist"];//记录是否第一次登录

           }

       }];
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
