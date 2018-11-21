//
//  CGTableViewCell.m
//  Hotel
//
//  Created by 王崇刚-CityFruit on 2018/11/19.
//  Copyright © 2018 王崇刚-CityFruit. All rights reserved.
//

#import "CGTableViewCell.h"

@implementation CGTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.height, self.frame.size.height)];
    [img setImage:_dic[@"image"]];
    [self addSubview:img];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(img.frame.size.width + img.frame.origin.x + 10, 10, self.frame.size.width - 20 - img.frame.size.width - img.frame.origin.x, [UIFont systemFontOfSize:15].pointSize)];
    [title setTextColor:Color100];
    [title setFont:[UIFont systemFontOfSize:15]];
    [title setTextAlignment:TextLeft];
    [title setText:_dic[@"title"]];
    [self addSubview:title];
    
    UILabel *point = [[UILabel alloc] initWithFrame:CGRectMake(title.frame.origin.x, title.frame.size.height + title.frame.origin.y + 10, title.frame.size.width, title.frame.size.height * 3)];
    [point setNumberOfLines:2];
    NSString *pointS = _dic[@"point"];
    NSMutableAttributedString *pointAttS = [[NSMutableAttributedString alloc]initWithString:pointS];
    [pointAttS addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, 3)];
    [pointAttS addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(3, pointS.length - 3)];
    [pointAttS addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, 4)];
    [pointAttS addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:193 / 255.0 green:193 / 255.0 blue:193 / 255.0 alpha:1] range:NSMakeRange(4, pointS.length - 4)];
    [point setAttributedText:pointAttS];
    [self addSubview:point];
    
    CGFloat ori_x = title.frame.origin.x;
    CGFloat ori_y = point.frame.size.height + point.frame.origin.y;
    for (int i = 0; i < [_dic[@"discout"] count]; i ++) {
        NSString *discout = _dic[@"discout"][i];
        UIFont *font = [UIFont systemFontOfSize:12];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(ori_x, ori_y, (discout.length + 2) * 10, font.pointSize + 4)];
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
        if (i != [_dic[@"discout"] count] - 1) {
            if ((ori_x + ([_dic[@"discout"][i + 1] length] + 2) * 10) > self.frame.size.width - 10) {
                ori_x = title.frame.origin.x;
                ori_y += label.frame.size.height + 2;
            }
        }
    }
    
    NSString *priceS = [NSString stringWithFormat:@"￥%@ 起", _dic[@"price"]];
    UILabel *price = [[UILabel alloc] initWithFrame:CGRectMake(point.frame.origin.x, self.frame.size.height - title.frame.size.height - 10, title.frame.size.width, title.frame.size.height)];
    NSMutableAttributedString *priceAttS = [[NSMutableAttributedString alloc]initWithString:priceS];
    [priceAttS addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(0, 1)];
    [priceAttS addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(1, priceS.length - 1)];
    [priceAttS addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(priceS.length - 1, 1)];
    [priceAttS addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:244 /255.0 green:53 / 255.0 blue:0 alpha:1] range:NSMakeRange(0, priceS.length - 1)];
    [priceAttS addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:193 / 255.0 green:193 / 255.0 blue:193 / 255.0 alpha:1] range:NSMakeRange(priceS.length - 1, 1)];
    [price setAttributedText:priceAttS];
    [price setTextAlignment:TextRight];
    [self addSubview:price];
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
    [title setTextColor:Color100];
    [title setFont:[UIFont systemFontOfSize:15]];
    [title setText:_dic[@"title"]];
    
    UILabel *point = [[UILabel alloc] initWithFrame:CGRectMake(title.frame.origin.x, title.frame.size.height + title.frame.origin.y, title.frame.size.width / 3 * 2, title.frame.size.height * 3)];
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
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(ori_x, point.frame.size.height + point.frame.origin.y, (discout.length + 2) * 10, font.pointSize + 4)];
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
    
    NSString *priceS = [NSString stringWithFormat:@"￥%@ 起", _dic[@"price"]];
    UILabel *price = [[UILabel alloc] initWithFrame:CGRectMake(point.frame.size.width + point.frame.origin.x, point.frame.origin.y, title.frame.size.width / 3, point.frame.size.height)];
    NSMutableAttributedString *priceAttS = [[NSMutableAttributedString alloc]initWithString:priceS];
    [priceAttS addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(0, 1)];
    [priceAttS addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(1, priceS.length - 1)];
    [priceAttS addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(priceS.length - 1, 1)];
    [priceAttS addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:244 /255.0 green:53 / 255.0 blue:0 alpha:1] range:NSMakeRange(0, priceS.length - 1)];
    [priceAttS addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:193 / 255.0 green:193 / 255.0 blue:193 / 255.0 alpha:1] range:NSMakeRange(priceS.length - 1, 1)];
    [price setAttributedText:priceAttS];
    [price setTextAlignment:TextRight];
    [self addSubview:price];
    
    UIView *sep = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 10, self.frame.size.width, 10)];
    [sep setBackgroundColor:Color244];
    
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

@implementation CGRoomListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.img = [[UIImageView alloc] initWithFrame:CGRectZero];
        [_img setUserInteractionEnabled:YES];
        [self.contentView addSubview:_img];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_img setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
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

@implementation CGOrderComplateListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
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

@implementation CGOrderUnpayListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.img = [[UIImageView alloc] initWithFrame:CGRectZero];
        [_img setUserInteractionEnabled:YES];
        [self.contentView addSubview:_img];
        [self.contentView setBackgroundColor:Color244];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_img setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - 10)];
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

@implementation CGOrderCancelListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

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

@implementation CGOrderButtomListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [label setBackgroundColor:Color244];
    [label setText:@"僅支持3個月內的訂單查詢"];
    [label setTextColor:Color100];
    [label setTextAlignment:TextCenter];
    [label setFont:[UIFont systemFontOfSize:15]];
    [self.contentView addSubview:label];
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

@implementation CGStoredTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [img setImage:[UIImage imageNamed:@"arrbottom"]];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, (self.frame.size.width  - 50)/ 3 * 2, self.frame.size.height)];
    [label setTextColor:Color100];
    [label setFont:[UIFont systemFontOfSize:15]];
    [label setTextAlignment:TextLeft];
    [label setText:_item];
    
    UILabel *plus = [[UILabel alloc] initWithFrame:CGRectMake(label.frame.size.width + label.frame.origin.x, 0, (self.frame.size.width  - 50)/ 3, self.frame.size.height)];
    [plus setText:[NSString stringWithFormat:@"%@ %ld元", _plus < 50 ? @"-" : @"+", _num]];
    [plus setTextAlignment:TextRight];
    [plus setFont:label.font];
    if (_plus < 50) {
        [plus setTextColor:[UIColor colorWithRed:0 green:191 / 255.0 blue:121 / 255.0 alpha:1]];
    }
    else {
        [plus setTextColor:[UIColor colorWithRed:245 / 255.0 green:38 / 255.0 blue:47 / 255.0 alpha:1]];
    }
    [img addSubview:label];
    [img addSubview:plus];
    [self.contentView addSubview:img];
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
