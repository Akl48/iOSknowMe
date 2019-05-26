//
//  CardViewController.m
//  知己
//
//  Created by 周天荣 on 2019/5/26.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import "CardViewController.h"

@interface CardViewController ()

@end

@implementation CardViewController

- (instancetype)init{
    if(self = [super init])
    {
        self.tabBarItem.title = @"知识";
        // 设置图片,只有设置图片的渲染模式，才能看到图片
        self.tabBarItem.image = [[UIImage imageNamed:@"知识"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
