//
//  QRCodeViewController.m
//  Hotel
//
//  Created by 王崇刚-CityFruit on 2018/11/21.
//  Copyright © 2018 王崇刚-CityFruit. All rights reserved.
//

#import "QRCodeViewController.h"

@interface QRCodeViewController ()

@end

@implementation QRCodeViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:NO];
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"付款碼";
    [self layout];
    [self config];
    [self Back];
}

- (void)layout {
    UIScrollView *mainScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - self.NavigationStatusbarHeight - self.TabbarHeight)];
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width / 1125 * 1608)];
    [image setUserInteractionEnabled:YES];
    [image setImage:[UIImage imageNamed:@"QR"]];
    [mainScroll addSubview:image];
    
    [mainScroll setContentSize:CGSizeMake(self.view.frame.size.width, image.frame.size.height + image.frame.origin.y)];
    [self.view addSubview:mainScroll];
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
