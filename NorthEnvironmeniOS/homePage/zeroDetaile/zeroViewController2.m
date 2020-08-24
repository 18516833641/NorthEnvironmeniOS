//
//  zeroViewController2.m
//  NorthEnvironmeniOS
//
//  Created by mac on 2020/8/22.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

#import "zeroViewController2.h"


@interface zeroViewController2 ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong)NSArray               * nameArr;

@property (nonatomic,strong)NSArray               * titleArr;




@end

@implementation zeroViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_tableView registerNib:[UINib nibWithNibName:@"zeroTableViewCell" bundle:nil] forCellReuseIdentifier:@"zeroTableViewCell"];
    
    _nameArr=@[@"脱硫入口烟气O2浓度",@"脱硫入口烟气SO2浓度",@"脱脱硫入口烟气NOX浓度",@"脱硫入口烟气粉尘含量",@"脱硫入口烟气流量",@"脱硫出口烟气SO2浓度",@"脱硫塔压差",@"除尘器压差",@"本小时出口SO2小时均值",@"上一小时出口SO2小时均值",@"上一小时入口SO2小时均值",@"上一小时入口SO2小时均值"];
     [self httpService];
}

-(void)httpService{

//    [_dataSource removeAllObjects];
    
    [SVProgressHUD show];

    NSString *urlString = [NSString stringWithFormat:@"%@?itmeid=1",Url_SeverYYXM];
    
    NSLog(@"---%@",urlString);

             //请求数据
    [PostService AFHTTPSessionManager:urlString method:@"PUT" params:@{} WithBlock:^(id  _Nonnull responseObject, NSError * _Nonnull error) {

               [SVProgressHUD dismiss];
               if (error) {
                   [SVProgressHUD showErrorWithStatus:@"网络请求失败，请重新尝试"];
               }else{
                   
                   
                   NSLog(@"---%@",[PostService DataTOjsonString:responseObject]);
//                   NSLog(@"---%@",responseObject);
                   
//                   for (NSDictionary *newdict in responseObject[@"data"]) {
                   
                       NSLog(@"%@",responseObject[@"data"][@"TJRC04_35"]);
                       
                   self.titleArr=@[responseObject[@"data"][@"TJRC04_24"],responseObject[@"data"][@"TJRC04_25"],responseObject[@"data"][@"TJRC04_26"],responseObject[@"data"][@"TJRC04_27"],responseObject[@"data"][@"TJRC04_28"],responseObject[@"data"][@"TJRC04_29"],responseObject[@"data"][@"TJRC04_52"],responseObject[@"data"][@"TJRC04_53"],responseObject[@"data"][@"TJRC04_54"],responseObject[@"data"][@"TJRC04_55"],responseObject[@"data"][@"TJRC04_56"]];
                   [self.tableView reloadData];
//                  }
               }

           }];
}


#pragma mark - delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    return 11;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    zeroTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"zeroTableViewCell"];
    if(!cell){
        cell = [[zeroTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"zeroTableViewCell"];
    }
    cell.backgroundColor = Color_Base(26, 35, 49);

    cell.titleLabel.text = [NSString stringWithFormat:@"%@",_nameArr[indexPath.item]];
    cell.conterLabel.text = [NSString stringWithFormat:@"%@ mg/Nm³",_titleArr[indexPath.item]];
    
//    cell.headerImage.image = [UIImage imageNamed:_IconArrl[indexPath.item]];
//    if (_dataSource.count>0) {
//        homeModel * model=_dataSource[indexPath.row];
//        NSLog(@"model----%@",model);
////        cell.model=model;
//    }
     return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSUserDefaults *des = [NSUserDefaults standardUserDefaults];
//    NSString *uid = [des objectForKey:@"UID"];
//    if (uid == nil) {
//        LoginViewController *login = [[LoginViewController alloc]init];
//        [self presentViewController:login animated:YES completion:nil];}else{
    
//    switch (indexPath.row) {
//            case 0:{
//                userInfoViewController *vc= [[userInfoViewController alloc]init];
//                vc.hidesBottomBarWhenPushed = YES;
//                vc.title=@"帐号信息";
//                [self.navigationController pushViewController:vc animated:YES];
//
//            }
//            break;
//
//            case 1:{
//                passwordViewController *vc= [[passwordViewController alloc]init];
//                vc.hidesBottomBarWhenPushed = YES;
//                vc.title=@"修改密码";
//                [self.navigationController pushViewController:vc animated:YES];
//            }
//               break;
//
//            break;
//
//        default:
//
//
//            break;
//    }
    


}

@end
