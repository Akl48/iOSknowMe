//
//  todayStoryView.h
//  知己
//
//  Created by Anthony Zhang on 2019/5/26.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface todayStoryView : UIView

@property (nonatomic,strong) UILabel *title;
@property (nonatomic,strong) UILabel *intro;
@property (nonatomic,strong) UIImageView *imageView;

- (instancetype)initWithValue:(NSString*)title :(NSString*)intro :(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
