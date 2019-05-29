//
//  ADViewController.m
//  知己
//
//  Created by 周天荣 on 2019/5/26.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import "ADViewController.h"
#import "Masonry.h"
@interface ADViewController ()

///广告图
@property (nonatomic,strong) UIImageView *advertisementImageView;
///倒计时
@property (nonatomic,strong) UIButton *skipButton;
///定时器
@property (nonatomic,strong) NSTimer *timer;

@property (nonatomic,assign) NSInteger duration;
@end

@implementation ADViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.duration = 5;
    [self.advertisementImageView addSubview:self.skipButton];
    [self.skipButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(50);
        make.right.equalTo(self.advertisementImageView).offset(-30);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(40);
    }];
}
#pragma mark -lazyloading
- (UIImageView *)advertisementImageView {
    if (_advertisementImageView == nil) {
        _advertisementImageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
        [self.view addSubview:_advertisementImageView];
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"adView" ofType:@"png"];
        [_advertisementImageView setImage:[UIImage imageWithContentsOfFile:filePath]];
        _advertisementImageView.userInteractionEnabled = YES;
    }
    return _advertisementImageView;
}

- (UIButton *)skipButton {
    if (_skipButton == nil) {
        _skipButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _skipButton.layer.cornerRadius = 10;
        _skipButton.clipsToBounds = YES;
        _skipButton.layer.shouldRasterize = YES;
        _skipButton.layer.rasterizationScale = [UIScreen mainScreen].scale;
        [_skipButton setTitle:[NSString stringWithFormat:@"%zds跳过",self.duration] forState:UIControlStateNormal];
        _skipButton.backgroundColor = [UIColor grayColor];
        [_skipButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _skipButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _skipButton.layer.borderWidth = 1;
        [_skipButton addTarget:self action:@selector(countButtonClick) forControlEvents:UIControlEventTouchUpInside];
        _timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(countTime) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    return _skipButton;
}

#pragma mark -点击跳过
- (void)countButtonClick {
    if (self.skipButtonClickBlock) {
        [self invalidatedTimer];
        self.skipButtonClickBlock();
    }
}
#pragma mark -计时
- (void)countTime {
    self.duration --;
    [self.skipButton setTitle:[NSString stringWithFormat:@"%zds跳过",self.duration] forState:UIControlStateNormal];
    if (self.duration <= 0) {
        [self invalidatedTimer];
        //切换根控制器
        if (self.skipButtonClickBlock) {
            self.skipButtonClickBlock();
        }
        return;
    }
}
#pragma mark销毁定时器
- (void)invalidatedTimer {
    [_timer invalidate];
    _timer = nil;
}

@end
