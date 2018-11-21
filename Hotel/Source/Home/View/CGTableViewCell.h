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
@property (nonatomic, strong)NSDictionary *dic;
@end

@interface CGHugeTableViewCell : UITableViewCell
@property (nonatomic, strong)NSDictionary *dic;
@end

@interface CGRoomListTableViewCell : UITableViewCell
@property (nonatomic, strong)UIImageView *img;
@end

@interface CGOrderComplateListTableViewCell : UITableViewCell
//@property (nonatomic, strong)UIImageView *img;
@end

@interface CGOrderCancelListTableViewCell : UITableViewCell
//@property (nonatomic, strong)UIImageView *img;
@end

@interface CGOrderUnpayListTableViewCell : UITableViewCell
@property (nonatomic, strong)UIImageView *img;
@end

@interface CGOrderButtomListTableViewCell : UITableViewCell
//@property (nonatomic, strong)UIImageView *img;
@end

@interface CGStoredTableViewCell : UITableViewCell
@property (nonatomic, strong)NSString *item;
@property (nonatomic, assign)NSInteger plus;
@property (nonatomic, assign)NSInteger num;
@end
NS_ASSUME_NONNULL_END
