//
//  AppDelegate.m
//  Hotel
//
//  Created by 王崇刚-CityFruit on 2018/11/14.
//  Copyright © 2018 王崇刚-CityFruit. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "AssistantViewController.h"
#import "CenterViewController.h"
#import "MineViewController.h"
#import "WalletViewController.h"
//#import "sys/utsname.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
//    if ([[self getDeviceName] containsString:@"iPhone X"]) {
//        CGFloat h = [[UIApplication sharedApplication] statusBarFrame].size.height;
//        [[NSUserDefaults standardUserDefaults] setFloat:h forKey:@"X Height"];
//        [[NSUserDefaults standardUserDefaults] setFloat:24 forKey:@"X Header"];
//        [[NSUserDefaults standardUserDefaults] setFloat:55 forKey:@" BarHeight"];
//    } else {
//        [[NSUserDefaults standardUserDefaults] setFloat:0 forKey:@"X Height"];
//        [[NSUserDefaults standardUserDefaults] setFloat:0 forKey:@"X Header"];
//        [[NSUserDefaults standardUserDefaults] setFloat:49 forKey:@" BarHeight"];
//    }
    
    HomeViewController *home = [[HomeViewController alloc] init];
    home.tabBarItem.title = @"首页";
    home.tabBarItem.image = imageOrigin(@"home");
    home.tabBarItem.selectedImage = imageOrigin(@"home1");
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:home];
    [homeNav.navigationBar setTranslucent:NO];
    [homeNav.navigationBar setHidden:YES];
    
    AssistantViewController *assistant = [[AssistantViewController alloc] init];
    assistant.tabBarItem.title = @"行程助手";
    assistant.tabBarItem.image = imageOrigin(@"assistant");
    assistant.tabBarItem.selectedImage = imageOrigin(@"assistant1");
    UINavigationController *assistantNav = [[UINavigationController alloc] initWithRootViewController:assistant];
    [assistantNav.navigationBar setTranslucent:NO];
    [assistantNav.navigationBar setHidden:YES];
    
    CenterViewController *center = [[CenterViewController alloc] init];
    center.tabBarItem.image = imageOrigin(@"center");
    center.tabBarItem.selectedImage = imageOrigin(@"center1");
    UINavigationController *centerNav = [[UINavigationController alloc] initWithRootViewController:center];
    [centerNav.navigationBar setTranslucent:NO];
    [centerNav.navigationBar setHidden:YES];
    
    WalletViewController *wallet = [[WalletViewController alloc] init];
    wallet.tabBarItem.title = @"钱包";
    wallet.tabBarItem.image = imageOrigin(@"wallet");
    wallet.tabBarItem.selectedImage = imageOrigin(@"wallet1");
    UINavigationController *walletNav = [[UINavigationController alloc] initWithRootViewController:wallet];
    
    [walletNav.navigationBar setTranslucent:NO];
    [walletNav.navigationBar setHidden:NO];
    
    MineViewController *mine = [[MineViewController alloc] init];
    mine.tabBarItem.title = @"我";
    mine.tabBarItem.image = imageOrigin(@"mine");
    mine.tabBarItem.selectedImage = imageOrigin(@"mine1");
    UINavigationController *mineNav = [[UINavigationController alloc] initWithRootViewController:mine];
    [mineNav.navigationBar setTranslucent:NO];
    [mineNav.navigationBar setHidden:YES];
    
    UITabBarController *tab = [[UITabBarController alloc] init];
//    [tab.tabBar setFrame:CGRectMake(tab.tabBar.frame.origin.x, tab.tabBar.frame.origin.y, tab.tabBar.frame.size.width, tab.tabBar.frame.size.height + Xheight)];
//    [tab.tabBar setBackgroundImage:[UIImage new]];
    [tab.tabBar setShadowImage:[UIImage new]];
    tab.tabBar.tintColor = colorHex(0xd4237a);
    tab.tabBar.barTintColor = UIColor.whiteColor;
    tab.selectedIndex = 0;
    [tab setViewControllers:@[homeNav, assistantNav, centerNav, walletNav, mineNav]];
    
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    [self.window setRootViewController:tab];
    [self.window makeKeyAndVisible];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
