//
//  formerStoryView.m
//  知己
//
//  Created by Anthony Zhang on 2019/5/26.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import "formerStoryView.h"
#import "restrain.h"

@implementation formerStoryView

- (instancetype)initWithValue:(NSString *)stick :(NSString *)title :(NSString *)date {
    self = [super init];
    self.backgroundColor = RandomColor;
    
    self.stick = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 30)];
    self.stick.text = stick;
    self.stick.font = [UIFont systemFontOfSize:20]
    ;    self.stick.textColor = [UIColor whiteColor];
    [self addSubview:self.stick];
    
    self.title = [[UILabel alloc]initWithFrame:CGRectMake(10, 50, SCREEN_WIDTH*2/5-10, 30)];
    self.title.text = title;
    self.title.textColor = [UIColor whiteColor];
    self.title.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.title];
    
    self.date = [[UILabel alloc]initWithFrame:CGRectMake(0, 150, SCREEN_WIDTH*2/5, 20)];
    self.date.text = date;
    self.date.textColor = [UIColor  whiteColor];
    self.date.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.date];
    

    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
    
    return self;
}

@end
