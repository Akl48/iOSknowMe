//
//  completeStory.m
//  知己
//
//  Created by Anthony Zhang on 2019/5/29.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import "completeStory.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface completeStory ()

@end
@implementation completeStory

- (instancetype)initWithValues:(NSArray *)values {
    self = [super self];
    if (self) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = values[0];
        _dateLabel = [[UILabel alloc]init];
        _dateLabel.text = values[1];
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.text = values[2];
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    [_headView setBackgroundColor:[UIColor orangeColor]];
    
    [_titleLabel setFrame:CGRectMake(20, 20, SCREEN_WIDTH, 40)];
    [_titleLabel setTextAlignment:NSTextAlignmentLeft];
    [_headView addSubview:_titleLabel];
    
    
    [_dateLabel setFrame:CGRectMake(20, 150, SCREEN_WIDTH, 30)];
    [_headView addSubview:_dateLabel];
    
    [_headView addSubview:_imageView];
    
    [_contentLabel setNumberOfLines:0];
    [_contentLabel setTextColor:[UIColor blackColor]];
    [_contentLabel setFrame:CGRectMake(20, 200, SCREEN_WIDTH-40, SCREEN_HEIGHT-200)];
    
    
    [self.view addSubview:_headView];
    [self.view addSubview:_contentLabel];
    
    
    _back = [[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-30)/2, SCREEN_HEIGHT-80, 30, 30)];
    [_back setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [_back addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_back];
    
}

- (void)pop {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
