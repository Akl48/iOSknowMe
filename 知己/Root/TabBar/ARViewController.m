//
//  ARViewController.m
//  知己
//
//  Created by 周天荣 on 2019/5/26.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import "ARViewController.h"

@interface ARViewController ()

@end

@implementation ARViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
