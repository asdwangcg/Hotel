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

//- (NSString *)getDeviceName
//{
//    struct utsname systemInfo;
//    uname(&systemInfo);
//    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
//
//    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
//    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
//    if ([deviceString isEqualToString:@"iPhone3,3"])    return @"iPhone 4";
//    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
//    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
//    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
//    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
//    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (GSM+CDMA)";
//    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
//    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (GSM+CDMA)";
//    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
//    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
//    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
//    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
//    if ([deviceString isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
//    // 日行两款手机型号均为日本独占，可能使用索尼FeliCa支付方案而不是苹果支付
//    if ([deviceString isEqualToString:@"iPhone9,1"])    return @"国行、日版、港行iPhone 7";
//    if ([deviceString isEqualToString:@"iPhone9,2"])    return @"港行、国行iPhone 7 Plus";
//    if ([deviceString isEqualToString:@"iPhone9,3"])    return @"美版、台版iPhone 7";
//    if ([deviceString isEqualToString:@"iPhone9,4"])    return @"美版、台版iPhone 7 Plus";
//    if ([deviceString isEqualToString:@"iPhone10,1"])   return @"国行(A1863)、日行(A1906)iPhone 8";
//    if ([deviceString isEqualToString:@"iPhone10,4"])   return @"美版(Global/A1905)iPhone 8";
//    if ([deviceString isEqualToString:@"iPhone10,2"])   return @"国行(A1864)、日行(A1898)iPhone 8 Plus";
//    if ([deviceString isEqualToString:@"iPhone10,5"])   return @"美版(Global/A1897)iPhone 8 Plus";
//    if ([deviceString isEqualToString:@"iPhone10,3"])   return @"国行(A1865)、日行(A1902)iPhone X";
//    if ([deviceString isEqualToString:@"iPhone10,6"])   return @"美版(Global/A1901)iPhone X";
//
//    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
//    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
//    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
//    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
//    if ([deviceString isEqualToString:@"iPod5,1"])      return @"iPod Touch (5 Gen)";
//
//    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
//    if ([deviceString isEqualToString:@"iPad1,2"])      return @"iPad 3G";
//    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
//    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2";
//    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
//    if ([deviceString isEqualToString:@"iPad2,4"])      return @"iPad 2";
//    if ([deviceString isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
//    if ([deviceString isEqualToString:@"iPad2,6"])      return @"iPad Mini";
//    if ([deviceString isEqualToString:@"iPad2,7"])      return @"iPad Mini (GSM+CDMA)";
//    if ([deviceString isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
//    if ([deviceString isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM+CDMA)";
//    if ([deviceString isEqualToString:@"iPad3,3"])      return @"iPad 3";
//    if ([deviceString isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
//    if ([deviceString isEqualToString:@"iPad3,5"])      return @"iPad 4";
//    if ([deviceString isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
//    if ([deviceString isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
//    if ([deviceString isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
//    if ([deviceString isEqualToString:@"iPad4,4"])      return @"iPad Mini 2 (WiFi)";
//    if ([deviceString isEqualToString:@"iPad4,5"])      return @"iPad Mini 2 (Cellular)";
//    if ([deviceString isEqualToString:@"iPad4,6"])      return @"iPad Mini 2";
//    if ([deviceString isEqualToString:@"iPad4,7"])      return @"iPad Mini 3";
//    if ([deviceString isEqualToString:@"iPad4,8"])      return @"iPad Mini 3";
//    if ([deviceString isEqualToString:@"iPad4,9"])      return @"iPad Mini 3";
//    if ([deviceString isEqualToString:@"iPad5,1"])      return @"iPad Mini 4 (WiFi)";
//    if ([deviceString isEqualToString:@"iPad5,2"])      return @"iPad Mini 4 (LTE)";
//    if ([deviceString isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
//    if ([deviceString isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
//    if ([deviceString isEqualToString:@"iPad6,3"])      return @"iPad Pro 9.7";
//    if ([deviceString isEqualToString:@"iPad6,4"])      return @"iPad Pro 9.7";
//    if ([deviceString isEqualToString:@"iPad6,7"])      return @"iPad Pro 12.9";
//    if ([deviceString isEqualToString:@"iPad6,8"])      return @"iPad Pro 12.9";
//
//    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
//    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
//
//    return @"iPhone X";
//}

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
