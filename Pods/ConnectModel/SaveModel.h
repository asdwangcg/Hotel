//
//  SaveModel.h
//  封装网络
//
//  Created by wangchonggang on 14/11/7.
//  Copyright (c) 2014年 wangchonggang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SaveModel : NSObject
+ (NSData *)readFileWithName:(NSString *)name;
+ (BOOL)writeFileWithName:(NSString *)name data:(NSData *)data;
+ (BOOL)writeDic:(NSString *)name data:(NSMutableDictionary *)dic;
@end
