//
//  CGTableViewCell.h
//  Hotel
//
//  Created by 王崇刚-CityFruit on 2018/11/19.
//  Copyright © 2018 王崇刚-CityFruit. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CGTableViewCell : UITableViewCell

@end

@interface CGHugeTableViewCell : UITableViewCell
@property (nonatomic, strong)NSDictionary *dic;
@end

NS_ASSUME_NONNULL_END
