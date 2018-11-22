//
//  MineListDetailViewController.m
//  Hotel
//
//  Created by 王崇刚-CityFruit on 2018/11/22.
//  Copyright © 2018 王崇刚-CityFruit. All rights reserved.
//

#import "MineListDetailViewController.h"

@interface MineListDetailViewController ()

@end

@implementation MineListDetailViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:NO];
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:Color244];
    [self layout];
    [self Back];
}

- (void)layout {
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width / 1125 * _height)];
    [image setImage:[UIImage imageNamed:self.title]];
    [self.view addSubview:image];
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
