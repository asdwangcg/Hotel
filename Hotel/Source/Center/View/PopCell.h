//
//  PopCell.h
//  Pop
//
//  Created by wangchonggang on 2016/12/20.
//  Copyright © 2016年 wcg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopModel.h"
@interface PopCell : UITableViewCell
@property (nonatomic, strong)UILabel *TextLabel;
@property (nonatomic, strong)UIImageView *DownImage;
@property (nonatomic, strong)UIImageView *HeaderImage;
@property (nonatomic, strong)PopModel *Model;
@property (nonatomic, assign)NSInteger MessageFrom;
+ (CGFloat)GetHeight:(PopModel *)model;
@end
