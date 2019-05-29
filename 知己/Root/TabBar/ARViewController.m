//
//  ARViewController.m
//  知己
//
//  Created by 周天荣 on 2019/5/26.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import "ARViewController.h"
#import "arController.h"

@interface ARViewController ()
@end

@implementation ARViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.tag = 100001;
    btn1.backgroundColor = [UIColor purpleColor];
    btn1.frame = CGRectMake(0, 0, 200, 200);
    btn1.center = CGPointMake(self.view.bounds.size.width*0.5, self.view.bounds.size.height*0.5 - 150);
    btn1.layer.cornerRadius = 100;
    [btn1 setTitle:@"返回" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.tag = 100002;
    btn2.backgroundColor = [UIColor grayColor];
    btn2.frame = CGRectMake(0, 0, 200, 200);
    btn2.center = CGPointMake(self.view.bounds.size.width*0.5, self.view.bounds.size.height*0.5 + 150);
    btn2.layer.cornerRadius = 100;
    [btn2 setTitle:@"小方块" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
}

- (void)btnClick:(UIButton *)btn{
    switch (btn.tag) {
        case 100001:{
            [self dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        case 100002:{
            [self presentViewController:[[arController alloc]init] animated:YES completion:nil];
        }
            break;
        default:
            break;
    }
}

@end
