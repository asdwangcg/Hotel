//
//  MineViewController.m
//  Hotel
//
//  Created by 王崇刚-CityFruit on 2018/11/14.
//  Copyright © 2018 王崇刚-CityFruit. All rights reserved.
//

#import "MineViewController.h"
#import "OrderListViewController.h"
#import "ShoucangViewController.h"
@interface MineViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation MineViewController {
    NSArray *imageArr;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        imageArr = @[@"changyong", @"gongsi", @"yinsi", @"yaoqing", @"fankui"];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
    [self.tabBarController.tabBar setHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self config];
    [self layout];
}

- (void)layout {
    UIScrollView *mainScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - self.TabbarHeight)];
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width / 1125 * 1429)];
    [image setUserInteractionEnabled:YES];
    [image setImage:[UIImage imageNamed:@"minetop"]];
    [mainScroll addSubview:image];
    
    UIButton *order = CustomBtn;
    [order setFrame:CGRectMake(0, self.view.frame.size.width / 1125 * 1202, self.view.frame.size.width / 1125 * 230, self.view.frame.size.width / 1125 * 230)];
    [order addTarget:self action:@selector(orderAction) forControlEvents:tpi];
    [image addSubview:order];
    
    for (int i = 0; i < 3; i ++) {
        UIButton *button = CustomBtn;
        [button setFrame:CGRectMake(image.frame.size.width / 3 * i, self.view.frame.size.width / 1125 * 611, image.frame.size.width / 3, image.frame.size.width / 3)];
        [button setTag:100 + i];
        [button addTarget:self action:@selector(topAction:) forControlEvents:tpi];
        [image addSubview:button];
    }
    
    UIView *sep = [[UIView alloc] initWithFrame:CGRectMake(0, image.frame.size.height + image.frame.origin.y, self.view.frame.size.width, 10)];
    [sep setBackgroundColor:Color244];
    [mainScroll addSubview:sep];
    
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, sep.frame.size.height + sep.frame.origin.y + 10, self.view.frame.size.width, self.view.frame.size.width / 1125 * 130 * 5) style:UITableViewStylePlain];
    [table setDelegate:self];
    [table setDataSource:self];
    [table setScrollEnabled:NO];
    [table setBackgroundColor:[UIColor whiteColor]];
    [mainScroll addSubview:table];
    
    [mainScroll setContentSize:CGSizeMake(self.view.frame.size.width, table.frame.size.height + table.frame.origin.y)];
    [self.view addSubview:mainScroll];
}

- (void)orderAction {
    push(OrderListViewController);
}

- (void)topAction:(UIButton *)button {
    push(ShoucangViewController);
    vc.type = button.tag;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.view.frame.size.width / 1125 * 130;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellInit(CGRoomListTableViewCell, @"cell");
    [cell.img setImage:[UIImage imageNamed:imageArr[indexPath.row]]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"開發中，敬請期待" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
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
