//
//  passwordViewController.m
//  NorthEnvironmeniOS
//
//  Created by mac on 2020/8/15.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

#import "passwordViewController.h"

@interface passwordViewController ()
@property (weak, nonatomic) IBOutlet UITextField *oldText;

@property (weak, nonatomic) IBOutlet UITextField *passText;

@property (weak, nonatomic) IBOutlet UITextField *aginPass;

@end

@implementation passwordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = Color_Base(26, 35, 49);
}

- (IBAction)onclickAction:(id)sender {
    
//        _userNameText.text = @"inter";
//        _userNameText.text = @"123456";
NSLog(@"---");
        NSDictionary * dict=@{
//                              @"username":@"inter",
//                              @"password": @"123456",
                              };
        [SVProgressHUD show];

        NSString *urlString = [NSString stringWithFormat:@"%@",Url_SeverXGMM];
        NSLog(@"---%@",urlString);

             //请求数据
           [PostService AFHTTPSessionManager:urlString method:@"PUT" params:dict WithBlock:^(id  _Nonnull responseObject, NSError * _Nonnull error) {

               [SVProgressHUD dismiss];
               if (error) {
                   [SVProgressHUD showErrorWithStatus:@"网络请求失败，请重新尝试"];
               }else{
//                     NSLog(@"---%@",responseObject);
                   NSLog(@"---%@",[PostService DataTOjsonString:responseObject]);


               }

           }];
    
}



@end
