//
//  oneViewController.m
//  NorthEnvironmeniOS
//
//  Created by mac on 2020/8/15.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

#import "oneViewController.h"

@interface oneViewController ()

@end

@implementation oneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self httpService];
}

-(void)httpService{
   
    
     NSUserDefaults *des = [NSUserDefaults standardUserDefaults];
      
     NSString * token=[des objectForKey:@"token"];
    
        NSDictionary * dict=@{
                              @"X-AUTH-TOKEN":token,
                              };
        [SVProgressHUD show];

        NSString *urlString = [NSString stringWithFormat:@"%@",Url_SeverGSJJ];
        NSLog(@"---%@",urlString);
NSLog(@"---%@",dict);
             //请求数据
           [PostService AFHTTPSessionManager:urlString method:@"GET" params:dict WithBlock:^(id  _Nonnull responseObject, NSError * _Nonnull error) {

               [SVProgressHUD dismiss];
               if (error) {
                   [SVProgressHUD showErrorWithStatus:@"网络请求失败，请重新尝试"];
               }else{
                   
                   
                   NSLog(@"---%@",[PostService DataTOjsonString:responseObject]);
                   NSLog(@"---%@",responseObject[@"data"][0][@"content"]);
                   
                   UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 30, 300, 500)];

//                   textView.backgroundColor = [UIColor redColor];

                   [self.view addSubview:textView];

                   NSString *htmlString = responseObject[@"data"][0][@"content"] ;

                   NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData: [htmlString dataUsingEncoding:NSUnicodeStringEncoding] options: @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes: nil error: nil];

                   textView.attributedText = attributedString;

          
//                 NSLog(@"---------%@",responseObject);
                   NSLog(@"---%@",[PostService DataTOjsonString:responseObject]);
 
               }

           }];
}


@end
