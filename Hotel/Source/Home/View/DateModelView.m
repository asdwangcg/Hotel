//
//  DateModelView.m
//  Hotel
//
//  Created by 王崇刚-CityFruit on 2018/11/19.
//  Copyright © 2018 王崇刚-CityFruit. All rights reserved.
//

#import "DateModelView.h"

@implementation DateModelView

- (instancetype)initWithFrame:(CGRect)frame Date:(NSDate*)date
{
    self = [super initWithFrame:frame];
    if (self) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        
        NSArray *dateArr = [[formatter stringFromDate:date] componentsSeparatedByString:@"-"];
        
        NSString *time = [NSString stringWithFormat:@"%@月\n%@", dateArr[1], [self weekdayStringFromDate:[formatter stringFromDate:date]]];
        UILabel *num = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, (self.frame.size.width) / 2, self.frame.size.height)];
        [num setFont:[UIFont boldSystemFontOfSize:25]];
        [num setTextColor:[UIColor colorWithRed:65 / 255.0 green:67 / 255.0 blue:69 / 255.0 alpha:1]];
        [num setTextAlignment:TextRight];
        [num setText:dateArr[2]];
        UILabel *month = [[UILabel alloc] initWithFrame:CGRectMake(num.frame.size.width + num.frame.origin.x, num.frame.origin.y, num.frame.size.width, num.frame.size.height)];
        [month setFont:[UIFont systemFontOfSize:num.font.pointSize / 2]];
        [month setTextColor:[UIColor colorWithRed:65 / 255.0 green:67 / 255.0 blue:69 / 255.0 alpha:1]];
        [month setText:time];
        [month setNumberOfLines:2];
        [self addSubview:num];
        [self addSubview:month];
    }
    return self;
}

- (NSString*)weekdayStringFromDate:(NSString *)timeString
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *date =[dateFormat dateFromString:timeString];
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null],@"周日",@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit =NSCalendarUnitWeekday;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:date];
    
    return [weekdays objectAtIndex:theComponents.weekday];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
