//
//  UIViewController+Base.m
//  Hotel
//
//  Created by 王崇刚-CityFruit on 2018/11/14.
//  Copyright © 2018 王崇刚-CityFruit. All rights reserved.
//

#import "UIViewController+Base.h"

@implementation UIViewController (Base)
- (void)config {
    [self.view setBackgroundColor:[UIColor whiteColor]];
}
-(float)StatusbarHeight{
    return [[UIApplication sharedApplication] statusBarFrame].size.height;
}

-(float)NavigationStatusbarHeight{
    return self.navigationController.navigationBar.frame.size.height + [[UIApplication sharedApplication] statusBarFrame].size.height;
}

-(float)TabbarHeight{
    return self.tabBarController.tabBar.bounds.size.height;
}

- (void)Back {
    UIView *BackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50 * 1.000, 50 * 1.000)];
    UIImageView *BackImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, BackView.frame.size.width / 4, BackView.frame.size.width / 2, BackView.frame.size.height / 2)];
    [BackImg setImage:[UIImage imageNamed:@"返回"]];
    [BackView addSubview:BackImg];
    [BackImg setUserInteractionEnabled:YES];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BackAction)];
    [BackView addGestureRecognizer:tap];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:BackView];
}

- (void)BackAction {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
