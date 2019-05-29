//
//  MainViewController.h
//  知己
//
//  Created by Anthony Zhang on 2019/5/25.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "restrain.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UIViewController


@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) UILabel *todayLabel;
@property (nonatomic,strong) UIButton *jumpToUser;

@property (nonatomic,strong) UIScrollView *todayScrollView;
@property (nonatomic,strong) UILabel *formerLabel;
@property (nonatomic,strong) UIScrollView *formerScrollView;

@end

NS_ASSUME_NONNULL_END
