//
//  PopModel.m
//  Pop
//
//  Created by wangchonggang on 2016/12/20.
//  Copyright © 2016年 wcg. All rights reserved.
//

#import "PopModel.h"

@implementation PopModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.Ptex = @"";
        self.MesFrom = @"";
    }
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key {
    [super setValue:value forKey:key];
    if ([[NSString stringWithFormat:@"%@", value] isEqualToString:@"<null>"] || [[NSString stringWithFormat:@"%@", value] isEqualToString:@"<nil>"]) {
        value = @"";
    }
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end
