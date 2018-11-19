//
//  SelectView.m
//  Hotel
//
//  Created by 王崇刚-CityFruit on 2018/11/19.
//  Copyright © 2018 王崇刚-CityFruit. All rights reserved.
//

#import "SelectView.h"

@implementation SelectView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor colorWithRed:170 / 255.0 green:209 / 255.0 blue:252 / 255.0 alpha:1]];
        self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.frame.size.width - 40, self.frame.size.height)];
        [_textLabel setTextColor:[UIColor colorWithRed:106 / 255.0 green:109 / 255.0 blue:113 / 255.0 alpha:1]];
        [_textLabel setTextAlignment:TextLeft];
        [_textLabel setFont:[UIFont systemFontOfSize:13]];
        [self addSubview:_textLabel];
        
        self.button = CustomBtn;
        [_button setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [self addSubview:_button];
        
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
