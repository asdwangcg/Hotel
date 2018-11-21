//
//  BankCardViewController.m
//  AProject
//
//  Created by wangchonggang on 2018/3/29.
//  Copyright © 2018年 wangchonggang. All rights reserved.
//

#import "BankCardViewController.h"
#import "BankCardTableViewCell.h"
@interface BankCardViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation BankCardViewController {
    UITableView *Table;
    NSMutableArray *DataArr;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        DataArr = (NSMutableArray *)@[@{@"name":@"工商銀行", @"type":@"信用卡", @"num":@"6222    1222    1111    9985"}, @{}];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:NO];
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的銀行卡";
    [self config];
    [self Layout];
    [self Back];
}

- (void)Layout {
    Table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - self.NavigationStatusbarHeight) style:UITableViewStylePlain];
    Table.delegate = self;
    Table.dataSource  = self;
    [Table setBackgroundColor:[UIColor clearColor]];
    [Table setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:Table];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [DataArr count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 656 / 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([DataArr[indexPath.row] count] > 0) {
        BankCardTableViewCell *cell = nil;
        static NSString *idf = @"aaa";
        if (cell == nil) {
            cell = [[BankCardTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idf];
        }
        else {
            while ([cell.contentView.subviews lastObject] != nil) {
                [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
            }
        }
        NSDictionary *dic = [DataArr objectAtIndex:indexPath.row];
        if ([[dic objectForKey:@"name"] isEqualToString:@"工商銀行"]) {
            [cell.CardImg setImage:[UIImage imageNamed:@"工行卡片"]];
            [cell.BankLogo setImage:[UIImage imageNamed:@"工行Logo"]];
        }
        [cell.BankName setText:[dic objectForKey:@"name"]];
        [cell.CardType setText:[dic objectForKey:@"type"]];
        [cell.CardNum setText:[dic objectForKey:@"num"]];
        
        [cell setBackgroundColor:[UIColor clearColor]];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
    }
    else {
        BankCardAddTableViewCell *cell = nil;
        static NSString *idf = @"bbb";
        if (cell == nil) {
            cell = [[BankCardAddTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idf];
        }
        else {
            while ([cell.contentView.subviews lastObject] != nil) {
                [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
            }
        }
        [cell setBackgroundColor:[UIColor clearColor]];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
