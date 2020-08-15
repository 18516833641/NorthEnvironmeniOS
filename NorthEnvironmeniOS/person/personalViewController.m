//
//  personalViewController.m
//  NorthEnvironmeniOS
//
//  Created by mac on 2020/8/11.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

#import "personalViewController.h"
#import "homeTableViewCell.h"
#import "userInfoViewController.h"
#import "passwordViewController.h"

@interface personalViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIView *headView;

@property (nonatomic,strong)NSArray               * nameArr;

@property (nonatomic,strong)NSArray               * IconArrl;

@end

@implementation personalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"个人中心";
    
    [_tableView registerNib:[UINib nibWithNibName:@"homeTableViewCell" bundle:nil] forCellReuseIdentifier:@"homeTableViewCell"];
    _headView.backgroundColor = Color_Base(26, 35, 49);
    _tableView.backgroundColor = Color_Base(26, 35, 49);
    
    _nameArr=@[@"账户信息",@"修改密码"];
    _IconArrl=@[@"person1",@"person2"];
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
//    NSString * name=[userDefaults objectForKey:@"name"];

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
            case 0:{
                userInfoViewController *vc= [[userInfoViewController alloc]init];
                vc.hidesBottomBarWhenPushed = YES;
                vc.title=@"帐号信息";
                [self.navigationController pushViewController:vc animated:YES];
               
            }
            break;
            
            case 1:{
                passwordViewController *vc= [[passwordViewController alloc]init];
                vc.hidesBottomBarWhenPushed = YES;
                vc.title=@"修改密码";
                [self.navigationController pushViewController:vc animated:YES];
            }
               break;
       
            break;
            
        default:
            
            
            break;
    }
    


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
