//
//  userInfoViewController.m
//  NorthEnvironmeniOS
//
//  Created by mac on 2020/8/15.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

#import "userInfoViewController.h"
#import "psersonTableViewCell.h"

@interface userInfoViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong)NSArray               * nameArr;

@property (nonatomic,strong)NSArray               * userArr;

@end

@implementation userInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_tableView registerNib:[UINib nibWithNibName:@"psersonTableViewCell" bundle:nil] forCellReuseIdentifier:@"psersonTableViewCell"];
    _tableView.backgroundColor = Color_Base(26, 35, 49);
    self.view.backgroundColor =  Color_Base(26, 35, 49);
       _nameArr=@[@"*姓名",@"*手机",@"*身份证号"];
       _userArr=@[@"张三",@"15661004788",@"152601199709070000"];
}

#pragma mark - delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    psersonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"psersonTableViewCell"];
    if(!cell){
        cell = [[psersonTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"PersonlTableViewCell"];
    }
    cell.backgroundColor = Color_Base(26, 35, 49);

    cell.labelLeft.text = [NSString stringWithFormat:@"%@",_nameArr[indexPath.item]];
    cell.labelRight.text = [NSString stringWithFormat:@"%@",_userArr[indexPath.item]];
     return cell;
    
}

@end
