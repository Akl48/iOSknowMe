//
//  MineViewController.m
//  知己
//
//  Created by Anthony Zhang on 2019/5/26.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import "MineViewController.h"
#import "Me/UserDetails.h"
#import "restrain.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    
    _headView = [[UIView alloc]initWithFrame:CGRectMake(0, 86, SCREEN_WIDTH, 88)];
    _headBackground = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"headview_background"]];
    [_headBackground setFrame:CGRectMake(0, 0, SCREEN_WIDTH, 88)];
    [_headView addSubview:_headBackground];
    
    _headImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"userHeadView"]];
    _headImageView.frame = CGRectMake(30, 9, 70, 70);
    _headImageView.layer.masksToBounds = YES;
    _headImageView.layer.cornerRadius = 35;
    [_headView addSubview:_headImageView];
    
    _userName = [[UILabel alloc]initWithFrame:CGRectMake(120, 22, 200, 40)];
    [_userName setText:@"Anthony"];
    [_userName setTextAlignment:NSTextAlignmentLeft];
    [_userName setTextColor:[UIColor blackColor]];
    [_userName setFont:[UIFont systemFontOfSize:25]];
    [_headView addSubview:_userName];
    
    _userDetails = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-50, 29, 30, 30)];
    [_userDetails setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
    [_headView addSubview:_userDetails];
    
    _headView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(jump_to_user_details)];
    [_headView addGestureRecognizer:tap];
    
    
    [self.view addSubview:_headView];
    
    
    
    _myCollection = [UIButton new];
    _myPurchase = [UIButton new];
    _myFortune = [UIButton new];
    _getHelp = [UIButton new];
    _contactUs = [UIButton new];
    NSArray *buttons = [NSArray arrayWithObjects:_myCollection,_myFortune,_myPurchase,_getHelp,_contactUs, nil];
    NSArray *names = [NSArray arrayWithObjects:@"我的收藏",@"我的财富",@"购买项目",@"获取帮助",@"联系我们", nil];
    for (int i = 0; i <= 4; i++) {
        [self initButton:buttons[i] withFrame:CGRectMake(0, 220+55*i, SCREEN_WIDTH, 55) withName:names[i]];
    }
}


- (void)initButton :(UIButton *)Button withFrame:(CGRect)CGRectMake withName:(NSString *)Name {
    Button = [[UIButton alloc]initWithFrame:CGRectMake];
    [Button setBackgroundImage:[UIImage imageNamed:@"common_background"] forState:UIControlStateNormal];
    [Button setTitle:Name forState:UIControlStateNormal];
    [Button setTitleEdgeInsets:UIEdgeInsetsMake(10, 0, 10, 200)];
    [Button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    Button.titleLabel.font = [UIFont systemFontOfSize:22.5];
    [Button setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
    [Button setImageEdgeInsets:UIEdgeInsetsMake(10, 330, 10, 10)];
    [self.view addSubview:Button];
}

- (void)jump_to_user_details {
    UserDetails *user = [[UserDetails alloc]init];
    [self presentViewController:user animated:YES completion:nil];
}

@end
