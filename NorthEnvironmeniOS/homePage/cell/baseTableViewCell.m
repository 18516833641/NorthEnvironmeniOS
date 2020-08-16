//
//  baseTableViewCell.m
//  NorthEnvironmeniOS
//
//  Created by mac on 2020/8/16.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

#import "baseTableViewCell.h"

@implementation baseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(homeModel *)model{
    
//    [_iamge.image s]
//    [_iamge sd_setImageWithURL:[NSURL URLWithString:UrlStr] placeholderImage:[UIImage imageNamed:@"zwsj_t"]];
    
    
    
    NSString * imagestring=[model.thmb stringByReplacingOccurrencesOfString:@"\\"withString:@"/"];
                            
//    [model.thmb stringByReplacingOccurrencesOfString:@"\\" withString:@"/"];
    NSLog(@"%@",imagestring);
                            
    [_iamge sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",Url_SeverImage,imagestring]]];
    _title.text = [NSString stringWithFormat:@"%@",model.tile];
    
}

@end
