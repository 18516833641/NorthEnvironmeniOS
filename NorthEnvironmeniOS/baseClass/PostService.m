//
//  PostService.m
//  HourseManage
//
//  Created by mac on 2019/11/7.
//  Copyright © 2019 jietingzhang. All rights reserved.
//

#import "PostService.h"
#import "AFNetworking.h"


@implementation PostService

+ (void)AFHTTPSessionManager:(NSString *)url method:(NSString *) method params:(NSDictionary *)params WithBlock:(void(^)(id responseObject, NSError *error))completion{
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager.requestSerializer setTimeoutInterval:10];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    if ([method isEqualToString:@"POST"]) {
        //post请求
        
        [manager POST:url parameters:params headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
             NSDictionary * JSON = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            
             NSLog(@"====%@",JSON);
            
             if (completion) completion(JSON,nil);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
        }];
        
    }else if([method isEqualToString:@"GET"]){//GET
        
        
        NSUserDefaults *des = [NSUserDefaults standardUserDefaults];
             
        NSString * token=[des objectForKey:@"token"];

        
         [manager.requestSerializer setValue:[NSString stringWithFormat:@"%@",token] forHTTPHeaderField:@"X-AUTH-TOKEN"];


        [manager GET:url parameters:params headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary * JSON = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];

            if (completion) completion(JSON,nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (completion) completion(nil,error);
        }];
        
        
    }else if([method isEqualToString:@"PUT"]){//PUT
        
        NSUserDefaults *des = [NSUserDefaults standardUserDefaults];
             
        NSString * token=[des objectForKey:@"token"];
        
        [manager.requestSerializer setValue:[NSString stringWithFormat:@"%@",token] forHTTPHeaderField:@"X-AUTH-TOKEN"];
        
        [manager PUT:url parameters:params headers:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
             NSDictionary * JSON = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];

             if (completion) completion(JSON,nil);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            if (completion) completion(nil,error);
        
        }];
        
        
    }else{//DELETE
        
        
        [manager DELETE:url parameters:params headers:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSDictionary * JSON = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];

            if (completion) completion(JSON,nil);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
             if (completion) completion(nil,error);
            
        }];
        
        
    }
    
}

//编码问题
+(NSString*)DataTOjsonString:(id)object{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (!jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

+(float)roundFloat:(float)price{
return (floorf(price*100 + 0.5))/100;
}

@end
