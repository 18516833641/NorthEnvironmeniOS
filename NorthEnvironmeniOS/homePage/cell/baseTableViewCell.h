//
//  baseTableViewCell.h
//  NorthEnvironmeniOS
//
//  Created by mac on 2020/8/16.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class homeModel;

@interface baseTableViewCell : UITableViewCell

@property (nonatomic,strong)homeModel   *model;

@property (weak, nonatomic) IBOutlet UIImageView *iamge;

@property (weak, nonatomic) IBOutlet UILabel *title;

@end

NS_ASSUME_NONNULL_END
