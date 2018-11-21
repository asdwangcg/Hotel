//
//  PopCell.m
//  Pop
//
//  Created by wangchonggang on 2016/12/20.
//  Copyright © 2016年 wcg. All rights reserved.
//

#import "PopCell.h"
#define TextFont 32 * CellViewCount
#define TextBg [UIColor clearColor]
#define LeftInsert 40 * CellViewCount
#define UPInsert 20 * CellViewCount
#define PopInsert 10 * CellViewCount
#define KeyWords @"Model"
#define ImageWidth 80 * CellViewCount
#define CellViewCount self.frame.size.width / 375 / 2
#define CurrentFrame [[UIScreen mainScreen] bounds]

typedef NS_ENUM(NSUInteger, MessageFrom) {
    FromMe = 1,
    FromOppsite,
    IsTime,
};
@implementation PopCell

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"Model"];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.TextLabel = [[UILabel alloc] init];
        [_TextLabel setFont:[UIFont systemFontOfSize:TextFont]];
        [_TextLabel setBackgroundColor:TextBg];
        [_TextLabel setNumberOfLines:0];
        
        self.DownImage = [[UIImageView alloc] init];
        [_DownImage addSubview:_TextLabel];
        [self.contentView addSubview:_DownImage];
        [self addObserver:self forKeyPath:@"Model" options:NSKeyValueObservingOptionNew context:nil];
        
        self.HeaderImage = [[UIImageView alloc] init];
        [self.contentView addSubview:_HeaderImage];
    }
    return self;
}

+ (CGFloat)GetHeight:(PopModel *)model{
    PopCell *cell = [[PopCell alloc] init];
    cell.frame = CurrentFrame;
    CGSize size = [cell TextFitSize:model.Ptex];
    return [cell DrawWithSize:size];
}

- (CGFloat)DrawWithSize:(CGSize)size{
    [self ReDraw:size From:[_Model.MesFrom integerValue] == FromMe ? FromMe : FromOppsite];
    return [self ReDraw:size From:[_Model.MesFrom integerValue] == FromMe ? FromMe : FromOppsite];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:KeyWords]) {
//        CGSize size = [self TextFitSize:_Model];
        self.frame = CurrentFrame;
        CGSize size = [self TextFitSize:_Model.Ptex];
        [self DrawWithSize:size];
    }
}

- (CGSize)TextFitSize:(NSString *)Text {
    [_TextLabel setText:Text];
    CGSize size = [_TextLabel sizeThatFits:CGSizeMake(self.frame.size.width / 2, MAXFLOAT)];
    return size;
}

- (CGFloat)ReDraw:(CGSize)CFitSize From:(NSInteger)from{
    UIImage *ima;
    switch (from) {
        case FromMe:
        {
            ima = [UIImage imageNamed:@"Mypop"];
        }
            break;
        case FromOppsite:
        {
            ima = [UIImage imageNamed:@"Opop"];
        }
        case IsTime:
        {
            ima = [UIImage imageNamed:@"Opop"];
        }
        default:
            break;
    }
    
    
    
    ima = [ima resizableImageWithCapInsets:UIEdgeInsetsMake(ima.size.height / 2, ima.size.width / 2, ima.size.height / 2, ima.size.width / 2) resizingMode:UIImageResizingModeStretch];
    
    CGRect frame = CGRectZero;
    CGSize size = CGSizeZero;

    size.height = CFitSize.height > TextFont * 72 / 96 ? CFitSize.height + UPInsert * 2 : TextFont * 72 / 96 + UPInsert * 2;
    size.width = CFitSize.width > self.frame.size.width / 2 ? self.frame.size.width / 2 : CFitSize.width + LeftInsert * 2 + LeftInsert / 2;
    
    
    NSLog(@"%f", self.frame.size.width);
    frame.origin.x = (from == FromMe ? self.frame.size.width - ImageWidth - LeftInsert - size.width - PopInsert : ImageWidth + LeftInsert + PopInsert);
    frame.origin.y = 5;
    
    [_HeaderImage setFrame:CGRectMake(from == FromMe ? self.frame.size.width - LeftInsert - ImageWidth: LeftInsert, frame.origin.y, ImageWidth, ImageWidth)];
    if (from == FromMe) {
        [_HeaderImage setImage:[UIImage imageNamed:@"mychathead"]];
    }
    else {
        [_HeaderImage setImage:[UIImage imageNamed:@"chathead"]];
    }
    
    frame.size = size;
    [_DownImage setFrame:frame];
    [_DownImage setImage:ima];

    frame.origin.x = from == FromMe ? LeftInsert : LeftInsert / 2 * 3;
    frame.origin.y = UPInsert;
    frame.size = CFitSize;
    [_TextLabel setFrame:frame];
    
    return _DownImage.frame.size.height + _DownImage.frame.origin.y + UPInsert;
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
