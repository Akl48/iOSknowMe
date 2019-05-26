//
//  ZTRViewController.m
//  知己
//
//  Created by 周天荣 on 2019/5/24.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import "ZTRViewController.h"
#import "Main/MainViewController.h"
#import "AI/AIViewController.h"
#import "Me/MineViewController.h"


@interface ZTRViewController ()

@end

@implementation ZTRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadAllControllers];
}

- (void)loadAllControllers {
    MainViewController *main = [[MainViewController alloc]init];
    [self addChildViewController:main];
    main.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"首页" image:[UIImage imageNamed:@"首页"] selectedImage:[UIImage imageNamed:@"首页"]];
    
    
    AIViewController *AI = [[AIViewController alloc]init];
    [self addChildViewController:AI];
    AI.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"问答" image:[UIImage  imageNamed:@"问答"] selectedImage:[UIImage imageNamed:@"问答"]];
    
    
    MineViewController *mine = [[MineViewController alloc]init];
    [self addChildViewController:mine];
    mine.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"用户" image:[UIImage imageNamed:@"用户"] selectedImage:[UIImage imageNamed:@"用户"]];
}



@end
