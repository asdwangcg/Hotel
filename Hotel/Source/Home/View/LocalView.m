//
//  LocalView.m
//  Hotel
//
//  Created by 王崇刚-CityFruit on 2018/11/19.
//  Copyright © 2018 王崇刚-CityFruit. All rights reserved.
//

#import "LocalView.h"

@implementation LocalView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor colorWithRed:214 / 255.0 green:230 / 255.0 blue:250 / 255.0 alpha:1]];
        UIButton *placeButton = CustomBtn;
        [placeButton setFrame:CGRectMake(10, 0, self.frame.size.width - self.frame.size.height - 40, self.frame.size.height)];
        [placeButton setTitle:@"錦湖中心People2聯合創業中心" forState:StaNormal];
        [placeButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [placeButton setTitleColor:[UIColor blackColor] forState:StaNormal];
        [self addSubview:placeButton];
        
        UIImageView *right = [[UIImageView alloc] initWithFrame:CGRectMake(placeButton.frame.size.width + placeButton.frame.origin.x, (self.frame.size.height - 20) / 2, 20, 20)];
        [right setImage:[UIImage imageNamed:@"right"]];
        [self addSubview:right];
        
        UIButton *localButton = CustomBtn;
        [localButton setFrame:CGRectMake(self.frame.size.width - self.frame.size.height - 10, placeButton.frame.origin.y, self.frame.size.height, self.frame.size.height)];
        [localButton setBackgroundImage:[UIImage imageNamed:@"mp"] forState:StaNormal];
        [self addSubview:localButton];
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
