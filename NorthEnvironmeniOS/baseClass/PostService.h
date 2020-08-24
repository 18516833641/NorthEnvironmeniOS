//
//  PostService.h
//  HourseManage
//
//  Created by mac on 2019/11/7.
//  Copyright © 2019 jietingzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PostService : NSObject


+ (void)AFHTTPSessionManager:(NSString *)url method:(NSString *) method params:(NSDictionary *)params WithBlock:(void(^)(id responseObject, NSError *error))completion;

+(NSString*)DataTOjsonString:(id)object;

+(float)roundFloat:(float)price;

@end

NS_ASSUME_NONNULL_END
