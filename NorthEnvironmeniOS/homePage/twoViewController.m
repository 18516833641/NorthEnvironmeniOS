//
//  twoViewController.m
//  NorthEnvironmeniOS
//
//  Created by mac on 2020/8/15.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

#import "twoViewController.h"

@interface twoViewController ()

@end

@implementation twoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self getResult];
}

-(void)getResult{


 
    [PostService getHttpRequestURL:@"http://0a89d6c0a828.ngrok.io/jeecg/rest/bkComdecripController" RequestSuccess:^(id  _Nonnull repoes, NSURLSessionDataTask * _Nonnull task) {
        NSLog(@"----------%@",repoes);
    } RequestFaile:^(NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

@end
