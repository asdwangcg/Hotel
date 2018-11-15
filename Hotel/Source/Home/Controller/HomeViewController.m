//
//  HomeViewController.m
//  Hotel
//
//  Created by 王崇刚-CityFruit on 2018/11/14.
//  Copyright © 2018 王崇刚-CityFruit. All rights reserved.
//

#import "HomeViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface HomeViewController ()<UIScrollViewDelegate>

@end

@implementation HomeViewController {
    AVPlayer *player;
    UIScrollView *mainScroll;
    UIPageControl *page;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self config];
    [self viewLayout];
    [self itemLayout];
}

- (void)viewLayout {
    mainScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - self.TabbarHeight)];
    [mainScroll setPagingEnabled:YES];
    mainScroll.delegate = self;
    if (@available(iOS 11.0, *)) {
        [UIScrollView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
    }
    [mainScroll setBounces:NO];
    [mainScroll setShowsHorizontalScrollIndicator:NO];
    [mainScroll setContentSize:CGSizeMake(self.view.frame.size.width * 2, 0)];

    UIView *movView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, mainScroll.frame.size.height)];
    player = [[AVPlayer alloc] initWithURL:[NSURL URLWithString:@"http://ws-www.hantinghotels.com/app_h5/Images/NewIndexImg/abb245fad1d211e88384005056b478cb20181017.mp4"]];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    [movView.layer addSublayer:playerLayer];
    playerLayer.videoGravity = AVLayerVideoGravityResize;
    playerLayer.frame = [UIScreen mainScreen].bounds;
    [player play];
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 0, mainScroll.frame.size.width, mainScroll.frame.size.height)];
    [img setImage:[UIImage imageNamed:@"image?"]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinished:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    [mainScroll addSubview:movView];
    [mainScroll addSubview:img];
    
    [self.view addSubview:mainScroll];
}

- (void)itemLayout {
    UIButton *search = CustomBtn;
    [search setFrame:CGRectMake(0, 200, self.view.frame.size.width, 30)];
    [search setTitle:@"从这里搜索酒店" forState:StaNormal];
    [search setImage:[UIImage imageNamed:@"search"] forState:StaNormal];
    
    UIView *sep = [[UIView alloc] initWithFrame:CGRectMake(30, search.frame.size.height + search.frame.origin.y, search.frame.size.width - 60, 1)];
    [sep setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:search];
    [self.view addSubview:sep];
    
    NSArray *btnA = @[@"交通", @"商城", @"签到", @"特惠"];
    CGFloat ori_x = sep.frame.origin.x;
    for (int i = 0; i < [btnA count]; i ++) {
        UIButton *button = CustomBtn;
        [button setFrame:CGRectMake(ori_x, sep.frame.size.height + sep.frame.origin.y + 20, (sep.frame.size.width / 11) * 2, search.frame.size.height / 2)];
        [button setTitle:btnA[i] forState:StaNormal];
        [button.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [button setTitleColor:[UIColor whiteColor] forState:StaNormal];
        [button setImage:[UIImage imageNamed:btnA[i]] forState:StaNormal];
        [self.view addSubview:button];
        ori_x = button.frame.size.width + button.frame.origin.x + (sep.frame.size.width / 11);
    }
    
    page = [[UIPageControl alloc] initWithFrame:CGRectZero];
    [self.view addSubview:page];
    [page setNumberOfPages:2];
    [page mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self->mainScroll);
        make.right.equalTo(self.view).with.offset(-10);
        make.width.height.mas_equalTo(50);
    }];
    
    UIImageView *logoView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [logoView setImage:[UIImage imageNamed:@"qqzone"]];
    [self.view addSubview:logoView];
    [logoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(60);
        make.bottom.equalTo(self->mainScroll).offset(-150);
    }];
    
    UILabel *logodes = [[UILabel alloc] initWithFrame:CGRectZero];
    [logodes setText:@"腾讯游戏,\n     腾讯游戏平台(WeGame,即原TGP),腾讯全球游戏开放平台。平台致力于发现全球好游戏,提供游戏资讯、购买、下载、助手、直播和社区等一站式游戏服务,满足优质汉化、社交..."];
    [logodes setNumberOfLines:0];
    [logodes setTextColor:[UIColor whiteColor]];
    [logodes setFont:[UIFont systemFontOfSize:14]];
    [self.view addSubview:logodes];
    [logodes mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(logoView);
        make.height.equalTo(logoView);
        make.width.mas_equalTo(250);
        make.top.equalTo(logoView.mas_bottom).offset(20);
    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [page setCurrentPage:scrollView.contentOffset.x / self.view.frame.size.width];
}

- (void)playbackFinished:(NSNotification *)notifation {
    [player seekToTime:kCMTimeZero];
    [player play];
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
