//
//  MainViewController.m
//  知己
//
//  Created by Anthony Zhang on 2019/5/25.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import "MainViewController.h"
#import "Main/todayStoryView.h"
#import "Main/formerStoryView.h"
#import "Me/UserDetails.h"
#import "Main/completeStory.h"

@interface MainViewController ()<UIScrollViewDelegate>

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"story" ofType:@"json"];
    NSData *data = [[NSData alloc]initWithContentsOfFile:path];
    NSDictionary *stories = [NSJSONSerialization JSONObjectWithData:data
                                                            options:kNilOptions error:nil];
    
    
    [self loadTimeLabel];
    [self loadTodayLabel];
    [self loadJumpToUser];
    [self loadTodayScrollView:stories];
    [self loadFormerLabbel];
    [self loadFormerScrollView:stories];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;
}

- (void)loadTimeLabel {
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.font = [UIFont systemFontOfSize:15];
    self.timeLabel.textColor = [UIColor grayColor];
    self.timeLabel.textAlignment = NSTextAlignmentLeft;
    self.timeLabel.frame = CGRectMake(20, 30, SCREEN_WIDTH/2, 30);
    NSDate *date = [NSDate date];
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"YYYY-MM-dd"];
    self.timeLabel.text = [format stringFromDate:date];
    [self.view addSubview:self.timeLabel];
}

- (void)loadTodayLabel {
    self.todayLabel = [[UILabel alloc]init];
    self.todayLabel.font = [UIFont systemFontOfSize:30];
    self.todayLabel.textColor = [UIColor blackColor];
    self.todayLabel.textAlignment = NSTextAlignmentLeft;
    self.todayLabel.frame = CGRectMake(20, 60, (SCREEN_WIDTH/3)*2, 30);
    self.todayLabel.text = @"今日趣闻";
    [self.view addSubview:self.todayLabel];
}

- (void)loadJumpToUser {
    self.jumpToUser = [[UIButton alloc]init];
    self.jumpToUser.backgroundColor = [UIColor clearColor];
    self.jumpToUser.frame = CGRectMake(SCREEN_WIDTH-80, 27.5, 60, 60);
    //垃圾离屏渲染走起～
    self.jumpToUser.layer.masksToBounds = YES;
    self.jumpToUser.layer.cornerRadius = 30;
    [self.jumpToUser setImage:[UIImage imageNamed:@"userHeadView"] forState:UIControlStateNormal];
    [self.jumpToUser addTarget:self action:@selector(jumpToUserDetail) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.jumpToUser];
}

- (void)jumpToUserDetail {
    UserDetails *user = [[UserDetails alloc]init];
    [self presentViewController:user animated:YES completion:nil];
}

- (void)loadTodayScrollView:(NSDictionary *)stories {
    self.todayScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 90, SCREEN_WIDTH, 250)];
    self.todayScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*4/5*3+40, 250);
    self.todayScrollView.userInteractionEnabled = YES;
    self.todayScrollView.showsHorizontalScrollIndicator = NO;
    
    NSArray *dates  = [stories valueForKey:@"date"];
    NSArray *titles = [stories valueForKey:@"title"];
    NSArray *intros = [stories valueForKey:@"intro"];
    NSArray *contents = [stories valueForKey:@"content"];
    for (int i=0; i<titles.count; i++) {
        todayStoryView *story = [[todayStoryView alloc]initWithValue:titles[i] :intros[i] :[UIImage imageNamed:@"storyImage"]];
        story.frame = CGRectMake(10+i*(SCREEN_WIDTH*4/5+10), 10, SCREEN_WIDTH*4/5, 240);
        story.titleStr = titles[i];
        story.dateStr = dates[i];
        story.contentStr = contents[i];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(jumpToCompleteStory:)];
        [story addGestureRecognizer:tap];
        [self.todayScrollView addSubview:story];
    }

    [self.view addSubview:self.todayScrollView];
}

- (void)loadFormerLabbel {
    self.formerLabel = [[UILabel alloc]init];
    self.formerLabel.font = [UIFont systemFontOfSize:20];
    self.formerLabel.textColor = [UIColor blackColor];
    self.formerLabel.textAlignment = NSTextAlignmentLeft;
    self.formerLabel.frame = CGRectMake(20, 355, (SCREEN_WIDTH/3)*2, 30);
    self.formerLabel.text = @"往日精彩";
    [self.view addSubview:self.formerLabel];
}


- (void)loadFormerScrollView:(NSDictionary *)stories {
    self.formerScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 400, SCREEN_WIDTH, 200)];
    //self.formerScrollView.backgroundColor = [UIColor grayColor];
    self.formerScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*2, 200);
    self.formerScrollView.userInteractionEnabled = YES;
    self.formerScrollView.showsHorizontalScrollIndicator = NO;
    NSArray *titles = [stories valueForKey:@"title"];
    NSArray *dates  = [stories valueForKey:@"date"];
    for (int i=0; i<titles.count; i++) {
        formerStoryView *story = [[formerStoryView alloc]initWithValue:@"昨天" :titles[i] :dates[i]];
        story.frame = CGRectMake(10+i*(SCREEN_WIDTH*2/5+10), 0, SCREEN_WIDTH*2/5, 180);
        [self.formerScrollView addSubview:story];
    }
    
    
    
    [self.view addSubview:self.formerScrollView];
}

- (void)jumpToCompleteStory:(id)sender {
    
    UITapGestureRecognizer *tap = sender;
    todayStoryView *story = (todayStoryView *)tap.view;
    NSArray *values = [[NSArray alloc]initWithObjects:story.titleStr,story.dateStr,story.contentStr, nil];
    NSLog(@"%@",values);
    completeStory *cs = [[completeStory alloc]initWithValues:values];
    [self.navigationController pushViewController:cs animated:YES];

}


@end
