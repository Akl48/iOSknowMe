//
//  JUMPViewController.m
//  知己
//
//  Created by 周天荣 on 2019/5/28.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import "JUMPViewController.h"
#import "NewsCard.h"
#import "MessageView.h"
@interface JUMPViewController ()

@property(nonatomic,strong)NewsCard* card;

@end

@implementation JUMPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIView *Barview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    [Barview setBackgroundColor:[UIColor colorWithRed:0.5 green:1 blue:1 alpha:0.5]];
    [self.view addSubview:Barview];
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    [back setBackgroundImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal ];
    back.frame = CGRectMake(10, 20, 40, 40);
    [back addTarget:self action:@selector(backTo) forControlEvents:UIControlEventTouchUpInside];
    [Barview addSubview:back];
    
    UILabel *lab = [[UILabel alloc]init];
    lab.frame = CGRectMake(0, 0, 80, 30);
    lab.center = CGPointMake(Barview.frame.size.width*0.5, Barview.frame.size.height*0.5+10);
    lab.textAlignment = NSTextAlignmentCenter;
    lab.text = @"正文";
    [Barview addSubview:lab];
    
    UIButton *more = [UIButton buttonWithType:UIButtonTypeCustom];
    [more setBackgroundImage:[UIImage imageNamed:@"更多"] forState:UIControlStateNormal ];
    more.frame = CGRectMake(Barview.frame.size.width - 50, 20, 40, 40);
    [more addTarget:self action:@selector(moreTo) forControlEvents:UIControlEventTouchUpInside];
    [Barview addSubview:more];
    
    MessageView *view = [[MessageView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 150)];
    view.card = _card;
    [self.view addSubview:view];
}

- (void)backTo{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)moreTo{
    NSLog(@"更多");
}
- (void)setCard:(NewsCard *)card{
    _card = card;
}

@end
