//
//  BankCardTableViewCell.m
//  AProject
//
//  Created by wangchonggang on 2018/3/29.
//  Copyright © 2018年 wangchonggang. All rights reserved.
//

#import "BankCardTableViewCell.h"

@implementation BankCardTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.CardImg = [[UIImageView alloc] initWithFrame:CGRectZero];
        [_CardImg setUserInteractionEnabled:YES];
        self.LogoBackView = [[UIView alloc] initWithFrame:CGRectZero];
        self.BankLogo = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.BankName = [[UILabel alloc] initWithFrame:CGRectZero];
        self.CardType = [[UILabel alloc] initWithFrame:CGRectZero];
        self.CardNum = [[UILabel alloc] initWithFrame:CGRectZero];
        
        [_LogoBackView addSubview:_BankLogo];
        [_CardImg addSubview:_LogoBackView];
        [_CardImg addSubview:_BankName];
        [_CardImg addSubview:_CardType];
        [_CardImg addSubview:_CardNum];
        [self.contentView addSubview:_CardImg];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_CardImg setFrame:CGRectMake(60 / 4, 0, self.frame.size.width - 60 / 2, 588 / 4)];
    
    [_LogoBackView setFrame:CGRectMake(38 / 4, 46 / 4, 180 / 4, 180 / 4)];
    [_LogoBackView.layer setCornerRadius:180 / 8];
    [_LogoBackView setBackgroundColor:[UIColor whiteColor]];
    
    [_BankLogo setFrame:CGRectMake(22 / 4, 22 / 4, _LogoBackView.frame.size.width - 22 / 2, _LogoBackView.frame.size.width - 22 / 2)];
    
    [_BankName setFrame:CGRectMake(276 / 4, _LogoBackView.frame.origin.y, _CardImg.frame.size.width - 276 / 4, _LogoBackView.frame.size.height / 2)];
    [_BankName setFont:[UIFont systemFontOfSize:70 / 4]];
    [_BankName setTextAlignment:TextLeft];
    [_BankName setTextColor:[UIColor whiteColor]];
    
    [_CardType setFrame:CGRectMake(_BankName.frame.origin.x, _BankName.frame.origin.y + _BankName.frame.size.height, _BankName.frame.size.width, _BankName.frame.size.height)];
    [_CardType setFont:[UIFont systemFontOfSize:50 / 4]];
    [_CardType setTextAlignment:TextLeft];
    [_CardType setTextColor:[UIColor whiteColor]];

    [_CardNum setFrame:CGRectMake(_LogoBackView.frame.origin.x, _LogoBackView.frame.size.height + _LogoBackView.frame.origin.y + 13 / 4, _CardImg.frame.size.width - _LogoBackView.frame.origin.x * 2, _CardImg.frame.size.height - (_LogoBackView.frame.origin.x + _LogoBackView.frame.size.height))];
    [_CardNum setFont:[UIFont systemFontOfSize:40 / 2]];
    [_CardNum setTextColor:[UIColor whiteColor]];
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

@implementation BankCardAddTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.CardImg = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.CardAdd = [[UIImageView alloc] initWithFrame:CGRectZero];
        
        [_CardImg addSubview:_CardAdd];
        [self.contentView addSubview:_CardImg];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_CardImg setFrame:CGRectMake(60 / 4, 0, self.frame.size.width - 60 / 2, 588 / 4)];
    CAShapeLayer *border = [CAShapeLayer layer];
    
    //虚线的颜色
    border.strokeColor = [UIColor colorWithRed:217 / 255.0 green:217 / 255.0 blue:217 / 255.0 alpha:1].CGColor;
    //填充的颜色
    border.fillColor = [UIColor clearColor].CGColor;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:_CardImg.bounds cornerRadius:5];
    
    //设置路径
    border.path = path.CGPath;
    border.frame = _CardImg.bounds;
    //虚线的宽度
    border.lineWidth = 10 / 4.f;
    //设置线条的样式
    //    border.lineCap = @"square";
    //虚线的间隔
    border.lineDashPattern = @[@10, @5];
    _CardImg.layer.cornerRadius = 30 / 4.f;
    _CardImg.layer.masksToBounds = YES;
    [_CardImg.layer addSublayer:border];
    
    [_CardAdd setFrame:CGRectMake((_CardImg.frame.size.width - 154 / 4) / 2, (_CardImg.frame.size.height - 154 / 4) / 2, 154 / 4, 154 / 4)];
    [_CardAdd setImage:[UIImage imageNamed:@"添加卡片"]];

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
