//
//  setUpViewController.m
//  NorthEnvironmeniOS
//
//  Created by mac on 2020/8/11.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

#import "setUpViewController.h"
#import "homeTableViewCell.h"
#import "loginViewController.h"

@interface setUpViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong)NSArray               * nameArr;

@property (nonatomic,strong)NSArray               * IconArrl;

@end

@implementation setUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"设置";
    
    [_tableView registerNib:[UINib nibWithNibName:@"homeTableViewCell" bundle:nil] forCellReuseIdentifier:@"homeTableViewCell"];
    _tableView.backgroundColor = Color_Base(26, 35, 49);
    
    _nameArr=@[@"清除缓存",@"关于软件",@"版本更新",@"退出登录"];
    _IconArrl=@[@"setUp1",@"setUp2",@"setUp3",@"setUp4"];
}

#pragma mark - delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    homeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"homeTableViewCell"];
    if(!cell){
        cell = [[homeTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"PersonlTableViewCell"];
    }
    cell.backgroundColor = Color_Base(26, 35, 49);

    cell.titleLabel.text = [NSString stringWithFormat:@"%@",_nameArr[indexPath.item]];
    cell.headerImage.image = [UIImage imageNamed:_IconArrl[indexPath.item]];
    
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
            case 3://退出登录
           
            [self tuichudenglu];
            break;
            
        default:
            
            
            break;
    }
    


}

-(void)tuichudenglu{
    
   UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"确定要退出登录吗？" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
       NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
     NSUserDefaults * defautls = [NSUserDefaults standardUserDefaults];
     [defautls removePersistentDomainForName:appDomain];



     __unsafe_unretained __typeof(self) weakSelf = self;
     loginViewController *tab = [[loginViewController alloc]init];
     weakSelf.view.window.rootViewController = tab;
        
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];


    
    
     
               
}

@end
