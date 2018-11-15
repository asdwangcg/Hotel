//
//  ConnectModel.h
//  封装网络
//
//  Created by wangchonggang on 14/11/7.
//  Copyright (c) 2014年 wangchonggang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^ReciveBlock)(NSData *);

@protocol ConnectModelDelegate <NSObject>

- (void)pushData:(NSData *)data;

@end

@interface ConnectModel : NSObject<NSURLConnectionDataDelegate>
@property (nonatomic, assign)id<ConnectModelDelegate>delegate;
@property (nonatomic, copy)ReciveBlock reciveblock;
@property (nonatomic, retain)NSMutableData *PostData;
@property (nonatomic, copy)NSString *DataName;
+ (void)PostWithURl:(NSString *)url body:(NSString *)body delegate:(id<ConnectModelDelegate>)delegate;
+ (void)PostBlockWithURl:(NSString *)url body:(NSString *)body block:(ReciveBlock)block;
+ (BOOL)IsConnect;
@end
