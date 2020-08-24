//
//  zeroViewController3.m
//  NorthEnvironmeniOS
//
//  Created by mac on 2020/8/22.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

#import "zeroViewController3.h"

@interface zeroViewController3 ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong)NSArray               * nameArr1;
@property (nonatomic,strong)NSArray               * nameArr2;
@property (nonatomic,strong)NSArray               * nameArr3;
@property (nonatomic,strong)NSArray               * nameArr4;
@property (nonatomic,strong)NSArray               * nameArr5;
@property (nonatomic,strong)NSArray               * nameArr6;
@property (nonatomic,strong)NSArray               * nameArr7;
@property (nonatomic,strong)NSArray               * nameArr8;


@property (nonatomic,strong)NSArray               * titleArr1;
@property (nonatomic,strong)NSArray               * titleArr2;
@property (nonatomic,strong)NSArray               * titleArr3;
@property (nonatomic,strong)NSArray               * titleArr4;
@property (nonatomic,strong)NSArray               * titleArr5;
@property (nonatomic,strong)NSArray               * titleArr6;
@property (nonatomic,strong)NSArray               * titleArr7;
@property (nonatomic,strong)NSArray               * titleArr8;



@end

@implementation zeroViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [_tableView registerNib:[UINib nibWithNibName:@"zeroTableViewCell" bundle:nil] forCellReuseIdentifier:@"zeroTableViewCell"];
       
    _nameArr1=@[@"脱硫塔入口温度",@"脱硫塔出口温度",@"脱硫塔入口压力",@"脱硫塔出口压力",@"1#喷射器进口压力",@"2#喷射器进口压力",@"3#喷射器进口压力"];
    _nameArr2=@[@"除尘器出口温度",@"除尘器出口压力",@"1#加湿机压力",@"2#加湿机压力"];
    _nameArr3=@[@"高压变频器电流反馈",@"高压变频器频率反馈",@"高压变频器变频运行指示",@"高压变频器工频运行指示",@"高压变频器远程指示",@"高压变频器系统就绪指示",@"高压变频器运行指示",@"高压变频器变频报警",@"高压变频器变频故障",@"主引风机轴承温度1",@"主引风机轴承温度2",@"主引风机冷却水压力",@"主引风机风门执行器开度",@"主引风机电机轴承温度1",@"主引风机电机轴承温度2"];
    _nameArr4=@[@"脱硫剂喷射器进口压力",@"原料仓重量"];
    _nameArr5=@[@"副产物仓重量"];
    _nameArr6=@[@"进水流量计",@"1#加湿机加水流量",@"2#加湿机加水流量",@"工艺水箱液位"];
    _nameArr7=@[@"储罐氮气主管压力",@"喷吹主管压力",@"空气流量计",@"氮气流量计"];
    _nameArr8=@[@"冷风阀开度反馈",@"一氧化碳浓度检测1",@"原烟气挡板门开到位",@"原烟气挡板门关到位",@"净烟气挡板门开到位",@"净烟气挡板门关到位",@"旁路挡板门开到位",@"旁路挡板门关到位"];
    
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
                
                   //脱硫系统
                   self.titleArr1=@[responseObject[@"data"][@"TJRC04_02"],responseObject[@"data"][@"TJRC04_03"],responseObject[@"data"][@"TJRC04_08"],responseObject[@"data"][@"TJRC04_09"],responseObject[@"data"][@"TJRC04_13"],responseObject[@"data"][@"TJRC04_14"],responseObject[@"data"][@"TJRC04_15"]];
                   
                   //除尘系统
                   self.titleArr2=@[responseObject[@"data"][@"TJRC04_04"],responseObject[@"data"][@"TJRC04_10"],responseObject[@"data"][@"TJRC04_11"],responseObject[@"data"][@"TJRC04_12"]];
                   
                   //风机系统
                   self.titleArr3=@[responseObject[@"data"][@"TJRC04_06"],responseObject[@"data"][@"TJRC04_07"],responseObject[@"data"][@"TJRC04_39"],responseObject[@"data"][@"TJRC04_40"],responseObject[@"data"][@"TJRC04_41"],responseObject[@"data"][@"TJRC04_42"],responseObject[@"data"][@"TJRC04_43"],responseObject[@"data"][@"TJRC04_44"],responseObject[@"data"][@"TJRC04_45"],responseObject[@"data"][@"TJRC04_32"],responseObject[@"data"][@"TJRC04_33"],responseObject[@"data"][@"TJRC04_34"],responseObject[@"data"][@"TJRC04_35"],responseObject[@"data"][@"TJRC04_36"],responseObject[@"data"][@"TJRC04_37"]];
                   
                   //原料系统
                   self.titleArr4=@[responseObject[@"data"][@"TJRC04_16"],responseObject[@"data"][@"TJRC04_21"]];
                   
                   //副产物系统
                   self.titleArr5=@[responseObject[@"data"][@"TJRC04_22"]];
                   
                   //水系统
                   self.titleArr6=@[responseObject[@"data"][@"TJRC04_01"],responseObject[@"data"][@"TJRC04_19"],responseObject[@"data"][@"TJRC04_20"],responseObject[@"data"][@"TJRC04_38"]];
                   
                   //气系统
                   self.titleArr7=@[responseObject[@"data"][@"TJRC04_17"],responseObject[@"data"][@"TJRC04_18"],responseObject[@"data"][@"TJRC04_30"],responseObject[@"data"][@"TJRC04_31"]];
                   
                   //烟气系统
                   self.titleArr8=@[responseObject[@"data"][@"TJRC04_05"],responseObject[@"data"][@"TJRC04_23"],responseObject[@"data"][@"TJRC04_46"],responseObject[@"data"][@"TJRC04_47"],responseObject[@"data"][@"TJRC04_48"],responseObject[@"data"][@"TJRC04_49"],responseObject[@"data"][@"TJRC04_50"],responseObject[@"data"][@"TJRC04_51"]];
                   
                   
                   [self.tableView reloadData];
//                  }
               }

           }];
}



#pragma mark - delegate

//返回多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 8;
    
}

//每组多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 7;
            break;
        case 1:
            return 4;
            break;
        case 2:
            return 15;
            break;
        case 3:
           return 2;
           break;
        case 4:
           return 1;
           break;
        case 5:
            return 4;
            break;
        case 6:
           return 4;
           break;
        case 7:
           return 8;
           break;
            
            
        default:
            break;
    }
    return 4;
    
}

/** 设置组头, 组尾视图的高度 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

//返回组头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSArray * title=@[@"脱硫系统",@"除尘系统",@"风机系统",@"原料系统",@"副产物系统",@"水系统",@"气系统",@"烟气系统"];
    
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, 30)];
    view.backgroundColor = Color_Base(26, 35, 49);
    view.clipsToBounds=YES;
    [self.view addSubview:view];
    
    UILabel *labeltit=[[UILabel alloc]initWithFrame:CGRectMake(20,5, Screen_Width, 20)];
    labeltit.text=title[section];
    labeltit.textColor=[UIColor lightGrayColor];
    labeltit.numberOfLines=0;
    labeltit.font=[UIFont systemFontOfSize:14];
    [view addSubview:labeltit];
    
    return view;
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
    
    switch (indexPath.section) {
        case 0:
            {
                cell.titleLabel.text = [NSString stringWithFormat:@"%@",_nameArr1[indexPath.item]];
                cell.conterLabel.text = [NSString stringWithFormat:@"%@ mg/Nm³",_titleArr1[indexPath.item]];
                
            }
            break;
        case 1:
           {
               cell.titleLabel.text = [NSString stringWithFormat:@"%@",_nameArr2[indexPath.item]];
               cell.conterLabel.text = [NSString stringWithFormat:@"%@ mg/Nm³",_titleArr2[indexPath.item]];
               
           }
           break;
        case 2:
           {
               cell.titleLabel.text = [NSString stringWithFormat:@"%@",_nameArr3[indexPath.item]];
               cell.conterLabel.text = [NSString stringWithFormat:@"%@ mg/Nm³",_titleArr3[indexPath.item]];
               
           }
           break;
        case 3:
           {
               cell.titleLabel.text = [NSString stringWithFormat:@"%@",_nameArr4[indexPath.item]];
               cell.conterLabel.text = [NSString stringWithFormat:@"%@ mg/Nm³",_titleArr4[indexPath.item]];
               
           }
           break;
        case 4:
           {
               cell.titleLabel.text = [NSString stringWithFormat:@"%@",_nameArr5[indexPath.item]];
               cell.conterLabel.text = [NSString stringWithFormat:@"%@ mg/Nm³",_titleArr5[indexPath.item]];
               
           }
           break;
        case 5:
           {
               cell.titleLabel.text = [NSString stringWithFormat:@"%@",_nameArr6[indexPath.item]];
               cell.conterLabel.text = [NSString stringWithFormat:@"%@ mg/Nm³",_titleArr6[indexPath.item]];
               
           }
           break;
        case 6:
            {
                cell.titleLabel.text = [NSString stringWithFormat:@"%@",_nameArr7[indexPath.item]];
                cell.conterLabel.text = [NSString stringWithFormat:@"%@ mg/Nm³",_titleArr7[indexPath.item]];
                
            }
            break;
            
        case 7:
            {
                cell.titleLabel.text = [NSString stringWithFormat:@"%@",_nameArr8[indexPath.item]];
                cell.conterLabel.text = [NSString stringWithFormat:@"%@ mg/Nm³",_titleArr8[indexPath.item]];
                
            }
            break;
            
        default:
            break;
    }
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
