//
//  completeStory.h
//  知己
//
//  Created by Anthony Zhang on 2019/5/29.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface completeStory : UIViewController

@property (nonatomic,strong) UIView *headView;
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *dateLabel;
@property (nonatomic,strong) UILabel *contentLabel;
@property (nonatomic,strong) UIButton *back;

- (instancetype)initWithValues:(NSArray *)values;

@end

NS_ASSUME_NONNULL_END
