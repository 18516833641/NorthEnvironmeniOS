//
//  zeroViewController4.m
//  NorthEnvironmeniOS
//
//  Created by mac on 2020/8/22.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

#import "zeroViewController4.h"
#import "fourTableViewCell.h"

@interface zeroViewController4 ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong)NSArray               * nameArr;

@property (nonatomic,strong)NSArray               * IconArrl;

@end

@implementation zeroViewController4

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [_tableView registerNib:[UINib nibWithNibName:@"fourTableViewCell" bundle:nil] forCellReuseIdentifier:@"fourTableViewCell"];
       _tableView.backgroundColor = Color_Base(26, 35, 49);
       
       _nameArr=@[@"故障中",@"已解除"];
       _IconArrl=@[@"YYXM_gzz",@"YYXM_yjc"];
    
    [self httpService];
}

-(void)httpService{

        [SVProgressHUD show];

        NSString *urlString = [NSString stringWithFormat:@"%@",Url_SeverHQQX];
        NSLog(@"---%@",urlString);

             //请求数据
    [PostService AFHTTPSessionManager:urlString method:@"GET" params:@{} WithBlock:^(id  _Nonnull responseObject, NSError * _Nonnull error) {

               [SVProgressHUD dismiss];
               if (error) {
                   [SVProgressHUD showErrorWithStatus:@"网络请求失败，请重新尝试"];
               }else{
                   
                   
                   NSLog(@"-------%@",[PostService DataTOjsonString:responseObject]);

//                   NSString *htmlString = responseObject[@"data"][0][@"content"] ;

//                   NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData: [htmlString dataUsingEncoding:NSUnicodeStringEncoding] options: @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes: nil error: nil];
//
//                   self.textView.attributedText = attributedString;
//
//          
////                 NSLog(@"---------%@",responseObject);
//                   NSLog(@"---%@",[PostService DataTOjsonString:responseObject]);
 
               }

           }];
}

#pragma mark - delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    fourTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fourTableViewCell"];
    if(!cell){
        cell = [[fourTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"fourTableViewCell"];
    }
    cell.backgroundColor = Color_Base(26, 35, 49);
    
    if (indexPath.row == 0) {
        cell.titleLabel.textColor = UIColor.redColor;
    }
    
    cell.titleLabel.text = [NSString stringWithFormat:@"%@",_nameArr[indexPath.item]];
    cell.headImage.image = [UIImage imageNamed:_IconArrl[indexPath.item]];
    
     return cell;
    
    

    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSUserDefaults *des = [NSUserDefaults standardUserDefaults];
//    NSString *uid = [des objectForKey:@"UID"];
//    if (uid == nil) {
//        LoginViewController *login = [[LoginViewController alloc]init];
//        [self presentViewController:login animated:YES completion:nil];}else{
    
    switch (indexPath.row) {
            case 0:
//                if (indexPath.row == 0) {
//                    PersonUserInfoViewController *vc= [[PersonUserInfoViewController alloc]init];
//                   vc.hidesBottomBarWhenPushed = YES;
//                   vc.title=@"账户资料";
//                   [self.navigationController pushViewController:vc animated:YES];
//                }else{
//                    PersonPasswordViewController *vc=[[PersonPasswordViewController alloc]init];
//                    vc.hidesBottomBarWhenPushed = YES;
//                    vc.title=@"修改密码";
//                    [self.navigationController pushViewController:vc animated:YES];
//                }
                break;
            case 1:
//                       if (indexPath.row == 0) {
//                           PersonAboutUsViewController *vc=[[PersonAboutUsViewController alloc]init];
//                           vc.hidesBottomBarWhenPushed = YES;
//                           vc.title=@"关于我们";
//                           [self.navigationController pushViewController:vc animated:YES];
//                       }else{
//                           PersonVersionViewController *vc=[[PersonVersionViewController alloc]init];
//                           vc.hidesBottomBarWhenPushed = YES;
//                           vc.title=@"版本信息";
//                           [self.navigationController pushViewController:vc animated:YES];
//                       }
                       break;
            case 2:
            if (indexPath.row == 0) {
//                PersonFeedbackViewController *vc=[[PersonFeedbackViewController alloc]init];
//                vc.hidesBottomBarWhenPushed = YES;
//                vc.title=@"意见反馈";
//                [self.navigationController pushViewController:vc animated:YES];
            }
            break;
            
        default:
            
            
            break;
    }
    


}

@end
