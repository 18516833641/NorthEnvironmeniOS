//
//  zeroTableViewCell.h
//  NorthEnvironmeniOS
//
//  Created by mac on 2020/8/22.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class homeModel;

@interface zeroTableViewCell : UITableViewCell

@property (nonatomic,strong)homeModel   *model;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *conterLabel;

@end

NS_ASSUME_NONNULL_END
