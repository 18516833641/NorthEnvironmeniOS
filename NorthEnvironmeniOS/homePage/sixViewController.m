//
//  sixViewController.m
//  NorthEnvironmeniOS
//
//  Created by mac on 2020/8/15.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

#import "sixViewController.h"

@interface sixViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property(nonatomic,strong)NSMutableArray       * dataSource;

@end

@implementation sixViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_tableView registerNib:[UINib nibWithNibName:@"baseTableViewCell" bundle:nil] forCellReuseIdentifier:@"baseTableViewCell"];
           _tableView.backgroundColor = Color_Base(26, 35, 49);
           
       //
           
           [self httpService];
}

-(void)AllocdataSource
{
    if (!_dataSource) {
        _dataSource=[[NSMutableArray alloc]init];
    }
}

-(void)httpService{
    [self AllocdataSource];
    [_dataSource removeAllObjects];
    
    [SVProgressHUD show];

    NSString *urlString = [NSString stringWithFormat:@"%@",Url_SeverGCAL];
    
    NSLog(@"---%@",urlString);

             //请求数据
    [PostService AFHTTPSessionManager:urlString method:@"GET" params:@{} WithBlock:^(id  _Nonnull responseObject, NSError * _Nonnull error) {

               [SVProgressHUD dismiss];
               if (error) {
                   [SVProgressHUD showErrorWithStatus:@"网络请求失败，请重新尝试"];
               }else{
                   
                   
                   NSLog(@"---%@",[PostService DataTOjsonString:responseObject]);
                   
                   for (NSDictionary *newdict in responseObject[@"data"]) {
                                  
                      homeModel *model=[[homeModel alloc]init];
//                      model.modelState = [NSString stringWithFormat:@"%ld",(long)stetas];
                      [model setValuesForKeysWithDictionary:newdict];
                      [self.dataSource addObject:model];
                      [self.tableView reloadData];
                  }
               }

           }];
}


#pragma mark - delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    return _dataSource.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    baseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"baseTableViewCell"];
    if(!cell){
        cell = [[baseTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"baseTableViewCell"];
    }
    cell.backgroundColor = Color_Base(26, 35, 49);
    if (_dataSource.count>0) {
        homeModel * model=_dataSource[indexPath.row];
        cell.model=model;
    }

    
     return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    baseViewController *detilVC = [[baseViewController alloc]init];
    if (_dataSource.count>0) {
          homeModel * model=_dataSource[indexPath.row];
         detilVC.listID = model.listID;
        detilVC.url = @"bkSampController";
          detilVC.title = @"工程案例详情";
          [self.navigationController pushViewController:detilVC animated:YES];
        
    }

}


@end
