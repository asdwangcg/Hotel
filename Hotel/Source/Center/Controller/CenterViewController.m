//
//  CenterViewController.m
//  Hotel
//
//  Created by 王崇刚-CityFruit on 2018/11/14.
//  Copyright © 2018 王崇刚-CityFruit. All rights reserved.
//

#import "CenterViewController.h"
#import "PopModel.h"
@interface CenterViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation CenterViewController{
    NSMutableArray *dataArr;
    UITableView *table;
    UITextField *field;
    UIButton *button;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        dataArr = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self config];
    [self layout];
    [self performSelector:@selector(insert) withObject:nil afterDelay:1];
}

- (void)layout {
//    UIScrollView *mainScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - self.TabbarHeight)];
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width / 1280 * 792)];
    [image setImage:[UIImage imageNamed:@"centertop"]];
    [self.view addSubview:image];
    
    UIImageView *image1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, image.frame.size.height + image.frame.origin.y, self.view.frame.size.width, self.view.frame.size.width / 1125 * 265)];
    [image1 setImage:[UIImage imageNamed:@"centerdetail"]];
    [self.view addSubview:image1];
    
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, image1.frame.size.height + image1.frame.origin.y, image1.frame.size.width, self.view.frame.size.height - image1.frame.size.height - image1.frame.origin.y - 42 - self.TabbarHeight) style:UITableViewStylePlain];
    [table setBackgroundColor:Color244];
    [table setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [table setDelegate:self];
    [table setDataSource:self];
    
    
    field = [[UITextField alloc] initWithFrame:CGRectMake(table.frame.origin.x, table.frame.size.height + table.frame.origin.y, table.frame.size.width - 60, 40)];
    [field.layer setBorderWidth:1];
    [field.layer setBorderColor:colorHex(0xd4237a).CGColor];
    [field.layer setCornerRadius:2];
    [field.layer setMasksToBounds:YES];
    [self.view addSubview:field];
    
    button = [UIButton buttonWithType:0];
    [button setFrame:CGRectMake(field.frame.origin.x + field.frame.size.width, field.frame.origin.y, 60, field.frame.size.height)];
    [button setBackgroundColor:colorHex(0xd4237a)];
    [button setTitle:@"发送" forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    [button.layer setCornerRadius:2];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [self.view addSubview:table];
}

- (void)buttonAction {
    if (field.text.length > 0) {
        PopModel *model = [[PopModel alloc] init];
        model.Ptex = field.text;
        model.Modelheight = [PopCell GetHeight:model];
        model.MesFrom = @"1";
        [dataArr addObject:model];
        [table reloadData];
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:[dataArr count] - 1 inSection:0];
        [table scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
        field.text = @"";
    }
}

- (void)insert {
    PopModel *model = [[PopModel alloc] init];
    model.Ptex = @"您好，有什麼可以幫助到您的?";
    model.Modelheight = [PopCell GetHeight:model];
    model.MesFrom = @"2";
    [dataArr addObject:model];
    [table reloadData];
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:[dataArr count] - 1 inSection:0];
    [table scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    PopModel *model = [dataArr objectAtIndex:indexPath.row];
    return model.Modelheight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dataArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellInit(PopCell, @"pop");
    cell.Model = [dataArr objectAtIndex:indexPath.row];
    [cell setBackgroundColor:[UIColor clearColor]];
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
