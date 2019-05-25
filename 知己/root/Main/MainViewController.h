//
//  MainViewController.h
//  KnowMe
//
//  Created by 周天荣 on 2018/11/17.
//  Copyright © 2018 周天荣. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface MainViewController : UIViewController


@property (nonatomic,strong) UIView *headView;
@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) UILabel *bigLabel;
@property (nonatomic,strong) UIButton *jump_to_user;

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *titleString;
@property (nonatomic,strong) NSArray *contentString;
@property (nonatomic,strong) NSArray *completeContent;

@end


