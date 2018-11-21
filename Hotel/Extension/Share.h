//
//  Share.h
//  Hotel
//
//  Created by 王崇刚-CityFruit on 2018/11/21.
//  Copyright © 2018 王崇刚-CityFruit. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Share : NSObject
+ (Share *)share;
@property (nonatomic, strong)NSMutableArray *orderArr;
@end

NS_ASSUME_NONNULL_END
