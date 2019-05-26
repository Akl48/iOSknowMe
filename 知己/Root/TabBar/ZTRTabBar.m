//
//  ZTRTabBar.m
//  知己
//
//  Created by 周天荣 on 2019/5/26.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import "ZTRTabBar.h"


@implementation ZTRTabBar

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat width = self.frame.size.width/5;
    CGFloat height = self.frame.size.height;
    CGFloat btnY = 0;
    int buttonIndex = 0;
    
    for (UIView *view in self.subviews) {
        if(view.class != NSClassFromString(@"UITabBarButton"))
            continue;
        CGFloat btnX = width * buttonIndex;
        if(buttonIndex >= 2){
            btnX += width;
        }
        view.frame = CGRectMake(btnX, btnY, width, height);
        buttonIndex++;
    }
    
    UIButton *mid = [UIButton buttonWithType:UIButtonTypeCustom];
    [mid addTarget:self action:@selector(midClick) forControlEvents:UIControlEventTouchUpInside];
//    [mid setBackgroundImage:[UIImage imageNamed:@"模型"] forState:UIControlStateNormal];
    [mid setImage:[UIImage imageNamed:@"模型"] forState:UIControlStateNormal];
    [mid setBackgroundColor:[UIColor clearColor]];
    mid.layer.cornerRadius = width*0.3;
    mid.layer.borderWidth = 1.0;
    mid.layer.borderColor = [UIColor blackColor].CGColor;
    mid.frame = CGRectMake(0,0, width, height);
    mid.center = CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.5);
//    [mid sizeToFit];
    [self addSubview:mid];
}

- (void)midClick{
    if([self.delegate respondsToSelector:@selector(callForAI)]){
        [self.delegate performSelector:@selector(callForAI)];
    }
}

@end
