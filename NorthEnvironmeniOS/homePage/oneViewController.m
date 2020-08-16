//
//  oneViewController.m
//  NorthEnvironmeniOS
//
//  Created by mac on 2020/8/15.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

#import "oneViewController.h"

@interface oneViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation oneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self httpService];
}

-(void)httpService{

        [SVProgressHUD show];

        NSString *urlString = [NSString stringWithFormat:@"%@",Url_SeverGSJJ];
        NSLog(@"---%@",urlString);

             //请求数据
    [PostService AFHTTPSessionManager:urlString method:@"GET" params:@{} WithBlock:^(id  _Nonnull responseObject, NSError * _Nonnull error) {

               [SVProgressHUD dismiss];
               if (error) {
                   [SVProgressHUD showErrorWithStatus:@"网络请求失败，请重新尝试"];
               }else{
                   
                   
                   NSLog(@"---%@",[PostService DataTOjsonString:responseObject]);

                   NSString *htmlString = responseObject[@"data"][0][@"content"] ;

                   NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData: [htmlString dataUsingEncoding:NSUnicodeStringEncoding] options: @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes: nil error: nil];

                   self.textView.attributedText = attributedString;

          
//                 NSLog(@"---------%@",responseObject);
                   NSLog(@"---%@",[PostService DataTOjsonString:responseObject]);
 
               }

           }];
}


@end
