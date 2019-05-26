//
//  formerStoryView.h
//  知己
//
//  Created by Anthony Zhang on 2019/5/26.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface formerStoryView : UIView

@property (nonatomic,strong) UILabel *stick;
@property (nonatomic,strong) UILabel *title;
@property (nonatomic,strong) UILabel *date;


- (instancetype)initWithValue:(NSString *)stick :(NSString *)title :(NSString *)date;

@end

NS_ASSUME_NONNULL_END
