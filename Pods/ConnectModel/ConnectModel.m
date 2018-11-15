//
//  ConnectModel.m
//  封装网络
//
//  Created by wangchonggang on 14/11/7.
//  Copyright (c) 2014年 wangchonggang. All rights reserved.
//

#import "ConnectModel.h"
#import "Reachability.h"
#import "SaveModel.h"
@implementation ConnectModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.PostData = [NSMutableData data];
    }
    return self;
}

//////////////////////////////////////////////

+ (BOOL)IsConnect {
    Reachability *reach = [Reachability reachabilityWithHostname:@"http://www.baidu.com"];
    NetworkStatus status = [reach currentReachabilityStatus];
    switch (status) {
        case ReachableViaWiFi:
        {
            return YES;
        }
            break;
        case ReachableViaWWAN:
        {
            return YES;
        }
            break;
        case NotReachable:
        {
            return NO;
        }
            break;
        default:
            break;
    }
}

+ (BOOL)JudgeStatus{
//    Reachability *reach = [Reachability reachabilityWithHostname:HomeUrl];
//    NetworkStatus status = [reach currentReachabilityStatus];
    return YES;
}


//////////////////////////////////////////
+ (void)PostBlockWithURl:(NSString *)url body:(NSString *)body block:(ReciveBlock)block{
    if ([ConnectModel JudgeStatus]) {
        ConnectModel *model = [[ConnectModel alloc] init];
        model.reciveblock = block;
        [model StartWithUrl:url body:body];
 
    }
    else {
        NSString *str = [ConnectModel GetDataName:url body:body];
        str = [str stringByReplacingOccurrencesOfString:@"/" withString:@""];
        NSData *data = [SaveModel readFileWithName:str];
        if (data) {
            block(data);
        }
    }
}

//////////////////////////////////////////



//////////////////////////////////////////
+ (void)PostWithURl:(NSString *)url body:(NSString *)body delegate:(id<ConnectModelDelegate>)delegate{
    if ([ConnectModel JudgeStatus]) {
        ConnectModel *model = [[ConnectModel alloc] init];
        model.delegate = delegate;
        [model StartWithUrl:url body:body];
 
    }
    else {
        NSString *str = [ConnectModel GetDataName:url body:body];
        str = [str stringByReplacingOccurrencesOfString:@"/" withString:@""];
        NSData *data = [SaveModel readFileWithName:str];
        if (data) {
            [delegate pushData:data];
        }
    }
}

+ (NSString *)GetDataName:(NSString *)url body:(NSString *)body{
    
    return [NSString stringWithFormat:@"%@%@", url, body];
}


//=========================
// POST FORM
//=========================

+ (void)PostBlockWithURl:(NSString *)url body:(NSString *)body Image:(UIImage*)img imageKey:(NSString*)imageKey block:(ReciveBlock)block{
    if ([ConnectModel JudgeStatus]) {
        ConnectModel *model = [[ConnectModel alloc] init];
        model.reciveblock = block;
        [model StartWithUrl:url body:body];
 
    }
    else {
        NSString *str = [ConnectModel GetDataName:url body:body];
        str = [str stringByReplacingOccurrencesOfString:@"/" withString:@""];
        NSData *data = [SaveModel readFileWithName:str];
        if (data) {
            block(data);
        }
    }
}

- (void)StartWithUrl:(NSString *)url body:(NSString *)body{
    NSURL *urls = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:urls];
    self.DataName = [NSString stringWithFormat:@"%@", [ConnectModel GetDataName:url body:body]];
    [request setHTTPMethod:@"POST"];
    NSData * data = [body dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:data];
    ////////////////////////////////////////
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    ////////////////////////////////////////
    [NSURLConnection connectionWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_PostData appendData:data];//数据拼接为完整
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{

}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    

    if ([self.delegate respondsToSelector:@selector(pushData:)]) {
    [self.delegate pushData:_PostData];
        self.DataName = [self.DataName stringByReplacingOccurrencesOfString:@"/" withString:@""];
    [SaveModel writeFileWithName:self.DataName data:self.PostData];
    }
    else {
        self.reciveblock(self.PostData);
        [SaveModel writeFileWithName:self.DataName data:self.PostData];
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"error:%@", error);
}

@end
