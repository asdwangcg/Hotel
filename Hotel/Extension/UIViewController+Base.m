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
@end
