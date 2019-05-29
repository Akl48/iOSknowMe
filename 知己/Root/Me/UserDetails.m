//
//  UserDetails.m
//  KnowMe
//
//  Created by Anthony Zhang on 2018/12/19.
//  Copyright © 2018 周天荣. All rights reserved.
//

#import "UserDetails.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface UserDetails ()

@end

@implementation UserDetails

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *details = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [details setText:@"用户详情"];
    
    [self.view addSubview:details];
    
    _back = [[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-30)/2, SCREEN_HEIGHT-80, 30, 30)];
    [_back setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [_back addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_back];
    
    
}


- (void)pop {
    [self dismissViewControllerAnimated:YES completion:nil];
}







@end
