//
//  MineViewController.h
//  知己
//
//  Created by Anthony Zhang on 2019/5/26.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MineViewController : UIViewController

@property (nonatomic,strong) UIView *headView;
@property (nonatomic,strong) UIImageView *headBackground;
@property (nonatomic,strong) UIImageView *headImageView;
@property (nonatomic,strong) UILabel *userName;
@property (nonatomic,strong) UIButton *userDetails;
@property (nonatomic,strong) UIButton *myCollection;
@property (nonatomic,strong) UIButton *myFortune;
@property (nonatomic,strong) UIButton *myPurchase;
@property (nonatomic,strong) UIButton *getHelp;
@property (nonatomic,strong) UIButton *contactUs;

@end

NS_ASSUME_NONNULL_END
