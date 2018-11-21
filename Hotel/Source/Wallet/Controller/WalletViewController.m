//
//  WalletViewController.m
//  Hotel
//
//  Created by 王崇刚-CityFruit on 2018/11/14.
//  Copyright © 2018 王崇刚-CityFruit. All rights reserved.
//

#import "WalletViewController.h"
#import "WalletItemViewController.h"
#import "BankCardViewController.h"
#import "QRCodeViewController.h"
@interface WalletViewController ()

@end

@implementation WalletViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:NO];
    [self.tabBarController.tabBar setHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"太陽錢包";
    [self config];
    [self layout];
}

- (void)layout {
    UIScrollView *mainScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - self.NavigationStatusbarHeight - self.TabbarHeight)];
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width / 1125 * 1925)];
    [image setUserInteractionEnabled:YES];
    [image setImage:[UIImage imageNamed:@"walletdetail"]];
    [mainScroll addSubview:image];
    
    UIButton *qr = CustomBtn;
    [qr setFrame:CGRectMake(0, 0, self.view.frame.size.width / 2, self.view.frame.size.width / 1125 * 302)];
    [qr addTarget:self action:@selector(qrAction) forControlEvents:tpi];
    [image addSubview:qr];
    
    UIButton *bank = CustomBtn;
    [bank setFrame:CGRectMake(self.view.frame.size.width / 2, 0, self.view.frame.size.width / 2, self.view.frame.size.width / 1125 * 302)];
    [bank addTarget:self action:@selector(bankAction) forControlEvents:tpi];
    [image addSubview:bank];
    
    UIButton *chuzhi = CustomBtn;
    [chuzhi setFrame:CGRectMake(0, self.view.frame.size.width / 1125 * 302, self.view.frame.size.width / 4, self.view.frame.size.width / 1125 * 302)];
    [chuzhi addTarget:self action:@selector(chuzhiAction) forControlEvents:tpi];
    [image addSubview:chuzhi];
    
    [mainScroll setContentSize:CGSizeMake(self.view.frame.size.width, image.frame.size.height + image.frame.origin.y)];
    [self.view addSubview:mainScroll];
}

- (void)qrAction {
    push(QRCodeViewController);
}

- (void)chuzhiAction {
    push(WalletItemViewController);
}

- (void)bankAction {
    push(BankCardViewController);
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
