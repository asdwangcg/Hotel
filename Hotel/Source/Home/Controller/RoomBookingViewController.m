//
//  RoomBookingViewController.m
//  Hotel
//
//  Created by 王崇刚-CityFruit on 2018/11/20.
//  Copyright © 2018 王崇刚-CityFruit. All rights reserved.
//

#import "RoomBookingViewController.h"
#import "OrderListViewController.h"
@interface RoomBookingViewController ()

@end

@implementation RoomBookingViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:Color244];
    [self layout];
    [self back];
}

- (void)layout {
    UIScrollView *mainScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [mainScroll setShowsVerticalScrollIndicator:NO];
    [self.view addSubview:mainScroll];
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width / 3 * 2)];
    [image setImage:_dic[@"image"]];
    [mainScroll addSubview:image];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, image.frame.size.height / 3 * 2, image.frame.size.width - 20, image.frame.size.height / 3)];
    NSMutableAttributedString *titleAttS = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@\n%@", _dic[@"title"], @"尊敬的會員， 歡迎入住!"]];
    [titleAttS addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:20] range:NSMakeRange(0, [_dic[@"title"] length])];
    [titleAttS addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:15] range:NSMakeRange([_dic[@"title"] length], [[NSString stringWithFormat:@"%@\n%@", _dic[@"title"], @"尊敬的會員， 歡迎入住"] length] - [_dic[@"title"] length])];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:4];
    [titleAttS addAttribute:NSParagraphStyleAttributeName
                          value:paragraphStyle
                          range:NSMakeRange(0, [titleAttS length])];
    [title setTextColor:[UIColor whiteColor]];
    [title setAttributedText:titleAttS];
    [title setNumberOfLines:2];
    [image addSubview:title];
    
    UIImageView *orderDetail = [[UIImageView alloc] initWithFrame:CGRectMake(0, image.frame.origin.y + image.frame.size.height, self.view.frame.size.width, self.view.frame.size.width / 1125 * 1396)];
    [orderDetail setImage:[UIImage imageNamed:@"orderdetail"]];
    [mainScroll addSubview:orderDetail];
    
    UIImageView *cancelDetail = [[UIImageView alloc] initWithFrame:CGRectMake(0, orderDetail.frame.size.height + orderDetail.frame.origin.y, self.view.frame.size.width, self.view.frame.size.width / 1125 * 571)];
    [cancelDetail setImage:[UIImage imageNamed:@"canceldetail"]];
    [mainScroll addSubview:cancelDetail];
    
    UIButton *bottom = CustomBtn;
    [bottom setFrame:CGRectMake(0, self.view.frame.size.height - self.view.frame.size.width / 1125 * 150, self.view.frame.size.width, self.view.frame.size.width / 1125 * 150)];
    [bottom setBackgroundImage:[UIImage imageNamed:@"orderbottom"] forState:StaNormal];
    [bottom addTarget:self action:@selector(orderAction) forControlEvents:tpi];
    [self.view addSubview:bottom];
    
    [mainScroll setContentSize:CGSizeMake(self.view.frame.size.width, cancelDetail.frame.origin.y + cancelDetail.frame.size.height + self.view.frame.size.width / 1125 * 150)];
}


- (void)orderAction {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"訂單成功" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"確定" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *order =  [UIAlertAction actionWithTitle:@"去支付" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        push(OrderListViewController);
        Share *share = [Share share];
        [share.orderArr addObject:self.dic];
    }];
    [alert addAction:cancel];
    [alert addAction:order];
    [self presentViewController:alert animated:YES completion:nil];
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
