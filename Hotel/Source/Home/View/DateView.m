//
//  DateView.m
//  Hotel
//
//  Created by 王崇刚-CityFruit on 2018/11/19.
//  Copyright © 2018 王崇刚-CityFruit. All rights reserved.
//

#import "DateView.h"

@implementation DateView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"yyyy-MM-dd"];
        [self setBackgroundColor:[UIColor colorWithRed:170 / 255.0 green:209 / 255.0 blue:252 / 255.0 alpha:1]];
        DateModelView *inDm = [[DateModelView alloc] initWithFrame:CGRectMake(10, 0, self.frame.size.width / 5, self.frame.size.height) Date:[format dateFromString:@"2018-11-19"]];
        [self addSubview:inDm];
        
        UIImageView *arrow = [[UIImageView alloc] initWithFrame:CGRectMake(inDm.frame.size.width + inDm.frame.origin.x + 10, (self.frame.size.height - 20) / 2, 20, 20)];
        [arrow setImage:[UIImage imageNamed:@"rightarr"]];
        [self addSubview:arrow];
        
        DateModelView *outDm = [[DateModelView alloc] initWithFrame:CGRectMake(arrow.frame.size.width + arrow.frame.origin.x + 10, 0, inDm.frame.size.width, self.frame.size.height) Date:[format dateFromString:@"2018-11-20"]];
        [self addSubview:outDm];
        
        UILabel *totleLabel = [[UILabel alloc] initWithFrame:CGRectMake(outDm.frame.size.width + outDm.frame.origin.x + 20, 0, self.frame.size.width / 5, self.frame.size.height)];
        [totleLabel setTextAlignment:TextRight];
        [totleLabel setFont:[UIFont systemFontOfSize:12]];
        [totleLabel setTextColor:[UIColor colorWithRed:65 / 255.0 green:67 / 255.0 blue:69 / 255.0 alpha:1]];
        [totleLabel setText:[NSString stringWithFormat:@"%d晚", 1]];
        [self addSubview:totleLabel];
        
        UIImageView *right = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width - 10 - 20, (self.frame.size.height - 20) / 2, 20, 20)];
        [right setImage:[UIImage imageNamed:@"right"]];
        [self addSubview:right];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
