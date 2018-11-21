//
//  WalletItemViewController.m
//  Hotel
//
//  Created by 王崇刚-CityFruit on 2018/11/21.
//  Copyright © 2018 王崇刚-CityFruit. All rights reserved.
//

#import "WalletItemViewController.h"

@interface WalletItemViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation WalletItemViewController {
    NSMutableArray *dataArr;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:NO];
    [self.tabBarController.tabBar setHidden:YES];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        dataArr = [[NSMutableArray alloc] init];
        NSArray *inArr = @[@"充值", @"訂單返利", @"客戶推薦", @"官方網站-抽獎", @"連續入住"];
        NSArray *outArr = @[@"客房服務", @"自助消費", @"商品購買-礦泉水", @"商品購買-方便麵", @"訂單預付"];
        for (int i = 0; i < 7; i ++) {
            NSMutableDictionary *dic = [NSMutableDictionary dictionary];
            NSInteger plus = arc4random() % 100;
            NSInteger num = arc4random() % 1000;
            [dic setObject:[NSString stringWithFormat:@"%ld", plus] forKey:@"plus"];
            [dic setObject:[NSString stringWithFormat:@"%ld", num] forKey:@"num"];
            if (plus > 50) {
                [dic setObject:inArr[arc4random() % [inArr count]] forKey:@"item"];
            }
            else {
                [dic setObject:outArr[arc4random() % [outArr count]] forKey:@"item"];
            }
            [dataArr addObject:dic];
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的储值";
    [self config];
    [self layout];
    [self Back];
}

- (void)layout {
    UIImageView *topimg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width / 1125 * 405)];
    [topimg setImage:[UIImage imageNamed:@"chuzhi"]];
    [self.view addSubview:topimg];
    
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, topimg.frame.size.height + topimg.frame.origin.y, topimg.frame.size.width, self.view.frame.size.height - topimg.frame.size.height - topimg.frame.origin.y  - self.NavigationStatusbarHeight) style:UITableViewStylePlain];
    [table setBackgroundColor:Color244];
    [table setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [table setDelegate:self];
    [table setDataSource:self];
    [self.view addSubview:table];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.view.frame.size.width / 1125 * 130;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dataArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellInit(CGStoredTableViewCell, @"store");
    cell.plus = [dataArr[indexPath.row][@"plus"] integerValue];
    cell.num = [dataArr[indexPath.row][@"num"] integerValue];
    cell.item = dataArr[indexPath.row][@"item"];
    return cell;
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
