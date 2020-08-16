//
//  baseViewController.m
//  NorthEnvironmeniOS
//
//  Created by mac on 2020/8/16.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

#import "baseViewController.h"

@interface baseViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textview;

@end

@implementation baseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
      [self httpService];
}


-(void)httpService{

        [SVProgressHUD show];

        NSString *urlString = [NSString stringWithFormat:@"%@%@/%@",Url_Sever,_url,_listID];
        NSLog(@"---%@",urlString);

             //请求数据
    [PostService AFHTTPSessionManager:urlString method:@"GET" params:@{} WithBlock:^(id  _Nonnull responseObject, NSError * _Nonnull error) {

               [SVProgressHUD dismiss];
               if (error) {
                   [SVProgressHUD showErrorWithStatus:@"网络请求失败，请重新尝试"];
               }else{
                   
                   
                   NSLog(@"---%@",[PostService DataTOjsonString:responseObject]);
//                NSLog(@"---%@",responseObject[@"data"]);
                   NSString *htmlString = responseObject[@"data"][@"content"] ;
                   

                   NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData: [htmlString dataUsingEncoding:NSUnicodeStringEncoding] options: @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes: nil error: nil];

                   self.textview.attributedText = attributedString;

 
               }

           }];
}

@end
