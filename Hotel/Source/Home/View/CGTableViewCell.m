//
//  CGTableViewCell.m
//  Hotel
//
//  Created by 王崇刚-CityFruit on 2018/11/19.
//  Copyright © 2018 王崇刚-CityFruit. All rights reserved.
//

#import "CGTableViewCell.h"

@implementation CGTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

@implementation CGHugeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, self.frame.size.width - 20, self.frame.size.height / 3 * 2)];
    [image setImage:_dic[@"image"]];
    

    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(image.frame.origin.x, image.frame.size.height + image.frame.origin.y + 5, image.frame.size.width, [UIFont systemFontOfSize:15].pointSize)];
    [title setTextColor:[UIColor colorWithRed:100 / 255.0 green:100 / 255.0 blue:100 / 255.0 alpha:1]];
    [title setFont:[UIFont systemFontOfSize:15]];
    [title setText:_dic[@"title"]];
    
    UILabel *point = [[UILabel alloc] initWithFrame:CGRectMake(title.frame.origin.x, title.frame.size.height + title.frame.origin.y, title.frame.size.width / 2, title.frame.size.height * 3)];
    [point setNumberOfLines:2];
    NSString *pointS = _dic[@"point"];
    NSMutableAttributedString *pointAttS = [[NSMutableAttributedString alloc]initWithString:pointS];
    [pointAttS addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, 3)];
    [pointAttS addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(3, pointS.length - 3)];
    [pointAttS addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, 4)];
    [pointAttS addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:193 / 255.0 green:193 / 255.0 blue:193 / 255.0 alpha:1] range:NSMakeRange(4, pointS.length - 4)];
    [point setAttributedText:pointAttS];
    
    CGFloat ori_x = title.frame.origin.x;
    for (int i = 0; i < [_dic[@"discout"] count]; i ++) {
        NSString *discout = _dic[@"discout"][i];
        UIFont *font = [UIFont systemFontOfSize:12];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(ori_x, point.frame.size.height + point.frame.origin.y, [self textLength:discout] * font.pointSize, font.pointSize + 4)];
        [label setText:discout];
        [label setTextAlignment:TextCenter];
        [label setTextColor:[UIColor colorWithRed:230 / 255.0 green:119 / 255.0 blue:102 / 255.0 alpha:1]];
        [label.layer setBorderColor:[UIColor colorWithRed:235 / 255.0 green:231 / 255.0 blue:229 / 255.0 alpha:1].CGColor];
        [label setFont:[UIFont systemFontOfSize:10]];
        [label.layer setBorderWidth:1];
        [label.layer setCornerRadius:1];
        [label.layer setMasksToBounds:YES];
        [self addSubview:label];
        ori_x += label.frame.size.width + 2;
    }
    
    UIView *sep = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 10, self.frame.size.width, 10)];
    [sep setBackgroundColor:[UIColor colorWithRed:244 / 255.0 green:244 / 255.0 blue:244 / 255.0 alpha:1]];
    
    [self addSubview:image];
    [self addSubview:title];
    [self addSubview:point];
    [self addSubview:sep];
}


-(NSUInteger)textLength: (NSString *) text{
    NSUInteger asciiLength = 0;
    for (NSUInteger i = 0; i < text.length; i++) {
        unichar uc = [text characterAtIndex: i];
        asciiLength += isascii(uc) ? 1 : 2;
    }
    NSUInteger unicodeLength = asciiLength;
    return unicodeLength;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
