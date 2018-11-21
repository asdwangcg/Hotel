//
//  ShoucangViewController.m
//  Hotel
//
//  Created by 王崇刚-CityFruit on 2018/11/21.
//  Copyright © 2018 王崇刚-CityFruit. All rights reserved.
//

#import "ShoucangViewController.h"
@interface ShoucangViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ShoucangViewController {
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
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self config];
    [self layout];
    [self Back];
}

- (void)layout {
    switch (self.type) {
        case 100:{
            self.title = @"收藏酒店";
            NSMutableDictionary *xinpujing = [NSMutableDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"xinpujing"], @"image", @"澳門新葡京酒店(Grand Lisboa Macau)", @"title", @"4.9分/3157條評論 早餐種類豐富\n 距我207km | 澳門半島葡京路", @"point", @[@"休閒度假", @"浪漫情侶", @"商務出行", @"雞尾酒"], @"discout", @"1674", @"price", [UIImage imageNamed:@"xinpujing1"], @"image1", [UIImage imageNamed:@"xinpujing2"], @"image2", [UIImage imageNamed:@"xinpujing3"], @"image3", [UIImage imageNamed:@"xinpujing4"],@"image4", [UIImage imageNamed:@"xinpujing5"],  @"image5", @"1998年05月開業    ·豪華型", @"type",nil];
            [dataArr addObject:xinpujing];
        }
            break;
        case 101:{
            self.title = @"曾住酒店";
        }
            break;
        case 102:{
            self.title = @"最近瀏覽";
            NSMutableDictionary *zonglv = [NSMutableDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"zonglv"], @"image", @"棕櫚島亞特蘭蒂斯酒店", @"title", @"4.9分/3157條評論 早餐種類豐富\n 距我207km | 迪拜/棕櫚島", @"point", @[@"太陽權益", @"免費停車", @"下午茶", @"雞尾酒"], @"discout", @"6999", @"price", [UIImage imageNamed:@"zonglv1"], @"image1", [UIImage imageNamed:@"zonglv2"], @"image2", [UIImage imageNamed:@"zonglv3"], @"image3", [UIImage imageNamed:@"zonglv4"],@"image4", [UIImage imageNamed:@"zonglv5"],  @"image5", @"2012年03月開業    ·高端型", @"type",nil];
            NSMutableDictionary *xinpujing = [NSMutableDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"xinpujing"], @"image", @"澳門新葡京酒店(Grand Lisboa Macau)", @"title", @"4.9分/3157條評論 早餐種類豐富\n 距我207km | 澳門半島葡京路", @"point", @[@"休閒度假", @"浪漫情侶", @"商務出行", @"雞尾酒"], @"discout", @"1674", @"price", [UIImage imageNamed:@"xinpujing1"], @"image1", [UIImage imageNamed:@"xinpujing2"], @"image2", [UIImage imageNamed:@"xinpujing3"], @"image3", [UIImage imageNamed:@"xinpujing4"],@"image4", [UIImage imageNamed:@"xinpujing5"],  @"image5", @"1998年05月開業    ·豪華型", @"type",nil];
            
            
            NSMutableDictionary *yongli = [NSMutableDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"yongli"], @"image", @"澳門永利皇宮酒店(Wynn Palace)", @"title", @"4.9分/3157條評論 早餐種類豐富\n 距我807km | 凼仔澳門路", @"point", @[@"休閒度假", @"浪漫情侶", @"商務出行", @"雞尾酒"], @"discout", @"2323", @"price", [UIImage imageNamed:@"yongli1"], @"image1", [UIImage imageNamed:@"yongli2"], @"image2", [UIImage imageNamed:@"yongli3"], @"image3", [UIImage imageNamed:@"yongli4"],@"image4", [UIImage imageNamed:@"yongli5"],  @"image5", @"2000年07月開業    ·豪華型", @"type",nil];
            
            NSMutableDictionary *siji = [NSMutableDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"siji"], @"image", @"澳門四季酒店(Four Seasons Hotel Macao)", @"title", @"4.9分/3157條評論 前台熱情\n 距我1007km | 澳門凼仔望德聖母灣", @"point", @[@"休閒度假", @"浪漫情侶", @"商務出行", @"雞尾酒"], @"discout", @"999", @"price", [UIImage imageNamed:@"siji1"], @"image1", [UIImage imageNamed:@"siji2"], @"image2", [UIImage imageNamed:@"siji3"], @"image3", [UIImage imageNamed:@"siji4"],@"image4", [UIImage imageNamed:@"siji5"],  @"image5", @"2006年07月開業    ·高端型", @"type",nil];
            
            NSMutableDictionary *yinhe = [NSMutableDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"yinhe"], @"image", @"澳門銀河酒店(Galaxy Hotel)", @"title", @"4.9分/3157條評論 游泳方便，餐廳很好\n 距我2007km | 路氹路氹城", @"point", @[@"休閒度假", @"浪漫情侶", @"親子酒店", @"雞尾酒"], @"discout", @"1752", @"price", [UIImage imageNamed:@"yinhe1"], @"image1", [UIImage imageNamed:@"yinhe2"], @"image2", [UIImage imageNamed:@"yinhe3"], @"image3", [UIImage imageNamed:@"yinhe4"],@"image4", [UIImage imageNamed:@"yinhe5"],  @"image5", @"2001年07月開業    ·舒適型", @"type",nil];
            [dataArr addObject:zonglv];
            [dataArr addObject:xinpujing];
            [dataArr addObject:yongli];
            [dataArr addObject:siji];
            [dataArr addObject:yinhe];
        }
            break;
        default:
            break;
    }

    if (self.type == 101) {
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width / 1125 * 1669)];
        [img setImage:[UIImage imageNamed:@"cengzhu"]];
        [self.view addSubview:img];
    }
    else {
        UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - self.NavigationStatusbarHeight) style:UITableViewStylePlain];
        table.delegate = self;
        table.dataSource = self;
        [table setBackgroundColor:Color244];
        [table setTableFooterView:[[UIView alloc] init]];
        [self.view addSubview:table];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dataArr count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.view.frame.size.height / 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellInit(CGTableViewCell, @"cell");
    cell.dic = dataArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //    if (indexPath.row % 4 == 0) {
    //        push(DetailHugeViewController);
    //        vc.dic = dataArr[indexPath.row];
    //    }
    //    else {
    push(DetailViewController);
    vc.dic = dataArr[indexPath.row];
    //    }
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
