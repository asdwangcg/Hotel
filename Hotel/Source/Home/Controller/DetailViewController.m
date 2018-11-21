//
//  DetailViewController.m
//  Hotel
//
//  Created by 王崇刚-CityFruit on 2018/11/20.
//  Copyright © 2018 王崇刚-CityFruit. All rights reserved.
//

#import "DetailViewController.h"
#import "RoomBookingViewController.h"
@interface DetailViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation DetailViewController {
    UIScrollView *mainScroll;
    BOOL showList;
    UITableView *listTable;
    UIButton * detailRoom;
    UIImageView *detailBottom;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
    showList = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self config];
    [self layout];
    [self back];
}

- (void)layout {
    mainScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:mainScroll];
    
    CGFloat ori_x = 0;
    CGFloat ori_y = 0;
    CGFloat siz_w = self.view.frame.size.width / 2;
    for (int i = 1; i < 6; i ++) {
        if (i == 3) {
            ori_x = 0;
            ori_y = self.view.frame.size.width / 2;
            siz_w = self.view.frame.size.width / 3;
        }
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(ori_x, ori_y, siz_w, siz_w)];
        [image setImage:_dic[[NSString stringWithFormat:@"image%d", i]]];
        [mainScroll addSubview:image];
        ori_x += image.frame.size.width;
    }
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, ori_y + siz_w, self.view.frame.size.width - 20, 50)];
    [title setText:_dic[@"title"]];
    [title setTextAlignment:TextLeft];
    [title setFont:[UIFont systemFontOfSize:20]];
    [mainScroll addSubview:title];
    
    UILabel *time = [[UILabel alloc] initWithFrame:CGRectMake(title.frame.origin.x, title.frame.origin.y + title.frame.size.height, title.frame.size.width, title.frame.size.height / 2)];
    [time setTextAlignment:title.textAlignment];
    [time setTextColor:Color100];
    [time setFont:[UIFont systemFontOfSize:14]];
    [time setText:_dic[@"type"]];
    [mainScroll addSubview:time];
    
    UIImageView *placeImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, time.frame.size.height + time.frame.origin.y, time.frame.size.width, 401 * self.view.frame.size.width / 1125)];
    [placeImg setImage:[UIImage imageNamed:@"place"]];
    [mainScroll addSubview:placeImg];
    
    UIImageView *detailCenter = [[UIImageView alloc] initWithFrame:CGRectMake(0, placeImg.frame.origin.y + placeImg.frame.size.height, self.view.frame.size.width, self.view.frame.size.width / 1125 * 342)];
    [detailCenter setImage:[UIImage imageNamed:@"detailcenter"]];
    [mainScroll addSubview:detailCenter];
    
    detailRoom = CustomBtn;
    [detailRoom setFrame:CGRectMake(0, detailCenter.frame.size.height + detailCenter.frame.origin.y, self.view.frame.size.width, self.view.frame.size.width / 1125 * 753)];
    [detailRoom setBackgroundImage:[UIImage imageNamed:@"detailroom"] forState:StaNormal];
    [detailRoom addTarget:self action:@selector(roomAction) forControlEvents:tpi];
    [mainScroll addSubview:detailRoom];
    
    detailBottom = [[UIImageView alloc] initWithFrame:CGRectMake(0, detailRoom.frame.size.height + detailRoom.frame.origin.y, self.view.frame.size.width, self.view.frame.size.width / 1125 * 1222)];
    [detailBottom setImage:[UIImage imageNamed:@"detailbottom"]];
    [mainScroll addSubview:detailBottom];

    
    [mainScroll setContentSize:CGSizeMake(0, detailBottom.frame.origin.y + detailBottom.frame.size.height)];
}



- (void)roomAction {
    if (!showList) {
        listTable = [[UITableView alloc] initWithFrame:CGRectMake(0, detailRoom.frame.size.height + detailRoom.frame.origin.y, self.view.frame.size.width, self.view.frame.size.width / 1225 * 275 + self.view.frame.size.width / 1225 * 225 * 6) style:UITableViewStylePlain];
        listTable.delegate = self;
        listTable.dataSource = self;
        [mainScroll addSubview:listTable];
        [detailBottom setFrame:CGRectMake(0, listTable.frame.size.height + listTable.frame.origin.y, self.view.frame.size.width, self.view.frame.size.width / 1125 * 1222)];
        [mainScroll setContentSize:CGSizeMake(0, detailBottom.frame.origin.y + detailBottom.frame.size.height)];
        showList = !showList;
    }
    else {
        [listTable removeFromSuperview];
        [detailBottom setFrame:CGRectMake(0, detailRoom.frame.size.height + detailRoom.frame.origin.y, self.view.frame.size.width, self.view.frame.size.width / 1125 * 1222)];
        [mainScroll setContentSize:CGSizeMake(0, detailBottom.frame.origin.y + detailBottom.frame.size.height)];
        showList = !showList;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 4) {
        return self.view.frame.size.width / 1225 * 275;
    }
    else {
        return self.view.frame.size.width / 1225 * 225;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    push(RoomBookingViewController);
    vc.dic = _dic;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellInit(CGRoomListTableViewCell, @"roomList");
    [cell.img setImage:[UIImage imageNamed:[NSString stringWithFormat:@"room%ld", indexPath.row]]];
    return cell;
}

- (void)back {
    UIImageView *BackImg = [[UIImageView alloc] initWithFrame:CGRectMake(10, self.StatusbarHeight, 40 * 1.000, 40 * 1.000)];
    [BackImg setImage:[UIImage imageNamed:@"back"]];
    [BackImg setUserInteractionEnabled:YES];
    [BackImg setAlpha:.7];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BackAction)];
    [BackImg addGestureRecognizer:tap];
    [self.view addSubview:BackImg];
}

- (void)BackAction {
    [self.navigationController popViewControllerAnimated:YES];
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

@interface DetailHugeViewController ()

@end

@implementation DetailHugeViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self Back];
    [self config];
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
