//
//  BankCardTableViewCell.h
//  AProject
//
//  Created by wangchonggang on 2018/3/29.
//  Copyright © 2018年 wangchonggang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BankCardTableViewCell : UITableViewCell
@property (nonatomic, strong)UIImageView *CardImg;
@property (nonatomic, strong)UIImageView *BankLogo;
@property (nonatomic, strong)UIView *LogoBackView;
@property (nonatomic, strong)UILabel *BankName;
@property (nonatomic, strong)UILabel *CardType;
@property (nonatomic, strong)UILabel *CardNum;
@end

@interface BankCardAddTableViewCell : UITableViewCell
@property (nonatomic, strong)UIImageView *CardImg;
@property (nonatomic, strong)UIImageView *CardAdd;
@end
