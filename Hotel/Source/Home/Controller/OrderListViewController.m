//
//  OrderListViewController.m
//  Hotel
//
//  Created by 王崇刚-CityFruit on 2018/11/21.
//  Copyright © 2018 王崇刚-CityFruit. All rights reserved.
//

#import "OrderListViewController.h"

@interface OrderListViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation OrderListViewController {
    UIView *down;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self config];
    [self layout];
    self.title = @"酒店订单";
    [self Back];
}

- (void)layout {
    NSArray *titleA = @[@"全部訂單", @"待支付", @"未入住", @"時租免房"];
    for (int i = 0; i < 4; i ++) {
        UIButton *button = CustomBtn;
        [button setFrame:CGRectMake(self.view.frame.size.width / 4 * i, 0, self.view.frame.size.width / 4, 50)];
        [button setTitleColor:Color100 forState:StaNormal];
        [button setTag:100 + i];
        [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [button setTitle:titleA[i] forState:StaNormal];
        [self.view addSubview:button];
        if (i == 0) {
            down = [[UIView alloc] initWithFrame:CGRectMake(0, button.frame.size.height , button.frame.size.width, 2)];
            [down setBackgroundColor:[UIColor colorWithRed:119 / 255.0 green:44 / 255.0 blue:126 / 255.0 alpha:1]];
            [self.view addSubview:down];
        }
    }
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - self.view.frame.size.width / 1125 * 145, self.view.frame.size.width, self.view.frame.size.width / 1125 * 145)];
    [img setImage:[UIImage imageNamed:@"listdown"]];
    [self.view addSubview:img];
    
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, down.frame.size.height + down.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height - img.frame.size.height - self.NavigationStatusbarHeight)];
    [table setBackgroundColor:Color244];
    [table setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [table setDelegate:self];
    [table setDataSource:self];
    [self.view addSubview:table];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < 2) {
        return self.view.frame.size.width / 1125 * 412 + 10;
    }
    else {
        return self.view.frame.size.width / 1125 * 150;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        CellInit(CGOrderUnpayListTableViewCell, @"com");
        [cell.img setImage:[UIImage imageNamed:@"orderf"]];
        return cell;
    }
    if (indexPath.row == 1) {
        CellInit(CGOrderUnpayListTableViewCell, @"can");
        [cell.img setImage:[UIImage imageNamed:@"orderc"]];
        return cell;
    }
    else {
        CellInit(CGOrderButtomListTableViewCell, @"bottom");
        [cell.contentView setBackgroundColor:[UIColor clearColor]];
        return cell;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
