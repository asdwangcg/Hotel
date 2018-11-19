//
//  SearchResultViewController.m
//  Hotel
//
//  Created by 王崇刚-CityFruit on 2018/11/19.
//  Copyright © 2018 王崇刚-CityFruit. All rights reserved.
//

#import "SearchResultViewController.h"
#import "CGTableViewCell.h"
@interface SearchResultViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation SearchResultViewController {
    UITableView *table;
    NSMutableArray *dataArr;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        dataArr = [[NSMutableArray alloc] init];
        NSMutableDictionary *dibai = [NSMutableDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"dibai"], @"image", @"迪拜帆船七星級酒店", @"title", @"4.7分/277條評論 交通便利\n距我200km | 迪拜", @"point", @[@"太陽權益", @"專票抵6%"], @"discout", @"5888", @"price", [UIImage imageNamed:@"dibai1"], @"image1", [UIImage imageNamed:@"dibai2"], @"image2", [UIImage imageNamed:@"dibai3"], @"image3", [UIImage imageNamed:@"dibai4"], @"image4", [UIImage imageNamed:@"dibai5"], @"image5", nil];
        NSMutableDictionary *pudong = [NSMutableDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"zonglv"], @"image", @"上海浦東麗思卡爾頓酒店 ", @"title", @"4.7分/3535人評論 早餐種類豐富\n, 距我207km | 浦東新區/陸家嘴", @"point", @[@"太陽權益", @"普票立取", @"延時退房", @"自助選房"], @"discout", @"2654", @"price", [UIImage imageNamed:@"zonglv1"], @"image1", [UIImage imageNamed:@"zonglv2"], @"image2", [UIImage imageNamed:@"zonglv3"], @"image3", [UIImage imageNamed:@"zonglv4"], @"image4", [UIImage imageNamed:@"zonglv5"], @"image5", nil];
        NSMutableDictionary *zonglv = [NSMutableDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"zonglv"], @"image", @"棕櫚島亞特蘭蒂斯酒店", @"title", @"4.9分/3157條評論 早餐種類豐富\n, 距我207km | 迪拜/棕櫚島", @"point", @[@"太陽權益", @"免費停車", @"下午茶", @"雞尾酒"], @"discout", @"6999", @"price", [UIImage imageNamed:@"zonglv1"], @"image1", [UIImage imageNamed:@"zonglv2"], @"image2", [UIImage imageNamed:@"zonglv3"], @"image3", [UIImage imageNamed:@"zonglv4"],@"image4", [UIImage imageNamed:@"zonglv5"],  @"image5",nil];
        [dataArr addObject:dibai];
        [dataArr addObject:zonglv];
        [dataArr addObject:pudong];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self Back];
    [self layout];
}

- (void)layout {
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - self.NavigationStatusbarHeight) style:UITableViewStylePlain];
    [table setBackgroundColor:[UIColor colorWithRed:244 / 255.0 green:244 / 255.0 blue:244 / 255.0 alpha:1]];
    [table setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    table.delegate = self;
    table.dataSource = self;
    table.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:table];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dataArr count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 3 == 0) {
        return self.view.frame.size.height / 2;
    }
    return self.view.frame.size.height / 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 0) {
        CellInit(CGHugeTableViewCell, @"huge");
        cell.dic = dataArr[indexPath.row];
        return cell;
    }
    else {
        CellInit(CGTableViewCell, @"cell");
//        cell.dic = dataArr[indexPath.row];
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
