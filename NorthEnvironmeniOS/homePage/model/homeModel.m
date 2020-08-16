//
//  homeModel.m
//  NorthEnvironmeniOS
//
//  Created by mac on 2020/8/16.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

#import "homeModel.h"

@implementation homeModel


-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {

        self.listID = value;

    }
    
}

@end
