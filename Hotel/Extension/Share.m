//
//  Share.m
//  Hotel
//
//  Created by 王崇刚-CityFruit on 2018/11/21.
//  Copyright © 2018 王崇刚-CityFruit. All rights reserved.
//

#import "Share.h"

@implementation Share
static Share *share = nil;
+ (Share *)share {
    @synchronized(self) {
        if (!share) {
            share = [[Share alloc] init];
        }
    }
    
    return share;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.orderArr = [[NSMutableArray alloc] init];
    }
    return self;
}
@end
