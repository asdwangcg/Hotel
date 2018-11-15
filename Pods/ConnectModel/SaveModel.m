//
//  SaveModel.m
//  封装网络
//
//  Created by wangchonggang on 14/11/7.
//  Copyright (c) 2014年 wangchonggang. All rights reserved.
//

#import "SaveModel.h"

@implementation SaveModel

+ (NSString *)pathWithName:(NSString *)name{
    NSArray *arr = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *path = [arr firstObject];
    path = [NSString stringWithFormat:@"%@/%@", path, name];
    return path;
}

+ (BOOL)JudgeFileExistWithName:(NSString *)name{
    NSString *path = [SaveModel pathWithName:name];
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:path]) {
        return YES;
    }
    else {
        return NO;
    }

}
+ (NSData *)readFileWithName:(NSString *)name{
    if ([SaveModel JudgeFileExistWithName:name]) {
        NSData *data = [NSData dataWithContentsOfFile:[SaveModel pathWithName:name]];
        return data;
    }
    else {
        return nil;
    }
}

+ (BOOL)writeFileWithName:(NSString *)name data:(NSData *)data{
    NSString *path = [SaveModel pathWithName:name];
    return [data writeToFile:path atomically:YES];
}

+ (BOOL)writeDic:(NSString *)name data:(NSMutableDictionary *)dic{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
    path = [NSString stringWithFormat:@"%@/Caches/%@", path, name];
//    NSLog(@"%@", path);
    return [dic writeToFile:path atomically:YES];
}

@end
