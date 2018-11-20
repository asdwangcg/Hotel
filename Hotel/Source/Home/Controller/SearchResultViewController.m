//
//  SearchResultViewController.m
//  Hotel
//
//  Created by 王崇刚-CityFruit on 2018/11/19.
//  Copyright © 2018 王崇刚-CityFruit. All rights reserved.
//

#import "SearchResultViewController.h"
#import "DetailViewController.h"
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
        NSMutableDictionary *dibai = [NSMutableDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"dibai"], @"image", @"迪拜帆船七星級酒店(装修中，预计2018年12月开业)", @"title", @"4.7分/277條評論 交通便利\n距我200km | 迪拜", @"point", @[@"太陽權益", @"專票抵6%"], @"discout", @"5888", @"price", [UIImage imageNamed:@"dibai1"], @"image1", [UIImage imageNamed:@"dibai2"], @"image2", [UIImage imageNamed:@"dibai3"], @"image3", [UIImage imageNamed:@"dibai4"], @"image4", [UIImage imageNamed:@"dibai5"], @"image5", @"2008年07月開業    ·高端型", @"type", nil];
        NSMutableDictionary *zonglv = [NSMutableDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"zonglv"], @"image", @"棕櫚島亞特蘭蒂斯酒店", @"title", @"4.9分/3157條評論 早餐種類豐富\n 距我207km | 迪拜/棕櫚島", @"point", @[@"太陽權益", @"免費停車", @"下午茶", @"雞尾酒"], @"discout", @"6999", @"price", [UIImage imageNamed:@"zonglv1"], @"image1", [UIImage imageNamed:@"zonglv2"], @"image2", [UIImage imageNamed:@"zonglv3"], @"image3", [UIImage imageNamed:@"zonglv4"],@"image4", [UIImage imageNamed:@"zonglv5"],  @"image5", @"2012年03月開業    ·高端型", @"type",nil];
        NSMutableDictionary *xinpujing = [NSMutableDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"xinpujing"], @"image", @"澳門新葡京酒店(Grand Lisboa Macau)", @"title", @"4.9分/3157條評論 早餐種類豐富\n 距我207km | 澳門半島葡京路", @"point", @[@"休閒度假", @"浪漫情侶", @"商務出行", @"雞尾酒"], @"discout", @"1674", @"price", [UIImage imageNamed:@"xinpujing1"], @"image1", [UIImage imageNamed:@"xinpujing2"], @"image2", [UIImage imageNamed:@"xinpujing3"], @"image3", [UIImage imageNamed:@"xinpujing4"],@"image4", [UIImage imageNamed:@"xinpujing5"],  @"image5", @"1998年05月開業    ·豪華型", @"type",nil];
        
        
        NSMutableDictionary *yongli = [NSMutableDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"yongli"], @"image", @"澳門永利皇宮酒店(Wynn Palace)", @"title", @"4.9分/3157條評論 早餐種類豐富\n 距我807km | 凼仔澳門路", @"point", @[@"休閒度假", @"浪漫情侶", @"商務出行", @"雞尾酒"], @"discout", @"2323", @"price", [UIImage imageNamed:@"yongli1"], @"image1", [UIImage imageNamed:@"yongli2"], @"image2", [UIImage imageNamed:@"yongli3"], @"image3", [UIImage imageNamed:@"yongli4"],@"image4", [UIImage imageNamed:@"yongli5"],  @"image5", @"2000年07月開業    ·豪華型", @"type",nil];
        
        NSMutableDictionary *siji = [NSMutableDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"siji"], @"image", @"澳門四季酒店(Four Seasons Hotel Macao)", @"title", @"4.9分/3157條評論 前台熱情\n 距我1007km | 澳門凼仔望德聖母灣", @"point", @[@"休閒度假", @"浪漫情侶", @"商務出行", @"雞尾酒"], @"discout", @"999", @"price", [UIImage imageNamed:@"siji1"], @"image1", [UIImage imageNamed:@"siji2"], @"image2", [UIImage imageNamed:@"siji3"], @"image3", [UIImage imageNamed:@"siji4"],@"image4", [UIImage imageNamed:@"siji5"],  @"image5", @"2006年07月開業    ·高端型", @"type",nil];
        
        NSMutableDictionary *yinhe = [NSMutableDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"yinhe"], @"image", @"澳門銀河酒店(Galaxy Hotel)", @"title", @"4.9分/3157條評論 游泳方便，餐廳很好\n 距我2007km | 路氹路氹城", @"point", @[@"休閒度假", @"浪漫情侶", @"親子酒店", @"雞尾酒"], @"discout", @"1752", @"price", [UIImage imageNamed:@"yinhe1"], @"image1", [UIImage imageNamed:@"yinhe2"], @"image2", [UIImage imageNamed:@"yinhe3"], @"image3", [UIImage imageNamed:@"yinhe4"],@"image4", [UIImage imageNamed:@"yinhe5"],  @"image5", @"2001年07月開業    ·舒適型", @"type",nil];
        [dataArr addObject:dibai];
        [dataArr addObject:zonglv];
        [dataArr addObject:xinpujing];
        [dataArr addObject:yongli];
        [dataArr addObject:siji];
        [dataArr addObject:yinhe];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self Back];
    [self layout];
}

- (void)layout {
    
    UIView *searchheadview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 834 / 2, 98 / 2)];
    UIImageView *searchhead = [[UIImageView alloc] initWithFrame:CGRectMake(0, (searchheadview.frame.size.height - 98 / 3) / 2, 834 / 3, 98 / 3)];
    [searchhead setImage:[UIImage imageNamed:@"searchhead"]];
    [searchheadview addSubview:searchhead];
    [self.navigationItem setTitleView:searchheadview];
    
    UIImageView *searchhead1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 111 * self.view.frame.size.width / 1125)];
    [searchhead1 setImage:[UIImage imageNamed:@"searchhead1"]];
    [self.view addSubview:searchhead1];
    
    UIScrollView *headScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, searchhead1.frame.size.height + searchhead1.frame.origin.y, self.view.frame.size.width, 50)];
    [headScroll setBackgroundColor:[UIColor colorWithRed:244 / 255.0 green:244 / 255.0 blue:244 / 255.0 alpha:1]];
    NSArray *headArr = @[@"收藏酒店", @"曾住酒店", @"迪拜", @"上海", @"帆船酒店", @"棕櫚島", @"麗思卡"];
    CGFloat ori_x = 5;
    for (int i = 0; i < [headArr count]; i ++) {
        UIButton *headButton = CustomBtn;
        [headButton setFrame:CGRectMake(ori_x, 10, ([headArr[i] length] + 2) * 15, headScroll.frame.size.height - 20)];
        [headButton setTitle:headArr[i] forState:StaNormal];
        [headButton setBackgroundColor:[UIColor whiteColor]];
        [headButton.layer setBorderWidth:1];
        [headButton.layer setCornerRadius:1];
        [headButton.layer setBorderColor:[UIColor colorWithRed:197 / 255.0 green:197 / 255.0 blue:197 / 255.0 alpha:1].CGColor];
        [headButton setTitleColor:[UIColor colorWithRed:100 / 255.0 green:100 / 255.0 blue:100 / 255.0 alpha:1] forState:StaNormal];
        [headButton.titleLabel setFont:[UIFont systemFontOfSize:13]];
        [headScroll addSubview:headButton];
        ori_x += headButton.frame.size.width + 10;
    }
    [headScroll setContentSize:CGSizeMake(ori_x, 0)];
    [headScroll setShowsHorizontalScrollIndicator:NO];
    [self.view addSubview:headScroll];
    
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, headScroll.frame.size.height + headScroll.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height - self.NavigationStatusbarHeight - headScroll.frame.size.height - headScroll.frame.origin.y) style:UITableViewStylePlain];
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
    if (indexPath.row % 4 == 0) {
        return self.view.frame.size.height / 2;
    }
    return self.view.frame.size.height / 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 4 == 0) {
        CellInit(CGHugeTableViewCell, @"huge");
        cell.dic = dataArr[indexPath.row];
        return cell;
    }
    else {
        CellInit(CGTableViewCell, @"cell");
        cell.dic = dataArr[indexPath.row];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 4 == 0) {
        push(DetailHugeViewController);
        vc.dic = dataArr[indexPath.row];
    }
    else {
        push(DetailViewController);
        vc.dic = dataArr[indexPath.row];
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
